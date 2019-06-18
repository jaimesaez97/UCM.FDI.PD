# Programación Declarativa
## Parcial Noviembre 2017

### Ejercicio 1.
**a)**

1:[2] = [1,2] = 1:2:[]

[1,2]:[] = [[1,2]] = [1:[2]]
 ### Ejercicio 2.
**c)**

T2 != T3

T1 == T3
### Ejercicio 3.
infixl: operador INFIJO que asocia POR LA IZQUIERDA

4     : prioridad (menos que las funciones).

e1 = (f x y) ** (g x) **  y

e2 = ((f x y) ** (g x)) ** y

e3 = (f x y) ** ((g x) ** y)

e1 == e2 != e3

**a)**
    
### Ejercicio 4.

**b)**

### Ejercicio 5.

**b)**

### Ejercicio 6.



### Ejercicio 7.

(\x y z -> y x (z x)) 3 (\x y -> y - x) (\x -> x+2) 

x = 3

y = (\x y -> y - x)

z = (\x -> x+2)

yx(zx) = (\x y -> y - x) 3 (\x -> x+2) 3
      
yx(zx) = (\x y -> y - x) 3 5

yx(zx) = 2

**a)**

### Ejercicio 8.

f:: T1 -> T2 -> T3 -> T4

x:: T1

y:: T2

z:: T3

yx(zx):: T4
    - (zx):: T5
        - z:: T3 = T1 -> T5
    - (yx):: T5 -> T4
        - y:: T2 = T1 -> (T5 -> T4)

f:: T1 -> T2 -> T3 -> T4

f:: T1 -> (T1 -> T5 -> T4) -> (T1 -> T5) -> T4
    - T1 = a; T4 = b; T4 = c

f:: a -> (a -> b -> c) -> (a -> b) -> c

**a)**

### Ejercicio 9.

Efectivamente, requiere menos cómputo debido a que el segundo parámetro de la funcion NO SE USA NUNCA y este es una suma, por lo que la evaluación perezosa ahorraría un paso de cómputo.

**a)**

### Ejercicio 10.

Es estricta en sus dos argumentos.

**a)**

### Ejercicio 11.



### Ejercicio 12.

takeWhile (> n) $ iterate (+ 1) m

Efectivamente, dependiendo del `n` y el `m` que elijamos la evaluación terminará o no. Por ejemplo, con n = 1 y m = 2, la evaluación nunca termina porque "sigue cogiendo" mientras sea mayor que 1 (iterate +1 2 siempre > 1).

**c)**

### Ejercicio 13.

*Out of scope*:
    - e1: y fuera de ámbito.
    - e3: primera Y fuera de ámbito.
    - e5: última I fuera de control
Correctas :
    - e2
    - e4
    
**b)**

### Ejercicio 14.

**a)**


### Ejercicio 15.

La expresión `ata Top a b = A   | C a        | D a b` es la correcta.

**a)**

### Ejercicio 16.

f x y z = if x && y then x == y else z==0

:t f = (Num a, Eq a) => Bool -> Bool -> a -> Bool

**a)**
