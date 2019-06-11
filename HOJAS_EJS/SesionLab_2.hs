-- EJERCICIO 1

ej1a = [x^2 | x <- [0..50]]

ej1b = reverse ([(x,x^2) | x <- [0..50]])

ej1c = sum [x * abs (sin x) | x <- [1..100]]

ej1d = take 50 ([3^x | x <- [0..50]])

ej1d' = take 50 (iterate (3*) 1)

ej1e = [3^x | x <-[0..], (3^x < 10^100), (mod (3^x) 100 == 67)]

ej1f = sum [x | x <- [1..1000], (mod x 3 == 0 || mod x 5 == 0)]

ej1g = sum (filter (<10^20) ((iterate (3*) 1))) + sum (filter (<10^20) (iterate (5*) 1))

ej1h = [[y^x | y <- [1..20]] | x <- [1..10]]

ej1i = [[x^y | y <- [1..10]] | x <- [1..20]]

ej1j = [if (mod x 2 == 0) then x else (x - 2*x) | x <- [1..]]

--ej1k = [x, 2*x-x | x <- [0..]]

-- EJERCICIO 2

filter2:: [a] -> (a -> Bool) -> ( a-> Bool) -> ([a],[a])
filter2 xs p q = (us, vs)
    where us = filter p xs
          vs = filter q xs
          
filters:: [a] -> [(a -> Bool)] -> [[a]]
filters xs []       = []
filters xs (p:ps)   = [filter p xs] ++ filters xs ps 

partition:: (a -> Bool) -> [a] -> ([a],[a])
partition p xs  = (us, vs)
    where us = filter p xs
          vs = filter (not . p) xs
          
spann:: (a -> Bool) -> [a] -> ([a], [a])
spann p (x:xs)
    | (p x)         = (x:ys, zs)
    | otherwise     = ([], x:zs)
        where (ys, zs) = span p xs
        
mapx:: a -> [a -> a] -> [a]
mapx x []       = []
mapx x (f:fs)   = [f x]  ++ mapx x fs
    
iguales:: (Eq a, Eq b, Num a) => (a -> b)  -> (a -> b) -> a -> a -> Bool
iguales f g n m         
    | (n == m)          = (f n) == (g n)
    | otherwise         = (f n) == (g n) && iguales f g (n+1) m
    
cuantos:: Num b => (a -> Bool) -> [a] -> b
cuantos p []    = 0
cuantos p (x:xs)
    | (p x)     = 1 + cuantos p xs
    | otherwise = cuantos p xs
    
mayoria:: (a -> Bool) -> [a] -> Bool
mayoria p xs = (cuantos p xs) > (cuantos (not . p) xs)
menorA:: (Ord a, Num a) => a -> a -> (a -> Bool) -> a
menorA n m p    
    | n > m     = error "No lo cumple ninguno."
    | (p n)     = n
    | otherwise = menorA (n+1) m p
    
menor:: (Num a) => a -> (a -> Bool) -> a
menor n p
    | (p n)     = n
    | otherwise = menor (n+1) p
    
mayorA:: (Num a, Ord a) => a -> a -> (a -> Bool) -> a
mayorA n m p
    | (m < n)   = error "No lo cumple ninguno."
    | (p m)     = m
    | otherwise = mayorA n (m-1) p
    
mayor:: (Num a, Ord a) => a -> (a -> Bool) -> a
mayor n p
    | (p n)     = n
    | otherwise = mayor (n-1) p
    
ex:: (Num a, Ord a) => a -> a -> (a -> Bool) -> Bool
ex n m p
    | n > m     = False
    | (p n)     = True
    | otherwise = ex (n+1) m p
    
pt:: (Num a, Ord a) => a -> a -> (a -> Bool) -> Bool   
pt n m p
    | n > m     = True
    | (p n)     = pt (n + 1) m p
    | otherwise = False
    
-- EJERCICIO 3  

-- a) Lista divisores
divisible:: Integral a => a -> a -> Bool
divisible x y = (mod x y) == 0

lstDivisores:: Integral a => a -> [a]
lstDivisores x = [y | y <- [1..(x-1)], divisible x y]

-- b) Tupla divisores 19..50
divisores:: Integral a => [(a,[a])]
divisores = [(x, [y | y <- [1..x], divisible x y]) | x <- [19..50]]

-- c) Perfectos
perfectos:: Integral a => [a]
perfectos = [x | x <- [1..1000], (x == sum (lstDivisores x))]

-- d) Números Primos
lstPrimos:: Integral a => [a]
lstPrimos = [x | x <- [1..], (primo x)]

primo:: Integral a => a -> Bool
primo x = length(lstDivisores x) == 1

-- e) N.P. < 1000
lstPrimos2:: Integral a => [a]
lstPrimos2 = [x | x <- [1..1000], (primo x)]

-- f) # NP >200 <500

primos:: Integral a => [a]
primos = [x | x <- [200..500], (primo x)]

-- g) 
primoo:: Integral a => a
primoo = head [x | x <- [6923..], (primo x)]

-- EJERCICIO 4

reversee:: [a] -> [a]
reversee = foldr f []
    where f x y = y ++ [x]

filterr:: (a -> Bool) -> [a] -> [a]
filterr p  = foldr (\x y -> if (p x) then (x:y) else (y)) []

maximumm:: Ord a => [a] -> a
maximumm (x:xs) = foldr max x xs

minimumm:: Ord a => [a] -> a
minimumm (x:xs) = foldr max x xs

-- EJERCICIO 8

{-
f n = [x * x | x <- [1..n], mod x 2 == 0]
    -- pares de 1 a n elevados al cuadrado

f2 n = reverse (filter (mod x 2 == 0) () )
-}

-- EJERCICIO 9
{-
f x y = map (\u -> (g u, g (u+1))) y
    where z   = x * last y
          g u = (x+z)*u
-}
f:: Num a => a -> [a] -> [(a,a)]
f x y = 

g:: Num a => a -> a -> a -> a
g x u         = (x+ (z x y))*u

z:: (Num a) => a -> [a] -> a
z x []      = 0
z x y       = x * last y

    -- z = x por ultimo num de la lsita
    -- g u = (x + ult.lista) * u