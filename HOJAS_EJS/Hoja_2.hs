--EJERCICIO 1
zip3::[a] -> [b] -> [c] -> [(a,b,c)]
zip3 (a:as) (b:bs) (c:cs)      = (a,b,c) : zip3 as bs cs
zip3 _ _ _                     = []

--EJERCICIO 2
--a) simplifica (15,9) = (5,3)
simplifica:: (a,b) -> (a,b)
simplifica (0, _)              = error "indeterminacion"
simplifica (_, 0)              = 0
simplifica (a,b)               = (a div x, b div x)
    where x = gcd a b  --gcd:: maximo comun divisor
--b)maximo comun divisor
mcd:: Integral a => a -> a -> a
mcd 0 0                        = error "no definido"
mcd x 0                        = x
mcd x y                        = mcd y (mod x y)
--c)mínimo común multimplo
mcm:: Integral a => a -> a -> a
mcm _ 0                        = 0
mcm 0 _                        = 0
mcm x y                        = abs ((x `quot` (mcd x y)) * y)
--d.1)suma de 2 numeros racionales
suma_racionales:: Integral a => (a,a) -> (a,a) -> (a,a)
suma_racionales (a,b) (c,d)    = simplifica ((a+c),(b-d))
--d.2)resta de 2 numeros racionales
resta_racionales:: Integral a => (a,a) -> (a,a) -> (a,a)
resta_racionales (a,b) (c,d)   = simplifica (((a*x)-(c*x)),x)
    where x = mcd b d
--d.3)multiplicacion de 2 numeros racionales
mlt_racionales:: Integral a => (a,a) -> (a,a) -> (a,a)
mlt_racionales (a,b) (c,d)     = simplifica ((a*c),(b*d))
--d.4)división de 2 números racionales
div_racionales:: Integral a => (a,a) -> (a,a) -> (a,a)
div_racionales (a,b) (c,d)     = simplifica ((a*d),(b*c))
--d.5)elevar un numero a una potencia entera
elev_racional:: Integral a => (a,a) -> a -> (a,a)
elev_racional _ 0              = 1
elev_racional (a,b) 1          = (a,b)
elev_racional (a,b) x          = simplifica ((a^x), (b^x))

--EJERCICIO 4
--a) f1 x y = if x < y then x else y	
error de tipo (creo)
--b) f2 x y = x (y + 1)
f2:: T1 -> T2 -> T3
x:: T1
y:: T2
x(y+1):: T3
x:: T5 -> T3   = T1
y:: T5         = T2
	
	-T5 = a
	-T3 = b
	-T1 = c
	-T2 = d
	
f2 = x (y+1)
f2:: (a -> b) -> a -> b
		COMPROBAR EN GHCI
--c) f3 x y = (x y) + 1
f3:: T1 -> T2 -> T3
x:: T1
y:: T2
(xy):: T3
x:: T4 -> T3
y:: T4
	-T1 = a 
	-T2 = b
	-T3 = c
	-T4 = d
f4 x y = (x y) + 1
f4:: a -> b -> d ->(d->c)
--d) f4 = x y z = x y (y z)
f4:: T1 -> T2 -> T3 -> T4
x:: T1
y:: T2
z:: T3
xy(yz):: T4

xy:: T5 -> T4 => {x::T2 -> (T5->T4) = T1}
yz:: T5 => y::T3 -> T5 == T2

f4 = xy (yz)
f4:: (T3->T5)->(T5->T4)
	   a   b     c   d  && T1 -> T2 -> T3 -> T4
	==   ((a->b) -> (b->c)) -> (a->b)->a->c
--e) f5 x y = (\z -> y/x - z)


-- EJERCICIO 5
--a) imparesEn xs 
imparesEn:: Integral a => [a] -> [a]
imparesEn []                 = []
imparesEn xs                 = filter p xs
    where p = ((mod x 2) == 0) 
--b)escalar xs ys 
escalar:: Integral a => [a] -> [a] -> [a]
escalar (x:xs) (y:ys)
    | length xs != length ys = error "deben tener el mismo tamaño"
	| otherwise              = (x*y):(escalar xs ys)
--c) mcdList
mcdList:: Integral a => [a] -> a
mcdList [x]                  = x
mcdList (x:xs)               = mcd x (mcdList xs)
--EJERCICIO 6
--a) paresHasta n
paresHasta:: Integral a => n -> a
paresHasta 0                 = 0
paresHasta n                 = [x | x <- [1..n],(mod x 2 == 0)]
								COMPROBAR
--b) lstpares n
lst_pares:: Integral a => n -> [a]
lst_pares 0                  = 0
lst_pares n                  = take n [x | x <- [1..n],(mod x 2 == 0)]
--c) mezclaPares xs ys
mezcla_pares:: Integral a => [a] -> [a] -> [(a,a)]
mezcla_pares xs []            = filter p xs
    where p = (mod x 2 == 0)
mezcla_pares [] ys            = filter p ys
    where p = (mod x 2 == 0)
mezcla_pares xs ys            = [(x,y) | x <- xs, y <- ys, p x, p y]
    where p = (mod x 2 == 0)
