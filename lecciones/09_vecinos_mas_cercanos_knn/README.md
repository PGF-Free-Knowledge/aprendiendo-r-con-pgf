# Lección 09 · k vecinos más cercanos (KNN)

**Objetivo:** Clasificar cada mes como eficiente o no eficiente según sus vecinos más parecidos.

**Proyecto asociado:** Tesis Oil Malal: un mes es eficiente si su consumo real no supera el de la línea base.

## Paso a paso

1. Abre RStudio con el archivo `aprendiendo-r-con-pgf.Rproj` (doble clic). Así R trabaja desde la carpeta principal del repositorio.
2. Abre el archivo [`knn_eficiencia.R`](knn_eficiencia.R) (menú **File → Open File**) y léelo junto con la explicación de abajo.
3. Ejecuta el programa completo con el botón **Source** (arriba a la derecha del editor), o escribe en la consola:

```r
source("lecciones/09_vecinos_mas_cercanos_knn/knn_eficiencia.R")
```

4. Compara lo que aparece en la consola con el **resultado esperado**.

## Qué hace el código

- `factor()` convierte la etiqueta 0/1 en una **categoría**, que es lo que espera un clasificador.
- `scale()` resta el promedio y divide por la desviación estándar de cada columna. Sin esto, la producción (decenas o cientos de m³) dominaría la distancia frente al mes (1 a 12).
- `knn.cv()` del paquete `class` hace la validación «dejar uno fuera»: clasifica cada mes con los `k` meses más cercanos entre los demás.
- `set.seed(1)` fija los sorteos que R usa cuando hay empates entre vecinos, para que el resultado se repita.
- `table(real, predicho)` arma la **matriz de confusión**: en la diagonal están los aciertos.
- Para clasificar un mes nuevo se escala con la misma media y desviación de los datos de entrenamiento.

## Resultado esperado

```text
Meses eficientes: 13 de 23 
k = 1: exactitud 0.52
k = 3: exactitud 0.48
k = 5: exactitud 0.57
k = 7: exactitud 0.57

Matriz de confusión (k = 3):
    predicho
real 0 1
   0 2 8
   1 4 9

Mes nuevo con 250 m³ en mayo -> eficiente
```

## Qué aprendimos

KNN decide por parecido. Con solo 23 meses y dos variables, la exactitud es baja: la eficiencia depende de factores que estos datos no registran.

## Ejercicio

Agrega el índice de consumo como tercera variable en `X`. ¿Por qué la exactitud sube tanto? (pista: la etiqueta se calculó con el consumo).
