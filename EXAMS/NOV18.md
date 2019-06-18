# Programación Declarativa
## Parcial Noviembre 2018

### Ejercicio 1.

La primera expresión es correcta = [0,0].

La segunda también es correcta = [].

La tercera está mal tipada pero salta una excepción `index too large`.

**c)**

### Ejercicio 2.

e1 = (((f x y) ? (g y)) ? x)

e2 = (f x y) ? ((g y) ? x)

e3 = x ? ((g y) ? (f x y))

Luego e1 = e3 != e2.

**a)**

### Ejercicio 3.

Lo que indica `(\x -> (\x y -> y) x)` es que con los siguientes operadores se va a hacer lo siguiente:
    - El primero se va a obviar
    - El segundo va a aparecer tal cual.
Por lo que la expresión es de tipo a -> a

**b)**

### Ejercicio 4.

f:: T1 -> T2 -> T3 -> T4

x:: T1

y:: T2

z:: T3

(xy)z:: T4
    - (xy):: T5 = T3 -> T4
        - x:: T1 = T2 -> T5 = T2 -> T3 -> T4
        
f:: T1 -> T2 -> T3 -> T4s
f:: (T2 -> T3 -> T4) -> T2 -> T3 -> T4   f:: (a -> b -> c) -> a -> b -> c

Aquí hay trampa y es que ninguna de las opciones es esta: el truco reside en que la implicación asocia por la derecha, por lo que 

    [(a -> b -> c) -> a -> b -> c] = [(a -> b -> c) -> a -> (b -> c)]

### Ejercicio 5.

Podemos ver que la función es estricta en el primer argumento ya que dependiendo de su valor el resultado es uno u otro.

**c)**

### Ejercicio 6.

La ejecución provoca un error de tipado debido a que no se puede concatenar un elemento 'undefined' con una tupla (Bool,Bool).

**a)**

### Ejercicio 7.

Las tres definiciones son correctas.

**a)**

### Ejercicio 8.

f1 == f3 y sería igual a f2 si en vez de `(\(x,y) -> y - x)` fuera `(\(x,y) -> x - y)`.

**c)**

### Ejercicio 9.
f1:
    - En f1, X debe ser una lista para que el operador sea sintácticamente correcto (igual que en f2)
    - En f3, X no puede ser lista porque el operador fallaría.
        - f1 y f3 no son del mismo tipo ni equivalentes.
- f2 y f3 son del mismo tipo, ¿son EQUIVALENTES? NO

**c)**


### Ejercicio 10.

Vamos a analizarla por partes:
    - Lista intensional de 1 a m.
    - Cada ele mento de la lista es lo siguiente:
        - iterate (*i) i : genera una lista infinita
        - take m: coge los M primeros elementos de la lista infinita anterior.
Podemos concluir:
    - La lista tiene M elementos.
    - Cada uno de los elementos es una lista de M elementos, que representa a las potencias de i.
    
**b)**

### Ejercicio 11.

La expresión se evalúa en un error de ejecución, puesto que el último cómputo es `(\x y -> x:y) [(True,False)] undefined`.

**b)**

### Ejercicio 12.



### Ejercicio 13.


### Ejercicio 14.


### Ejercicio 15.


### Ejercicio 16.

