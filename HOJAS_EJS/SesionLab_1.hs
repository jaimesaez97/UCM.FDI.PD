-- EJERCICIO 1

-- a) ¿Cuántos años hay en 10^10 segundos?
anios10:: Double
anios10 = anios 10^10

anios:: Fractional a => a -> a
anios segundos     = años
    where horas    = segundos/3600;
          dias     = horas/24;
          años     = dias/365;
          
-- b) ¿Cuántos años enteros, días restantes enteros, horas restantes enteras, minutos restantes enteros y segundos restantes enteros hay en 10^10 segundos?         

defanios10:: [Int]
defanios10 = defanios (10^10)

defanios:: Int -> [Int]
defanios segundos = [años, dias, horas, minutos, segundos]
    where años = div (div (div segundos 3600) 24) 365
          años_rest = mod (div (div segundos 3600) 24) 365
          dias = div (div años_rest 3600) 24
          dias_rest = mod (mod años_rest 3600) 24
          horas = div (dias_rest) 3600
          horas_rest = mod (div dias_rest 60) 60
          minutos = div horas_rest 60
          segundos = mod horas_rest 60

          -- NO SE

-- EJERCICIO 2
f:: Num a => a -> a -> a
f x y       = 2*x - y*x

g:: Num a => a -> a
g x         = f (f 2 x) (f x 1)

h:: Num a => a -> a -> a -> a
h x y z     = (f (f (x + 2*y) (g 3)) (5 - (g z) - y))

i:: (Ord a, Num a) => a -> a -> a
i x y       
    | x >= y && y > 0          = x - y
    | 0 < x && x < y         = 0
    | otherwise              = y - x

i2:: (Ord a, Num a) => a -> a -> a
i2 x y      = if (x >= y && y > 0) then x - y else if (0 < x && x < y) then 0 else y - x

-- EJERCICIO 3
digitos:: Integral a => a -> a
digitos x
    | (div x 10) < 1       = 1
    | otherwise            = 1 + digitos (div x 10)

reduccion:: Integral a => a -> a
reduccion x
    | x < 10               = x
    | otherwise            = reduccion (sumaDigitos x)

sumaDigitos:: Integral a => a -> a
sumaDigitos 0           = 0
sumaDigitos x           = x `mod` 10 + sumaDigitos (x `div` 10)

factorial:: (Integral a, Eq a, Num a) => a -> a
factorial 0 = 1
factorial n = n * factorial(n - 1)

perm:: (Integral a, Eq a, Num a) => a -> a 
perm n      = factorial n

var:: (Integral a, Eq a, Num a) => a -> a -> a
var n m     = div (factorial m) (factorial (m - n))

comb:: (Integral a, Eq a, Num a) => a -> a -> a
comb n m     = div (factorial (n + m - 1)) (factorial (m) * factorial (n-1))

-- EJERCICIO 4
primo:: Int -> Bool
primo n = elem n (lstNprimos n);

lstNprimos:: Int -> [Int]
lstNprimos n = lstNprimosAux n 1 [2]

lstNprimosAux:: Int -> Int -> [Int] -> [Int]
lstNprimosAux n cont (x:xs)
    | n == cont                 = (x:xs)
    | otherwise                 = lstNprimosAux n (cont+1) (p:x:xs)
        where p = sigPrimo x

sigPrimo:: Int -> Int
sigPrimo x = if primo (x+1) then x+1 else sigPrimo (x+1)

-- EJERCICIO 5
fibonacci:: Int -> Int
fibonacci 0         = 1
fibonacci 1         = 1
fibonacci n         = fibonacci (n-1) + fibonacci (n-2)

fibonacci2:: Int -> Int
fibonacci2 n = fst (fibonacci2Aux n)

fibonacci2Aux:: Int -> (Int, Int)
fibonacci2Aux n
    | n < 0         = error "fibonacci negativo"
    | n == 0        = (1,0)
    | n == 1        = (1,1)
    | otherwise     = let (fib1,fib2) = fibonacci2Aux (n-1) in (fib1 + fib2, fib1)

-- EJERCICIO 6
no:: Bool -> Bool
no True     = False
no False    = True

y:: Bool -> Bool -> Bool
y False _   = False
y _ False   = False
y _ _       = True

o:: Bool -> Bool -> Bool
o True _    = True
o _ True    = True
o _ _       = False

impl:: Bool -> Bool -> Bool
impl False _= True
impl _ True = True
impl _ _    = False

(|||):: Bool -> Bool -> Bool
True ||| _  = True
_ ||| True  = True
_ ||| _     = False

(&&&):: Bool -> Bool -> Bool
False &&& _ = False
_ &&& False = False
_ &&& _     = True

(==>):: Bool -> Bool -> Bool
False ==> _  = True
_ ==> True   = True
_ ==> _      = False

-- EJERCICIO 10
media:: [Int] -> Int
media xs    = div (sum xs) (length xs)

-- EJERCICIO 11
lastt:: [a] -> a
lastt (x:xs)     
    | length xs == 0    = x
    | otherwise         = lastt xs

initt:: [a] -> [a]
initt (x:xs)
    | length xs == 1    = [x]
    | otherwise         = x : initt xs

initLast:: [a] -> ([a],a)
initLast xs             = (initt xs, lastt xs)

concatt:: [[a]] -> [a]
concatt []               = []
concatt ([]:vs)          = concatt vs
concatt ((x:xs):vs)      = x : concatt (xs:vs)

takee:: (Eq a, Num a) => a -> [b] -> [b]
takee 0 _                = []
takee n []               = [] -- error "no sucifientes elems"
takee n (x:xs)           = x : takee (n-1) xs

dropp:: (Eq a, Num a) => a -> [b] -> [b]
dropp 0 xs               = xs
dropp n []               = []
dropp n (x:xs)           = dropp (n-1) xs

splitAtt:: (Eq a, Num a) => a -> [b] -> ([b],[b])
splitAtt n xs            = (takee n xs, dropp n xs)

nub:: Eq a => [a] -> [a]
nub (x:[])               = [x]
nub (x:xs)               = x : nub (quitarElem x xs)

quitarElem:: Eq a => a -> [a] -> [a]
quitarElem x []         = []
quitarElem x (y:ys)         
    | x == y            = quitarElem x ys
    | otherwise         = y : quitarElem x ys

-- ¿sort:: (Ord a, Eq a) => [a] -> [a]?

andd:: [Bool] -> Bool
andd []                  = True
andd (x:[])              = x
andd (x:xs)              
    | x == False        = False
    | otherwise         = andd xs

orr:: [Bool] -> Bool
orr []                 = True
orr (x:[])             = x
orr (x:xs)              
    | x == True        = True
    | otherwise        = orr xs

summ:: Num a => [a] -> a
summ (x:[])              = 0
summ (x:xs)              = x + summ xs

productt:: (Eq a, Num a) => [a] -> a
productt (0:_)           = 0
productt (x:[])          = x
productt (x:xs)          = x * productt xs

{-
lmedia:: [[a]] -> a
lmedia (x:vs)            = (media x) : lmedia vs
-}

-- EJERCICIO 12