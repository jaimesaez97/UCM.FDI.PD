-- HOJA2 -> EJERCICIO3-f)
(\x y z -> yx (zx))2(\x y -> y * x)

--Ejercicio 1: definimos tipo dato Pila a = P [a]
data Pila = P[a]

pilaVacia:: Pila a
pilaVacia = P []

esVacia:: Pila a -> Bool
esVacia (P []) = True
esVacia _	   = False

cima:: Pila a -> a
cima (P []) = Error "Vacía"
cipa P (x:xs) = x
-- == cima (P xs) = head xs 

apilar:: a -> Pila a -> Pila a
apilar x P (xs) = P (x:xs)

desapilar:: Pila a -> Pila a
desapilar P [] = Error "Vacía"
desapilar P (_:xs) = P (xs)

invierte:: [a] -> [a]
invierte xs = ys
	where P ys = (foldl (flip apilar) creaPila xs)
--Ejercicio 2: definir primeroQueCumple
primeroQueCumple:: (a -> Bool) -> [a] -> Maybe a
primeroQueCumple p xs
        | null cumplen                  = Nothing
		| otherwise                     = Just(head(filtro))
    where cumplen = filter p xs
		-- Buena programación: filtro se calcula 1 sola vez

--Ejercicio 3: representar tipo datos conunto
data Cj a = Cj [a] deriving (Show, Eq)

creaCj:: Cj a
creaCJ = CJ []

esVacio:: Cj a -> Bool
esVacio Cj [] = True
esVacio _	  = False

pertenece:: Eq t => Cj t -> t -> Bool
pertenece (Cj xs)y = elem y xs

listaDeCjs:: Cj t -> [t]
listaDeCjs (Cj xs) = xs

incluirElem:: Eq t => Cj t -> t -> Cj t
incluirElem (Cj xs)y
	| pertenece (Cj xs)y		= (Cj xs) 
	| otherwise					= (Cj y:xs)
-- = if pertenece (Cj xs)y then (Cj xs)
--   else Cj (y:xs)

elimRepet:: Eq t => Cj t -> Cj t
elimRepet (Cj xs) = foldr incluir creaCj xs
--OPERACION: INCLUIR
--ACUMULADOR: CREACJS
--RECORRO DE DER A IZQ
--EMPIEZO EN XS

--SI QUEREMOS HACER BIEN EL CONJUNTO, INSTANCIAMOS LA IGUALDAD:
data Cj a = CJ [a] deriving (Show, 
	instance Eq CJ a
		Cj [] == Cj []
		Cj xs == Cj ys	
	)

--Ejercicio 4: matrices
--Definición de una matriz como una lista de listas(filas)
type Vector = [Float]
type Matriz = [Vector]

traspuesta:: Matriz -> Matrix
traspuesta m 
	| m == []			= []
	| otherwise			= zip head m ++ traspuesta zip tail M
sumaMatrices:: Matriz -> Matriz -> Matriz
sumaMatrices [[]] _ = _
sumaMatrices m n    = zipWith sumaFilas m n
	where sumaFilas f g = zipWith (+) f g
escalar:: Vector -> Vector -> Float
escalar us vs = sum $ zipWith (*) us vs
prodVecMat:: Vector -> Matriz -> Vector
prodVecMat v m = [escalar v fila | fila <- m]
prodMats:: Matriz -> Matriz -> Matriz
prodMats m1 m2 = [prodVecMat fila m2'| fila <- m1]
    where m2' = traspuesta m2

--Ejercicio 5: cambio de temperaturas
data Temp = Kelvin Float | Celsius Float | Fahrenheit Float

escala:: Temp -> String
escala t =
	case t of
		Kelvin _ 	 = "Kelvin"
		Celsius _	 = "Celsius"
		Fahrenheit _ = "Fahrenheit"

--Defino cte CERO_ABS
ceroAbs:: Float
ceroAbs = -273.15

toKelvin:: Temp -> Temp
toKelvin (Celsius x) = Kelvin (x - ceroAbs)
toKelvin (Fahrenheit x) = Kelvin ((((x - 32) * 5) / 9) - ceroAbs)
toKelvin t = t

toFahrenheit:: Temp -> Temp
toFahrenheit (Celsius x) = Fahrenheit (32 + x*1.8)
toFahrenheit (Kelvin x)  = Fahrenheit (32 + (x+ceroAbs)*1.8)
toFahrenheit f           = f

toCelsius:: Temp -> Temp 
toCelsius (Kelvin x)      = Celsius (x+ceroAbs)
toCelsius (Fahrenheit x)  = Celsius ((x-32)/1.8)
toCelsius t               = t

instance Eq Temp where
	x == y  =  cx == cy
		where Celsius cx = (toCelsius x); Celsius cy = (toCelsius y)
instance Ord Temp where
	compare x y = compare cs cy
		where Celsius cx = (toCelsius x); Celsius cy = (toCelsius y)

-- EJERCICIO 6: tipo treeSort
type Arbol = Vacio | Nodo a Arbol iz Arbol dr
    deriving (Show, Eq, Ord)
creaVacio:: Ord a => Arbol a
creaVacio = Vacio
treeSort:: Ord a => [a] -> a
treeSort XS = arbToList(listToSortArb xs)
arbToList:: Ord a => Arbol a -> [a]
arbToList Vacio = []
arbToList (Nodo x arbiz arbdr) = 
	arbToList arbiz ++ [x] ++ arbToList arbdr
listToSortArb:: Ord a => [a] -> Arbol a
listToSortArb xs = foldl colocaOrd creaVacio xs
colocaOrd:: Ord a => Arbol a -> a -> Arbol a
colocaOrd Vacio x = Nodo x Vacio Vacio
colocaOrd (Nodo y arbiz arbdr) x =
	| x <= y            = (Nodo y (colocaOrd arbiz x) arbdr)
	| x > y             = (Nodo y arbiz (colocaOrd arbdr x))
estaVacio:: Ord a => Arbol a -> Bool
estaVacio Vacio = True
estaVacio arbol = false
-- EJERCICIO 7
adivina:: Int -> IO ()
adivina num = do 
	putStrLn "Elige un número:"
	guess <- getLine
	if (read guess) < num
		then do putStrLn "El número buscado es mayor"
			adivina num
		else if (read guess) > num
			then do putStrLn "El número buscado es menor"
				adivina num
			else putStrLn "Acertaste"
-- EJERCICIO 8
numpal:: IO()
numpal = do
	putStrLn "Escribe una frase"
	frase <- getLine
	n <- return (length (words frase))
	putStrln ("Tu frase tiene " ++ show n ++" palabras")

