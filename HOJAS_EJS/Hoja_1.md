# Programación Declarativa

## Hoja 1


### 1. Escribe el tipo de las siguientes expresiones.
a. [True : []] 

[[Bool]]

b. [] : [True]

Error de tipado.

c. [True] : []

[[Bool]]

d. True : [True]

[Bool]

e. 1 : (2 : 3 : [])

Num a => [a]

f. [1 : [2]] : [[]]

Num a => [[a]]

g. [1,1] : (2 : [])

[1,1] : [2] => Error de tipado

h. [] : [[]] : []

[[[a]]]

### 2. Escribe el tipo de las siguientes expresiones.

a. head ['a', 'f']

Char

b. tail ['a', 'f']

[Char]

c. tail head ''af''

Error de tipado.

d. head (tail ''af'')

Char.

e. splitAt 4 ['a' .. 'f']

([Char],[Char])

f. zip [3 + 2, 0] [''af'']

Num a => [(a,Char)]

g. drop (+2) [1,2,3]

Error de tipado. drop :: a -> [a] -> [a]

h. drop (div 2 0) [1,2,3]

Exception: divide by zero.

i1. 'ab' ++ 'bc'

Error de tipado.

i2. "ab" ++ "bc"

[Char].

i3. "ab" + "bc"

Error de ejecución.

i4. "ab" ++ 'c'

Error de tipado.

### 3. Determina el valor de las expresiones evaluables del ejercicio anterior.

a. head ['a', 'f']

'a'.

b. tail ['a', 'f']

"f".

d. head (tail ''af'')

'f'.

e. splitAt 4 ['a' .. 'f']

([abcd], [ef]).

f. zip [3 + 2, 0] [''af'']

[(5,"af")].

i2. "ab" ++ "bc"

"abcd".

### 4. Encuentra si es posible el valor de las siguientes expresiones.

a. let x = y + 1 in let z = x ^ 2 in z

Error: la variable Y está fuera del ámbito.

b. let y = let x = 2 in (let z = x ^ 2 in z) in y

4.

c. let y = let x = 2 in (let z = x ^ 2 in z) in z + y

Error: la variable Z está fuera de ámbito.

d. let {x = 5; y = 4} in if x < y then x else y

4.

e. let {x = 5; y = 4} in if x < y then z = x else z = y

Error de tipado.

f. if [1] !! 1 == 1 then [1] else [ ]

Exception: index too large( no hay 2 elementos en [1] ).

g. let x = elem 1 [1] in if x then [1] else []

[1].

h. let x = elem 1 [ ] in if x then [1] !! 1 else [1] !! 0

1.

i. let x = elem 1 [ ] in if x then 1 else []

Error. ¿?

### 5. Indica razonadamente cuáles de los siguientes tipos son equivalentes.

T3 y T4 son equivalentes.

### 6. Supuesto que ! es infijo y asocia por la izquierda (infixl 4 !), ¿cuáles de las siguientes expresiones son sintácticamente correctas?

**e1 en notación prefija**

(((f x y) ! (g x)) ! (h y)) == (! (! (f x y) g x) (h y))

e1 sintácticamente correcta.

e2 sintácticamente incrorrecta.

