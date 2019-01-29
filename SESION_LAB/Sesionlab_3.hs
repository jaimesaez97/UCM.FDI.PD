--EJERCICIO 1
--data Comp a b = Comp (a,b) deriving (Eq, Num)

--instance Show Comp where
--    show (Comp a b)             = show a ++ show b ++ "i"


-- EJERCICIO 2
--a)
data Direccion = Arriba | Abajo | Izquierda | Derecha deriving (Eq, Ord, Show)
--b)
mueve:: (Num a) => (a,a) -> [Direccion] -> (a,a)
mueve (x,y) []             = (x,y)
mueve (x,y) (z:zs)         
    | z == Arriba                      = (x-1,y)
    | z == Abajo                       = (x+1,y)
    | z == Izquierda                   = (x,y-1)
    | otherwise                        = (x,y+1)
--c)
trayectoria:: (Num a) => (a,a) -> [Direccion] -> [(a,a)]
trayectoria (x,y) (z:zs)    = (a,b) : (trayectoria (a,b) zs)
    where (a,b)                        = (mueve (x,y) [z])
--d)
inferior:: [Direccion] -> [Direccion] -> Bool
inferior xs ys = maximum (trayectoria (0,0) xs) < maximum (trayectoria (0,0) ys)

-- EJERCICIO 3
data NArbol a = Vacio | Nodo a [NArbol a] deriving (Eq)
--a)
es_hoja:: NArbol Integer -> Bool
es_hoja (Nodo x [])                   = True
es_hoja (Nodo x xs)                   = False

lista_hojas:: NArbol Integer -> [Integer]
lista_hojas (Nodo x (y:ys))           
    | es_hoja (Nodo x (y:ys))         = x : lista_hojas (Nodo x ys)
    | otherwise                       = lista_hojas (Nodo x ys)
--b)
lista_nodos:: NArbol Integer -> [Integer]
lista_nodos (Nodo x (y:ys))            = x : lista_nodos y
lista_nodos (Nodo x [])                = [x]
--c)
--instance Ord NArbol where 
--	compare (Nodo x (a:as)) (Nodo y (b:bs))   = compare x y
--d)
--instance Show NArbol where
--	show (Nodo x (as))   = show x ++ " childs(" ++ show (length as) ++") : \n" ++ show (head as)

--EJERCICIO 6
data Conjunto a = Con Int [a]
--a)
nub:: (Eq a) => [a] -> [a]
nub l           = nub' l []
    where 
        nub' [] _       = []
        nub' (x:xs) ls  
            | elem x xs     = nub' xs ls 
            | otherwise     = nub' xs (x:ls)

to_con:: [Int] -> Conjunto Int
to_con xs       = Con (length ys) ys
    where ys = nub xs
--b)
interseccion:: Conjunto Int -> Conjunto Int -> Conjunto Int 
interseccion (Con x (as)) (Con y (bs)) = to_con (nub [z | z <- as, elem z bs])
--c)