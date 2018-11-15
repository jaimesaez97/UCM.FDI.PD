{

	Jaime Sáez de Buruaga
	Fernando Dastis Soto


EJERCICIO 15 
Prelude> last [1..10^5]
100000
(0.00 secs, 7,255,576 bytes)
Prelude> last [1..10^7]
10000000
(0.16 secs, 720,054,480 bytes)
Prelude> last [1..10^20]
Interrupted.
Prelude> head [1..10^20]
1
(0.00 secs, 51,160 bytes)
Prelude> last [10^20..1]
*** Exception: Prelude.last: empty list
Prelude> head (tail [1..10^20])
2
(0.00 secs, 51,104 bytes)
Prelude> length [1..10^20]
Interrupted -> Tarda demasiado en calcularse
Prelude> last (take (10^7) [1..10^20])
10000000
(0.16 secs, 1,280,059,472 bytes)
Prelude> head (take (10^7) ([1..100] ++ [1..10^20]))
1
(0.02 secs, 51,392 bytes)
Prelude> last (take 100 ([1..10^20] ++ [1..100]))
100
(0.00 secs, 71,736 bytes)
Prelude> last (drop 100 ([1..10^20] ++ [1..100]))
Interrupted -> Tarda demasiado en calcularse
Prelude> head (drop (10^7) ([1..10^20] ++ [1..100]))
10000001
(0.17 secs, 1,280,055,496 bytes)
Prelude> [1..10^7]==[1..10^7]
True
(0.27 secs, 1,440,054,024 bytes)
Prelude> [1..10^20]==[1..10^20]
Interrupted -> Tarda demasiado en calcularse
Prelude> [1..10^20]==[1..10^20+1]
Interrupted -> Tarda demasiado en calcularse
Prelude> [1..10^20]==[2..10^20]
False
(0.00 secs, 55,232 bytes)
Prelude> head (reverse [1..10^7])
10000000
(2.95 secs, 960,053,288 bytes)
Prelude> last (reverse [1..10^7])
1
(0.22 secs, 960,050,840 bytes)
Prelude> reverse [1..10^20] == reverse [1..10^20+1]
>Interrupted -> Tarda demasiado en calcularse
}
{
EJERCICIO 1
A)Calcula cu´antos a˜nos hay en 10^10 segundos (supón que todos los a˜nos tienen 365 d´ıas; en otro
momento puedes hacerlo teniendo en cuenta bisiestos).
}

defanios :: Double 
defanios = (10^10 / 3600 * 24 * 365)

{
B)Calcula cu´antos a˜nos enteros, d´ıas restantes enteros, horas restantes enteras, minutos restantes
enteros y segundos restantes hay en 1010 segundos.
}

defanios2 :: [Int] 
defanios2 = 
	let     a  = (div(div(div 10^10 3600) 24) 365)  							--a  = años enteros
	in
	    let    an = mod (div ( div 10^10 3600) 24) 365							--a  = segundos sobrantes
        in   
		    let d  = div ( div (div  an  24) 60) 60								--d  = días enteros
            in
                let ad = mod (div (div an  24) 60) 60							--ad = segundos sobrantes
                in 
				    let h  = (div (div ad 60) 60)								--h  = horas enteras
					in
						let ah = mod (div ad 60) 60								--ah = segundos sobrantes
						in
							let m  = (div ah 60)								--m  = minutos enteros
							in
								let s = mod ah 60 								--am = segundos restantes
								in [a, d, h, m, s]
								
--EJERCICIO 2
--Escribe un programa que defina usando NOTACION CURRIFICADA las siguientes funciones:
--f(x,y) = 2x - y*x  
    fun1 :: (Num a) => a -> a -> a 
    fun1 x y = 2*x - x*y
--g(x) = f(f(2,x), f(x,1))
    g :: (Num a) => a -> a
    g x = fun1(fun1(2,x),fun1(x,1))
--h(x,y,z) = f(f(x + 2y, g(3)), 5 - g(z) - y)

--i(x,y) =

--EJERCICIO 3
-- a) digitos x
digitos :: (Integral a, Num b) => a -> b
digitos x
        | x > 9        = 1 + digitos y
        | otherwise    = 1
    where y = x `div` 10
-- b) reduccion x
reduccion:: (Integral a) => a -> a
reduccion x 
    | (n+p) > 9         = reduccion (n+p)
    | otherwise         = n + p 
	where n = digitos x
	      p = digitos n
-- c) perm n
factorial:: (Num a, Enum a) => a -> a
factorial n = product[1..n]

perm:: (Integral a) => a -> a
perm x = factorial x

-- d) var n m
var:: (Integral a) => a -> a -> a
var m n = factorial n `div` factorial (n - m)

