-- EJERCICIO 1

data Comp = Comp Float Float deriving (Eq)

instance Show Comp where
    show (Comp a b) = show a ++ " + " ++ show b ++ "i"
    
-- EJERCICIO 2

data Direction = Arriba | Abajo | Izquierda | Derecha deriving (Eq, Show, Ord)

data Punto = Punto Int Int
    
mueve:: Punto -> [Direction] -> Punto
mueve z (t:ts)                          = z
mueve (Punto x y) (t:ts)
    | t == Arriba           = (Punto (x+1) y)
    | t == Abajo            = (Punto (x-1) y)
    | t == Derecha          = (Punto x (y-1))
    | otherwise             = (Punto x (y+1))



