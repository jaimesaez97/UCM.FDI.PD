# Programación Declarativa
## Final Enero 2018

### Ejercicio 1.

Todas están mal tipadas menos la tercera: `(2:[]):1`.

**c)**

### Ejercicio 2.

Como los paréntesis asocian por la derecha, podemos ver que T1 = T2.

T3, sin embargo, no se parece a ninguna otra.

**b)**

### Ejercicio 3.

e1 = (((f x y) ** y) ** x)

e2 = (f x y) ** (y ** x)

e3 = (((f x y) ** y) ** x)

e1 == e3 != e2.

**a)**

### Ejercicio 4.

foldr (\x y -> not y) e [False,True,undefined]
    - (\x y -> not y) undefined e  = not e
    - (\x y -> not y) (not e) True = e
    - (\x y -> not y) e False      = not e
    
**a)**
    
### Ejercicio 5.

foldl (\x y -> not y) e [False,True,undefined]
    - (\x y -> not y) e undefined = ERROR EJECUCIÓN
    
**b)**

### Ejercicio 6.

[take j [3..i] | i <- [3,4], j <- [i-1,i]]
    - take 2 [3]
    - take 3 [3]
    - take 3 [3,4]
    - take 4 [3,4]
    
**c)**    

### Ejercicio 7.

= (\x y z -> x y (y z)) (\x y -> x y) (\x -> x+1) 2
= (\x y -> x y) (\x -> x+1) ((\x -> x+1) 2)
= (\x -> x+1) ((\x -> x+1) 2)
= (\x -> x+1) 3
= 4

**b)**

### Ejercicio 8.

f x y z = x y (y z)

f:: T1 -> T2 -> T3 -> T4
x:: T1
y:: T2
z:: T3
xy(yz):: T4
    - (yz):: T5
        - y:: T2 = T3 -> T5
    - (xy):: T5 -> T4
        - x:: T1 = T2 -> T5 -> T4
                 = (T3 -> T5) -> T5 -> T4

f:: T1 -> T2 -> T3 -> T4
f:: ((T3 -> T5) -> T5 -> T4) -> (T3 -> T5) -> T3 -> T4
f:: ((a -> b) -> b -> c) -> (a -> b) -> a -> c

**a)**

### Ejercicio 9.

**b)**

### Ejercicio 10.

**c)**

### Ejercicio 11.

**c)** 
    - La función es estricta en el primer argumento.

### Ejercicio 12.

Podemos ver que `(iterate (takeWhile (< 10)) (iterate (+ 1) 0))` es una expresión de tipo [[a]], por lo que take 5 y length sí se aceptaría.

**c)**

### Ejercicio 13.

La expresión (filter (<n) iterate (+1) m) resulta en una lista que no acaba, ya que cuando llega a n se queda parada, por lo que LAST sobre esa lista no puede parar.

**b)**

### Ejercicio 14.

f(Z) = S Z
f(S x) = S (f x)


% f(z,s(Z)).
% "la salida de f(Z) = s(Z)"

% f(s(X),s(Y)):- f(X,Y).
% "la salida de f(s(x)) es s(Y)
% "la salida de f(X) es Y"

**b)**

### Ejercicio 15.

**a)**

### Ejercicio 16.

**a)**

### Ejercicio 17.

La correcta es la tercera, en las dos anteriores falta el print.

**c)**

### Ejercicio 18.

**c)**

### Problema 1.

#### a)
[(1,1),(4,2),(3,9),(16,4),(5,25)...]

e:: Integral a => [(a,a)]
e = [if (mod i 2 == 0) then (i,i^2) else (i^2,i) | i <- [1..]]

#### b)
f x y z = x y (y z)
f:: T1 -> T2 -> T3 -> T4
x:: T1
y:: T2
z:: T3
xy(yz):: T4
    - (yz):: T5
        - y:: T2 = T3 -> T5
    - (xy):: T5 -> T4
        - x:: T1 = T2 -> T5 -> T4
                 = (T3 -> T5) -> T5 -> T4

f x y z = x y (y z)
f:: ((T3 -> T5) -> T5 -> T4) -> (T3 -> T5) -> T3 -> T4
f:: ((a -> b) -> b -> c) -> (a -> b) -> a -> c

### Problema 2.

data Arbol a = Nodo a [Arbol a]

suma:: Num a => Arbol a -> a
suma (Nodo x hijos)         = x + sum (map suma hijos)

creciente:: (Ord a, Num a) => Arbol a -> Bool
creciente (Nodo _ hijos)    = and [suma (hijos!!i) > sum [suma (hijos!!j) | j <- [0..i-1], i <- [0..length(hijos)-1]]] && and (map creciente hijos)

instance Eq a => Eq (Arbol a) where
    Nodo x hs == Nodo x' hs'        = x == x' && hs == hs'

### Problema 3.

foldr11:: (a -> a -> a) -> [a] -> a
foldr11 f [x]    = x
foldr11 f (x:xs) = f x (foldr11 f xs)

lastt:: [a] -> a
last = foldr11 (\x y -> y)

### Problema 4.

p(a).
p(b).
q(c(X,Y),Z):-
    q(X,Z).
q(c(X,Y),Y).

q(c(c(c(b,d),Y),a),X),p(X).


### Problema 5.
