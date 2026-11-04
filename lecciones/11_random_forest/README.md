# Lección 11 · Random Forest

**Objetivo:** Predecir el consumo mensual con un bosque de árboles y compararlo con la regresión lineal.

**Proyecto asociado:** Tesis Oil Malal.

## Paso a paso

1. Abre RStudio con el archivo `aprendiendo-r-con-pgf.Rproj` (doble clic). Así R trabaja desde la carpeta principal del repositorio.
2. Abre el archivo [`random_forest_consumo.R`](random_forest_consumo.R) (menú **File → Open File**) y léelo junto con la explicación de abajo.
3. Ejecuta el programa completo con el botón **Source** (arriba a la derecha del editor), o escribe en la consola:

```r
source("lecciones/11_random_forest/random_forest_consumo.R")
```

4. Compara lo que aparece en la consola con el **resultado esperado**.

## Qué hace el código

- `randomForest(formula, ntree = 300, nodesize = 2)` entrena 300 árboles, cada uno con una muestra distinta de los datos, y promedia sus predicciones. `nodesize = 2` pide al menos 2 meses por hoja.
- Las dos predicciones (recta y bosque) se validan con «dejar uno fuera» dentro del mismo ciclo.
- `set.seed(0)` fija el azar del bosque para que el resultado se repita. `suppressPackageStartupMessages()` oculta el mensaje de bienvenida del paquete.
- `importance()` entrega `IncNodePurity`: cuánto ayudó cada variable a reducir el error en los árboles. Se divide por el total para verla como proporción.

## Resultado esperado

```text
MAE regresión lineal :  267.4 kWh
MAE Random Forest    :  295.0 kWh

Importancia de variables (Random Forest):
  produccion_m3  0.65
  mes_num        0.35

Predicción para 150 m³ en junio: 9768.6 kWh
```

## Qué aprendimos

Un algoritmo más avanzado no es automáticamente mejor. Se elige según los datos y se compara siempre con un modelo simple de referencia.

## Ejercicio

Cambia `nodesize` a 1 y a 5, y observa cómo cambia el MAE del bosque.
