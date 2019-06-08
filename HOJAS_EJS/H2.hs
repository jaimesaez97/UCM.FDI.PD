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
div:: Integral a => (a,a) -> (a,a) -> (a,a)
div (x,y) (w,z)			= (x * z, y * w)

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