# Lección 03 · Funciones

**Objetivo:** Escribir funciones reutilizables para cálculos que se repiten en los proyectos.

**Proyecto asociado:** Tesis Oil Malal (línea base e índice de consumo) y goniómetro (conversión de pulsos a grados).

## Paso a paso

1. Abre RStudio con el archivo `aprendiendo-r-con-pgf.Rproj` (doble clic). Así R trabaja desde la carpeta principal del repositorio.
2. Abre el archivo [`funciones_energia.R`](funciones_energia.R) (menú **File → Open File**) y léelo junto con la explicación de abajo.
3. Ejecuta el programa completo con el botón **Source** (arriba a la derecha del editor), o escribe en la consola:

```r
source("lecciones/03_funciones/funciones_energia.R")
```

4. Compara lo que aparece en la consola con el **resultado esperado**.

## Qué hace el código

- `consumo_esperado <- function(produccion_m3, pendiente = 9.5209, intercepto = 8058.7) { ... }` define una función. Lo que va entre paréntesis son sus **parámetros**.
- `pendiente = 9.5209` es un **valor por defecto**: si no se entrega otro valor, se usa ese.
- En R, la función devuelve el resultado de su última línea (también se puede escribir `return(...)`).
- `pulsos_a_grados(20000, 444.44)` usa la misma función con otra escala: 444,44 pulsos por grado del eje del motor.
- `consumo_esperado(c(100, 200, 300))`: las funciones de R trabajan con vectores completos, sin necesidad de un ciclo.

## Resultado esperado

```text
Consumo esperado con 150 m³: 9486.8 kWh
Índice de consumo mayo 2023: 36.62 kWh/m³
540000 pulsos = 180 ° del brazo
Con otra escala (444.44 pulsos/°): 45 °
Consumo esperado con 100, 200 y 300 m³: 9010.8 9962.9 10915
```

## Qué aprendimos

Una función empaqueta un cálculo con un nombre. Se escribe una vez y se usa muchas veces, con distintos datos.

## Ejercicio

Escribe una función `grados_a_pulsos(grados, pulsos_por_grado = 3000)` que haga el cálculo inverso y pruébala con 45°.
