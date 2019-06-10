-- EJERCICIO 1

-- a) ¿Cuántos años hay en 10^10 segundos?
anios10:: Double
anios10 = anios 10^10

anios:: Fractional a => a -> a
anios segundos     = años
    where horas    = segundos/3600;
          dias     = horas/24;
          años     = dias/365;
          
-- b) ¿Cuántos años enteros, días restantes enteros, horas restantes enteras, minutos restantes enteros y segundos restantes enteros hay en 10^10 segundos?         

defanios10:: [Int]
defanios10 = defanios (10^10)

defanios:: Int -> [Int]
defanios segundos = [años, dias, horas, minutos, segundos]
    where años = div (div (div segundos 3600) 24) 365;
          años_rest = mod (div (div segundos 3600) 24) 365;
          dias = div (div años_rest 3600) 24;
          dias_rest = mod (div años_rest 3600) 24;
          horas = div (dias_rest) 3600;
          horas_rest = mod (div dias_rest 60) 60;
          minutos = div horas_rest 60;
          segundos = mod horas_rest 60
