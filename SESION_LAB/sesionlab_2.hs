-- EJERCICIO 1
-- a) 
[x^2 | x <- [1..50]]
[x^2 | x <- take 50 [1..]]
-- b)
[(x, x^2) | x <- [1..50]]
-- c)
sum [x * abs (sin x) | x <- [1..100]]
-- d)
[3^x | x <- [0..49]]
map (3^) (take 50 [0..])
take 50 (iterate (\x -> (x*3))1)
-- f) Suma de nºs menores que 1000 multiplos de 3 o 5
sum [x | x <- [1..1000], mod x 5 == 0, mod x 3 == 0]
-- g) 
tail [[take 20 (iterate (*x)1)] | x <- [1..20]]
-- h)
tail [[take 20 (iterate (*x)x)] | x <- [1..20]]

--EJERCICIO 2
-- a)
filter2 :: (a -> Bool) -> (a -> Bool) -> [a] -> ([a],[a])
filter2 p q [] = ([],[])
filter2 p q (x:xs) 
    | p x && q x	  		= (x : filter p xs, x : filter q xs)
    | not (p x) && (q x) 	= (filter p xs, x : filter q xs)
    | (p x) && not (q x) 	= (x : filter p xs, filter q xs)
    | otherwise				= (filter p xs, filter q xs)
-- b)
filterxs :: [a] -> [(a -> Bool)] -> [[a]]
filterxs [] (p:ps) = []
filterxs (x:xs) (p:ps) = 
        [ filter (\x -> (p x)) (x:xs) | p <- (p:ps)]

--c)	CON F AUXILIAR UNFILTER
partition :: (a -> Bool) -> [a] -> ([a],[a])
partition p [] = ([],[]) 
partition p (x:xs) 
		| p x 						= (x : filter p xs, filter (not . p) xs)
		| not (p x)					= (filter p xs, x : filter (not . p) xs)

-- f)
iguales:: (Eq a2, Ord a1, Num a1) => (a1 -> a2) -> (a1 -> a2) -> a1 -> a1 -> Bool
iguales f g n m 
    | n <= m && (f n == g n)        = iguales f g (n+1) m
    | n <= m                        = False
    | n > m                         = True

-- h)
mayoria:: (a -> Bool) -> [a] -> Bool
mayoria p []                        = True
mayoria p (x:xs) 
    | length (filter (\x -> (p x)) (x:xs)) > (length (x:xs) `div` 2)        = True
    | otherwise                                                        = False

-- j) 
menor:: (Eq a, Ord a) => a -> (a -> Bool) -> a
menor x p 
	| p x 					= x
	| otherwise				= menor (x+1)p

-- k) 
mayorA:: (Eq a, Ord a) => a -> a -> (a -> Bool) -> a
mayorA n m p
	| n > m 				= 0	--¿ERROR?
	| p n 					= n
	| otherwise				= mayorA (n+1) m p

-- n)
pt:: (Eq a, Ord a) => a -> a -> (a -> Bool) -> Bool
pt n m p 
	| n > m 				= True
	| p n 					= pt (n+1) m p
	| (not.p)n 				= False

-- EJERCICIO 3 				----->>>>   AYUDA
-- a) LISTA_DIVISORES_NUMERO
list_divisores:: Num a => a -> [a]
list_divisores 0 = [0]
list_divisores x =
	[ mod x y == 0 | y <- [0..x]]	--¿OUT OF SCOPE?

-- b) LISTA




-- EJERCICIO 4:
-- a) LAST :: devuelve el ultimo elemento de una lista

-- b) REVERSE ::
f_reverse:: [a] = [a]
f_reverse [] = []
f_reverse 	= foldl(\xs y -> (y:xs))[]
--ACUMULADOR: XS
--ELEMENTO QUE RECORRO: Y
--EMPIEZO EN []
--RECORRO IZQ A DER

--c) ALL ::
f_all:: (a -> Bool) -> [a] -> Bool
fall p = foldl (\x y -> x && p y) True
--ACUMULADOR: X
--ELEMENTO QUE RECORRO: Y
--EMPIEZO EN TRUE
--RECORRO IZQ A DER


append:: [a] -> [a] -> [a]
append xs ys = foldr (:) ys xs
--¿Concatenar?

f_takeWhile:: (a -> Bool) -> [a] -> [a]
f_takeWhile p = foldr(\xs x -> if p x then x:xs
							   else [])[]