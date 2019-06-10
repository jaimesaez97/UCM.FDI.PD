-- Programación Declarativa
-- HOJA 2

-- EJERCICIO 1
zip33 :: [a] -> [a] -> [a] -> [(a,a,a)]
zip33 (x:xs) (y:ys) (z:zs) = (x,y,z) : zip33 xs ys zs
zip33 [] ys zs = []
zip33 xs [] zs = []
zip33 xs ys [] = []

-- EJERCICIO 2
-- a) 
simplifica:: Integral a => (a,a) -> (a,a)
simplifica (_,0)  			= error "no definido"
simplifica (x,y)			= (div x a, a)
    where a = mcd x y
	

-- b)
mcd:: Integral a => a -> a -> a
mcd 0 0 				= error "no definido"
mcd x 0					= abs x
mcd x y 				= mcd b (mod a b)
	where a = abs x; b = abs y

-- c)
mcm:: Integral a => a -> a -> a
mcm 0 0 				= error "no definido"
mcm x 0					= 0
mcm x y 				= (x * y) `div` mcd x y

-- d1)
suma:: Integral a => (a,a) -> (a,a) -> (a,a)
suma (x,y) (w,z) 		= (a + b,c)
	where c = mcm y z; a = x * (div c y); b = w * (div c z) 
	
-- d2)
resta:: Integral a => (a,a) -> (a,a) -> (a,a)
resta (x,y) (w,z) 		= (a - b, c)
	where c = mcm y z; a = x * (div c y); b = w * (div c z)

-- d3)
mult:: Integral a => (a,a) -> (a,a) -> (a,a)
mult (x,y) (w,z)		= (x * w, y * z)

-- d4)
divis:: Integral a => (a,a) -> (a,a) -> (a,a)
divis (x,y) (w,z)			= (x * z, y * w)

-- d5)
raise:: Integral a => (a,a) -> (a,a) -> (a,a)
raise (x,y) (w,z)		= (div (x^w) (y^w), div (x^z) (y^z))

-- EJERCICIO 3
-- a) (\x y -> y x) 2

-- MAL TIPADA

-- b) (\x y -> y x) 2 (\x -> x + 1)

-- 3

-- c) (\x ->\y -> x y) (\z -> z + 1) 2

-- 3.

-- d) (\x ->\y -> y/x) 2

-- MAL TIPADA.

-- e) (\x y -> y * x) 2 (\x -> x + 1)

-- MAL TIPADA.

-- f) (\x y z -> y x (z x)) 2 (\x y -> y * x))

-- MAL TIPADA.

-- g) (\x y z -> y x (z x)) 2 (\x y -> y * x) (\x -> x + 1)

-- 6.

-- h) let y = (\x -> x + 1) in y 2

-- 3.

-- i) (\x -> x + 1) (let y = \x -> x + 1 in y 2)

-- 4.

-- EJERCICIO 4

-- a) f1 x y = if x < y then x else y

{- f1:: Ord a => a -> a -> a

-}
-- b) f2 x y = x (y + 1)

{- 
f2:: T1 -> T2 -> T3
x:: T1
y:: T2
x(y+1)::T3
x:: T2 -> T3

	f2:: (T2 -> T3) -> T2 -> T3
	f2:: Num a => (a -> b) -> a -> b
-}
-- c) f3 x y = (x y) + 1

{-
f3:: T1 -> T2 -> T3
x:: T1
y:: T2
(xy)+1:: T3
x:: T2 -> T3
	
	f2:: (T2 -> T3) -> T2 -> T3
	f2:: Num a,b => (a -> b) -> a -> b
-}

-- Num t2 => (t1 -> t2) -> t1 -> t2

-- d) f4 x y z = x y (y z)

{-
f4:: T1 -> T2 -> T3 -> T4
x:: T1
y:: T2
z:: T3
xy(yz)::T4
	yz:: T5
		y:: T3 -> T5 = T2.
	xy:: T5 -> T4
		x:: T2 -> (T5 -> T4) = T1.
		x::(T3 -> T5) (T5 -> T4) = T1.
	
	f4:: T1 -> T2 -> T3 -> T4
	f4:: ((T3 -> T5) -> (T5 -> T4)) -> (T3 -> T5) -> T3 -> T4
	f4:: ((a -> b) -> (b -> c)) -> (a -> b) -> (a -> c)
-}

-- e) f5 x y = (\z -> y/x - z)

{-
f5:: T1 -> T2 -> T3
x:: T1
y:: T2
(\z -> y/x - z):: T3

	f5:: Fractional a => a -> a -> a -> a
-}

-- f) f6 x y = (\z w -> w (y/x - z))

{-
f6:: T1 -> T2 -> T3
x:: T1
y:: T2
(\z w -> w (y/x - z)):: T4 -> T3
	
	f6:: Fractional a => a -> a -> a -> (a -> a) -> a
-}

-- EJERCICIO 5
	
-- a) imparesEn xs
imparesEn:: Integral a => [a] -> [a]
imparesEn []                = []
imparesEn xs             	= filter odd xs

-- b) escalar xs ys
escalar:: Num a => [a] -> [a] -> a
escalar [] []				= 0
escalar (x:xs) (y:ys) 		= (x*y) + escalar xs ys

{-
escalar2:: Num a => [a] -> [a] -> a
escalar2 [] []				= 0
escalar2 xs ys				= foldl (* (head xs)) ys
-}

-- c) mcdList xs 

mcdList:: Integral a => [a] -> a
mcdList [x]					= x
mcdList (x:xs)				= mcd x (mcdList xs)

-- EJERCICIO 6

-- a) paresHasta n
paresHasta:: Integral a => a -> [a]
paresHasta n 				= [x | x <- [1..n], odd x]

-- b) lstPares n
lstPares:: Integral a => a -> [a]
lstPares n					= [x | x <- [1..2*n], odd x]

-- c) mezclaPares xs ys
mezclaPares:: Integral a => [a] -> [a] -> [(a,a)]
mezclaPares [] []											= []
mezclaPares (x:xs) (y:ys)	
	| notElem x (paresHasta x) && notElem y (paresHasta y)	= (x,y) : mezclaPares xs ys
	| otherwise												= mezclaPares xs ys