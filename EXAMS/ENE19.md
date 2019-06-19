# Programación Declarativa
## Final Enero 2019

### Problema 1.

[(0,0),(1,2),(3,6),(7,14),(15,30)...]
   0     1     2     3       4
   
e:: (Num a, Enum a) => [a]
e = [(2^i-1, 2*(2^i-1)) | i <- [0..]]

### Problema 2.

f x y z = y (y x z) z

f:: A -> B -> C -> D
x:: A
y:: B
z:: C
y(yxz)z:: D
    - (yxz):: E
        - Mirando y(yxz)z =   y:: B = E -> C -> D
        - Mirando (yxz)   =   y:: B = A -> C -> E
            - Como el resultado y parámetros de las funciones deben ser iguales, podemos concluir que E=A y D=E.
            - y:: B = A -> C -> A
                - Al ejecutar ahora la operación y(yxz)z vemos que:
                    - (yxz)::A
                    - (z)::C
                    - y(yxz)z tiene que ser de tipo A

f:: A -> B -> C -> D
A -> (A -> C -> A) -> C -> A
a -> (a -> b -> a) -> b -> a

### Problema 3.

data ArbolT a = Hoja a | Nodo a (ArbolT a) (ArbolT a) (ArbolT a) deriving (Show, Eq, Read)

sumaCentral:: (Num a) => ArbolT a -> a
sumaCentral (Hoja x)             = x
sumaCentral (Nodo x i c d)       = x + sumaCentral c

### Problema 4.

#### a)
sublista:: Eq a => [a] -> [a] -> Bool
sublista xs ys      = elem xs [take n (drop m ys) | n <- [0..length ys], m <- [0..length ys]]

#### b)
maxterna:: (Ord a, Num a) => [a] -> (Int, Int, Int)
maxterna xs
    | length xs >= 3            = let i = maxIndex (sumaternas xs) in (i,i+1,i+2)
    | otherwise                 = error "lista con menos de 3 elementos"

sumaternas:: (Ord a, Num a) => [a] -> [(Int,a)]
sumaternas xs   = [(i, (xs !! i)+(xs !! i+1)+(xs !! i+2)) | i <- [0..(length xs)-3]]

maxIndex:: Ord a => [(Int, a)] -> Int
maxIndex xs     = fst $ foldl1 (\(i,x) (j,y) -> (if x < y then (j,y) else (i,x))) xs

### Problema 5.

#### a)

% ordenada(Xs).
% "Elementos en Xs de menor a mayor"

ordenada([]):-
    !.
ordenada([_]):-
    !.
ordenada([X,Y | Xs]):-
    X @=< Y, 
    ordenada([Y | Xs]).

#### b)

% max_aparece(Xs,X)    
% "El elemento que más aparece en Xs es X"

max_aparece([],"Ninguno").
max_aparece([X|Xs],Y):-
    max_aparece(Xs,X,1,0,0,Y).
    
% max_aparece(Xs,X,N,Z,M,Y)
% "X : elemento actual de la lista"
% "N : número de apariciones de X"
% "Z : elemento que más aparece en la lista (hasta ahora)"
% "M : número de apariciones de Z"
% "Y : salida de la función (elemento con más repet)"

% Caso Base: "Lista vacía, devuelvo elemento"
max_aparece([],_,_,Y,_,Y):-
    !.

% Caso Recursivo 1: "El elemento entrante es igual al del contador de elemento actual., sumo 1 al contador"
max_aparece([X|Xs],X,N,Z,M,Y):-
    !,
    N1 is N + 1,
    max_aparece(Xs,X,N1,Z,M,Y).

% Caso Recursivo 2: "El elemento entrante es distinto, y si el número de veces que aparece es mayor al que estoy guardando, lo sustituyo."
max_aparece([X|Xs],X1,N,_,M,Y):-
    N > M,
    !,
    max_aparece(Xs,X,1,X1,N,Y).

% Caso Recursivo 3: "El elemento entrante es distinto y el número de veces que aparece es menor: sustituyo elemento actual y pongo 1 en contador"
max_aparece([X|Xs],_,_,Z,M,Y):-
    max_aparece(Xs,X,1,Z,M,Y).
    
### Problema 5.