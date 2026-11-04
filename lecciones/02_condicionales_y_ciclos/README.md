# Lección 02 · Condicionales y ciclos

**Objetivo:** Recorrer varios meses con un ciclo `for` y decidir con `if` si cada mes consumió más o menos de lo esperado según la línea base energética.

**Proyecto asociado:** Tesis Oil Malal: línea base E = 9,5209·P + 8058,7.

## Paso a paso

1. Abre RStudio con el archivo `aprendiendo-r-con-pgf.Rproj` (doble clic). Así R trabaja desde la carpeta principal del repositorio.
2. Abre el archivo [`clasificar_meses.R`](clasificar_meses.R) (menú **File → Open File**) y léelo junto con la explicación de abajo.
3. Ejecuta el programa completo con el botón **Source** (arriba a la derecha del editor), o escribe en la consola:

```r
source("lecciones/02_condicionales_y_ciclos/clasificar_meses.R")
```

4. Compara lo que aparece en la consola con el **resultado esperado**.

## Qué hace el código

- `c(...)` crea un **vector**: una fila de valores del mismo tipo. Hay un vector para los meses, otro para la producción y otro para el consumo.
- `seq_along(mes)` entrega las posiciones 1, 2, ..., 6. Con `mes[i]` se toma el valor de la posición `i`.
- `for (i in ...) { ... }` repite el bloque entre llaves para cada posición.
- `if (diferencia > 0) { ... } else { ... }` elige qué bloque ejecutar según la comparación.
- `sobre <- sobre + 1` cuenta cuántos meses quedaron sobre la línea base.
- En `sprintf`, `%+7.1f` muestra el número con su signo (+ o −), 1 decimal y 7 espacios de ancho.

## Resultado esperado

```text
2022-01: real   8674.8 | esperado   8747.4 |   -72.6 kWh -> bajo la línea base
2022-03: real   9689.2 | esperado   9055.5 |  +633.7 kWh -> SOBRE la línea base
2022-04: real   9823.6 | esperado   9952.0 |  -128.5 kWh -> bajo la línea base
2022-05: real  10503.9 | esperado  10585.6 |   -81.8 kWh -> bajo la línea base
2022-06: real   9931.3 | esperado   9852.1 |   +79.3 kWh -> SOBRE la línea base
2022-07: real   9668.7 | esperado   9750.6 |   -81.8 kWh -> bajo la línea base

Meses sobre la línea base: 2 de 6
```

## Qué aprendimos

Un ciclo repite instrucciones para cada elemento; un condicional elige qué hacer según una comparación. Juntos permiten revisar el desempeño mes a mes.

## Ejercicio

Agrega a los vectores los meses de agosto a diciembre de 2022 (están en `datos/oil_malal_mensual.csv`) y vuelve a contar cuántos quedan sobre la línea base.
