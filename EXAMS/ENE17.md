# Programación Declarativa
## Final Enero 2017

### Problema 1.

#### a) Lista de los primeros 200 primeros números mayores que 100 múltiplos de 3 o de 5.

take 200 [i | i <- [100..], (mod i 3 == 0 || mod i 5 == 0)]

#### b) Razonar tipo de f x y z = x z (y z)
f:: T1 -> T2 -> T3 -> T4
x:: T1
y:: T2
z:: T3
xz(yz)::T4
	- (yz):: T5
		- y:: T2 = T3 -> T5
	- (xz):: T5 -> T4
		- x:: T1 = T3 -> T5 -> T4
f:: T1 -> T2 -> T3 -> T4
f:: (T3 -> T5 -> T4) -> (T3 -> T5) -> T3 -> T4
f:: (a -> b -> c) -> (a -> b) -> a -> c

### Problema 2.

#### a)

data ASec a b = Vacio | C a (ASec a b) | D b (ASec a b)

#### b)

nelem:: (Eq c, Num c) => c -> ASec a b -> a 
nelem 0 (C a (y))       = a
nelem 0 (D a (y))		= a
nelem n y               = nelem (n-1) y

#### c)

separa:: ASec a b -> ([a],[b])
separa Vacio            = ([],[])   

#### d)

instance Eq ASec a b where
    C a xs == C a' xs'      = a == a' && xs == xs'

### Problema 3.

#### a) idiv n = lista de los divisores impares de n

idiv:: Integral a => a -> [a]
idiv n = [i | i <- [1..n], (mod n i == 0), (mod i 2 == 1)]

#### b) idivs ns = lista con los números impares divisores de algún elemento de ns

import Data.List

idiv:: Integral a => a -> [a]
idiv n = [i | i <- [1..n], (mod n i == 0), (mod i 2 == 1)]

idivs:: Integral a => [a] -> [a]
idivs (x:[])    = (idiv x)
idivs (x:xs)    = nub (idiv x ++ idivs xs)

### Problema 4.
p(0,Y).
p(s(X),s(Y)):-
	p(X,Y).

#### a)
#### b)
#### c)

### Problema 5.

% veces(X,Xs,N)
% "Elemento X aparece N veces en Xs"

veces(X,[],0).
veces(X, [X | Xs], N):-
	veces(X,Xs,N1),
	N1 is N + 1.

veces(X,[Y | Xs], N):-
	veces(X,Xs,N).