-- e) comb n m
comb:: (Integral a) => a -> a -> a
comb m n = factorial n `div` y
    where y = factorial m * factorial (n - m)

-- EJERCICIO 4 : CRIBA DE ERASTÓTENES
elimina:: Int -> [Int] -> [Int]
elimina n xs = [x | x <- xs, x `mod` n /= 0 ]	-- elimina los múltiplos de 2

criba:: [Int] -> [Int]
criba [] = []
criba (n:ns) = n : criba (elimina n ns)

primos:: [Int]		-- Imprime la lista de los números primos
primos = criba [2..] 

esPrimo:: Int -> Bool	-- verifica si n es primo
esPrimo n = head (dropWhile (<n) primos) == n

-- EJERCICIO 6
----------------------------------------
-- SIN USAR OPERADORES INFIJOS
-- conjunción
y:: Bool -> Bool -> Bool
y p q 
    | p == True && q == True     = True
    | otherwise                  = False  
-- disyunción  
o:: Bool -> Bool -> Bool
o p q
    | p == True || q == True     = True
    | otherwise                  = False
-- negación
no:: Bool -> Bool
no p
    | p == True                  = False
    | otherwise                  = True
-- implicación
imp:: Bool -> Bool -> Bool
imp p q
    | p == False                 = True
    | q == True                  = True
    | p == q                     = True
    | otherwise                  = False
-- equivalencia
eq:: Bool -> Bool -> Bool
eq p q = p == q
-- disyunción exclusiva
dis_esc:: Bool -> Bool -> Bool
dis_esc p q
    | p == True && q == False    = True
    | p == False && q == True    = True
    | otherwise                  = False
----------------------------------------
-- DECLARANDO OPERADORES INFIJOS
-- conjunción
(&&&):: Bool -> Bool -> Bool
p &&& q 
    | p == True && q == True     = True
    | otherwise                  = False
-- disyunción  
(|||):: Bool -> Bool -> Bool
p ||| q
    | p == True || q == True     = True
    | otherwise                  = False
-- negación
--     (NO ES DE ARIDAD 2)
-- implicación
(~>):: Bool -> Bool -> Bool
p ~> q
    | p == False                 = True
    | q == True                  = True
    | p == q                     = True
    | otherwise                  = False
-- equivalencia
(===):: Bool -> Bool -> Bool
p === q = p == q
-- disyunción exclusiva
(&#&):: Bool -> Bool -> Bool
p &#& q
    | p == True && q == False    = True
    | p == False && q == True    = True
    | otherwise                  = False
-----------------------------------------------
-- USANDO LA NEGACIÓN Y LA CONJUNCIÓN (perezaX)
-- PROBAR CON FRASE FINAL (ej6)
-----------------------------------------------
-- EJERCICIO 7

-- EJERCICIO 10
my_length:: (Integral a, Num a, Eq a) => [a] -> a
my_length [] = 0
my_length (x:xs)
    | xs == []          = 1
    | otherwise         = 1 + my_length xs
my_sum::(Integral a, Num a, Eq a) => [a] -> a
my_sum [] = 0
my_sum (x:xs)
    | xs == []          = x
    | otherwise         = x + my_sum xs

media:: (Integral a, Num a, Eq a) => [a] -> a
media [] = 0
media (x:xs) = my_sum (x:xs) `div` my_length (x:xs)

-- EJERCICIO 11
last_elem:: Eq a => [a] -> a
last_elem (x:xs)
    | xs == []         = x
    | otherwise        = last_elem xs
init_list:: Eq a => [a] -> [a]
init_list (x:xs)
    | xs == []         = []
    | otherwise        = (x:init_list xs)
init_last:: Eq a => [a] -> ([a],a)
init_last xs = (init_list xs, last_elem xs)
concat_list:: [[a]] -> [a]
concat_list = foldr (++) []
take_on_list:: (Eq n, Num n) => n -> [a] -> [a]
take_on_list _ []           = []
take_on_list 0 _            = []
take_on_list n (x:xs)       = x : take_on_list (n-1) xs
drop_on_list:: (Eq n, Num n) => n -> [a] -> [a]
drop_on_list _ []           = []
drop_on_list 0 xs           = xs
drop_on_list n (x:xs)       = drop_on_list (n-1) xs 
split_at_list:: (Eq n, Num n) => n -> [a] -> ([a],[a])
split_at_list n xs = (take_on_list n xs, drop_on_list n xs)
nub_on_list:: (Eq a) => [a] -> [a]
nub_on_list xs              = nub' xs []
    where 
        nub' [] _               = []
        nub' (x:xs) ls 
            | elem x ls         = nub' xs ls
            | otherwise         = x : nub' xs (x:ls)