# Lección 05 · data.frame: leer y resumir

**Objetivo:** Explorar la serie mensual de la planta: primeras filas, estadística descriptiva, columnas nuevas, promedios por año y filtros.

**Proyecto asociado:** Tesis Oil Malal: 23 meses válidos de producción y consumo, 2022–2023.

## Paso a paso

1. Abre RStudio con el archivo `aprendiendo-r-con-pgf.Rproj` (doble clic). Así R trabaja desde la carpeta principal del repositorio.
2. Abre el archivo [`resumen_oil_malal.R`](resumen_oil_malal.R) (menú **File → Open File**) y léelo junto con la explicación de abajo.
3. Ejecuta el programa completo con el botón **Source** (arriba a la derecha del editor), o escribe en la consola:

```r
source("lecciones/05_data_frames_leer_y_resumir/resumen_oil_malal.R")
```

4. Compara lo que aparece en la consola con el **resultado esperado**.

## Qué hace el código

- `head(df)` muestra las primeras 6 filas; `dim(df)` el número de filas y columnas.
- `summary()` entrega mínimo, cuartiles, mediana, promedio y máximo de cada columna.
- `df$indice_kwh_m3 <- ...` crea una columna nueva a partir de otras.
- `substr(df$mes, 1, 4)` toma los 4 primeros caracteres del texto `2022-01`: el año.
- `aggregate(cbind(produccion_m3, consumo_kwh) ~ anio, data = df, FUN = mean)` calcula el promedio de las dos columnas para cada año.
- `subset(df, produccion_m3 > 200, select = ...)` filtra las filas que cumplen la condición. `which.max()` indica la fila del valor máximo.

## Resultado esperado

```text
Primeras filas:
      mes produccion_m3 consumo_kwh
1 2022-01         72.34     8674.83
2 2022-03        104.70     9689.25
3 2022-04        198.86     9823.56
4 2022-05        265.41    10503.89
5 2022-06        188.36     9931.33
6 2022-07        177.70     9668.73

Tamaño (filas, columnas): 23 3 

Estadística descriptiva:
 produccion_m3     consumo_kwh   
 Min.   : 41.01   Min.   : 8468  
 1st Qu.: 93.03   1st Qu.: 8903  
 Median :118.91   Median : 9633  
 Mean   :146.54   Mean   : 9454  
 3rd Qu.:194.46   3rd Qu.: 9810  
 Max.   :314.16   Max.   :11504  

Promedio por año:
  anio produccion_m3 consumo_kwh
1 2022       147.380     9488.64
2 2023       145.777     9422.12

Meses con producción > 200 m³:
       mes produccion_m3 consumo_kwh
4  2022-05        265.41    10503.89
15 2023-04        214.56     9796.50
16 2023-05        314.16    11503.69
18 2023-07        212.12    10051.65

Mes de mayor consumo: 2023-05 (11503.69 kWh)
```

## Qué aprendimos

El `data.frame` es la tabla de trabajo de R. Con pocas funciones se pasa de los datos crudos a un resumen útil para la gestión energética.

## Ejercicio

Calcula el promedio del índice de consumo (`indice_kwh_m3`) por año. ¿Mejoró de 2022 a 2023?
