-- EJERCICIO 1

-- a) Data Pila

data Pila a = P[a]

creaPila:: Pila a
creaPila = P []

esPilaVacia:: Pila a -> Bool
esPilaVacia (P [])  = True
esPilaVacia _       = False

cima:: Pila a -> a
cima (P [])         = error "pila vacía"
cima (P (xs))       = head xs

apilar:: a -> Pila a -> Pila a
apilar x (P(xs))    = P(x:xs)

desapilar:: Pila a -> Pila a
desapilar (P [])    = error "pila vacía"
desapilar (P(x:xs)) = P(xs)

-- b) r
r:: [a] -> [a]
r xs = ys
    where P ys = foldl (\p x -> apilar x p) creaPila xs

-- Esta funcion da la vuelta a la lista que metas por parámetro.
-- Es decir, r [1,2,3] = [3,2,1]. Utiliza una pila como reversión.

-- EJERCICIO 2

primeroQueCumple:: (a -> Bool) -> [a] -> Maybe a
primeroQueCumple p []       = Nothing
primeroQueCumple p (x:xs)
    | p x                   = Just x
    | otherwise             = primeroQueCumple p xs

-- EJERCICIO 3

data Cj a = Cj [a]

creaConj:: Cj a
creaConj = Cj []

esVacio:: Cj a -> Bool
esVacio (Cj [])     = True
esVacio _           = False

pertenece:: Eq a => a -> Cj a -> Bool
pertenece x (Cj [])     = False
pertenece x (Cj (xs))   = elem x xs

listaElem:: Eq a => Cj a -> [a]
listaElem (Cj [])       = []
listaElem (Cj (x:xs))   = x : listaElem (Cj (elemRepet x xs) )

elemRepet:: Eq a => a -> [a] -> [a]
elemRepet x []          = []
elemRepet x xs          = filter (/= x) xs

-- EJERCICIO 4

type Vector = [Float]
type Matriz = [Vector]

traspuesta:: Matriz -> Matriz
traspuesta [[]]                 = [[]]
traspuesta m                    
    | length m == 0             = []
    | otherwise                 = [r (head m)] ++ (traspuesta (tail m))

sumaMatrices:: Matriz -> Matriz -> Matriz
sumaMatrices [[]] m                 = m
sumaMatrices m1 m2                  = zipWith sumaFilas m1 m2
    where sumaFilas f g = zipWith (+) f g
    
-- EJERCICIO 5

data Temp = Kelvin Float | Celsius Float | Fahrenheit Float deriving Show

instance Eq Temp where
    x == y          = cx == cy
        where Celsius cx = (toCelsius x);
              Celsius cy = (toCelsius y)
    
instance Ord Temp where
    compare x y     =   compare cx cy   
        where Celsius cx = (toCelsius x);
              Celsius cy = (toCelsius y)
              
toCelsius:: Temp -> Temp
toCelsius (Kelvin x)          = Celsius (x - 273.15)
toCelsius (Fahrenheit x)      = Celsius ((x-32)/1.8)
toCelsius (Celsius x)         = Celsius x

toKelvin:: Temp -> Temp
toKelvin (Celsius x)          = Kelvin (x + 273.15)
toKelvin (Fahrenheit x)       = Kelvin ((x-32)*(5/9)+273.15)
toKelvin (Kelvin x)           = Kelvin x

toFahrenheit:: Temp -> Temp
toFahrenheit (Celsius x)      = Fahrenheit (x*(9/5) + 32)
toFahrenheit (Kelvin x)       = Fahrenheit ((x-273.15)*(9/5)+32)
toFahrenheit (Fahrenheit x)   = Fahrenheit x 

-- EJERCICIO 6

data Arbol a = Vacio | Nodo a (Arbol a) (Arbol a) deriving (Show, Eq, Ord)

creaVacio:: Ord a => Arbol a
creaVacio = Vacio

treeSort:: Ord a => [a] -> [a]
treeSort xs = arbToList (listToSortArb xs)

arbToList:: Ord a => Arbol a -> [a]
arbToList Vacio                 = []
arbToList (Nodo a arbiz arbdr)  = [a] ++ arbToList arbiz ++ arbToList arbdr

listToSortArb:: Ord a => [a] -> Arbol a
listToSortArb xs = foldl colocaOrd creaVacio xs

colocaOrd:: Ord a => Arbol a -> a -> Arbol a
colocaOrd Vacio x               = (Nodo x Vacio Vacio)
colocaOrd (Nodo a arbiz arbdr) x   
    | x <= a                    = (Nodo a (colocaOrd arbiz x) arbdr)
    | x > a                     = (Nodo x arbiz (colocaOrd arbdr x))
    
esArbolVacio:: Arbol a -> Bool
esArbolVacio Vacio                   = True
esArbolVacio _                   = False

-- EJERCICIO 7

adivina:: Int -> IO()
adivina num = do
    putStrLn "Elige un número"
    guess <- getLine
    if(read guess) < num
        then do {putStrLn "El número buscado es mayor"; adivina num}
    else if (read guess) > num
        then do {putStrLn "El número buscado es menor"; adivina num}
    else putStrLn "¡¡  Acertaste  !!"
    
-- EJERCICIO 8
numWords :: IO ()
numWords = do
    putStrLn "Escribe una frase"
    frase <- getLine
    n <- return (length (words frase))
    putStrLn ("Tu frase tiene " ++ show n ++ " palabras")


        
