# Programación Declarativa
## Final junio 2018

### Problema 1.

#### a) Generar Lista Infinita [(0,1),(1,2),(2,4),(3,8),(4,16)...]

e:: (Integral a, Num b) => [(a,b)]
e = [(i,2^i) | i <- [0..]]

#### b) f x y = x (y x)
f:: A -> B -> C
x:: A
y:: B
x(yx)::C
    -(yx):: D
        - y:: B = A -> D = (D -> C) -> D
    - x:: A = D -> C

(D -> C) -> ((D -> C) -> D) -> C
(a -> b) -> ((a -> b) -> a) -> b

### Problema 2.

data Conjunto a = Con Int [a] deriving (Show)

#### a) Operación lista -> conjunto

toC:: (Eq a) => [a] -> Conjunto a
toC xs      = Con (length ys) ys
    where ys = quitar_repet(xs)
    
quitar_repet:: (Eq a) => [a] -> [a]
quitar_repet []     = []
quitar_repet xs     = helper xs []

helper:: (Eq a) => [a] -> [a] -> [a]
helper [] acc       = acc
helper (y:ys) acc   = if (elem y acc) 
                        then helper ys acc
                        else helper ys (acc ++ [y])
                        
#### b) Intersección de Conjuntos

interseccion:: (Eq a) => Conjunto a -> Conjunto a -> Conjunto a
interseccion (Con x xs) (Con y ys)    = Con (length zs) zs
    where zs = quitar_repet (intersect xs ys)
    
intersect:: (Eq a) => [a] -> [a] -> [a]
intersect [] xs          = []
intersect xs []          = []
intersect (x:xs) ys      = if (elem x ys) then ([x] ++ intersect xs ys) else (intersect xs ys)

#### c) mapset f c

mapset:: (a -> a -> a) -> Conjunto a -> Conjunto a
mapset f (Con x (y:ys))     = (Con (length zs) zs)
    where zs = f y (mapset f (Con (x-1) ys))

#### d) Instance Eq

instance (Eq a,Ord a) => Eq (Conjunto a) where
    (Con x xs) == (Con y ys)    = x == y &&  (quicksort xs == quicksort ys)



quicksort:: (Ord a, Eq a) => [a] ->[a]
quicksort []            = []
quicksort (x:xs)        = quicksort [y | y <- xs, y <= x] ++ [x] ++ quicksort [y | y <- xs, y > x]

### Ejercicio 3. 

reversee:: Eq a => [a] -> [a]
reversee xs = foldr (\b c -> c ++ [b]) [] xs

reverse2:: Eq a => [a] -> [a]
reverse2 = foldl (flip (:)) []

### Ejercicio 4.



### Ejercicio 5.

veces([],Ns):-
    !.
veces(Xs,Ns):-
    total(Xs,Xs,Ns).
 
total([],Ys,[]):-
    !.
total([X | Xs],Ys,[N | Ns]):-
    !,
    contar(X,Ys,N),
    total(Xs,Ys,Ns).

% contar(X,Xs,N)
% "Elemento X aparece N veces en lista Xs"
contar(X,[],0).
contar(X,[X | Xs],N):-
    !,
    contar(X,Xs,N1),
    N is N1 + 1.
contar(X,[Y | Xs],N):-
    contar(X,Xs,N).

