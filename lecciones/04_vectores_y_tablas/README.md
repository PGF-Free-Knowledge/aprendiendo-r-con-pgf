# Lección 04 · Vectores y tablas

**Objetivo:** Leer el inventario de motores, sumar, agrupar por área y ordenar los equipos de mayor consumo.

**Proyecto asociado:** Tesis Oil Malal: inventario de motores y bombas usado en el análisis de Pareto de usos significativos de la energía.

## Paso a paso

1. Abre RStudio con el archivo `aprendiendo-r-con-pgf.Rproj` (doble clic). Así R trabaja desde la carpeta principal del repositorio.
2. Abre el archivo [`inventario_motores.R`](inventario_motores.R) (menú **File → Open File**) y léelo junto con la explicación de abajo.
3. Ejecuta el programa completo con el botón **Source** (arriba a la derecha del editor), o escribe en la consola:

```r
source("lecciones/04_vectores_y_tablas/inventario_motores.R")
```

4. Compara lo que aparece en la consola con el **resultado esperado**.

## Qué hace el código

- `read.csv("datos/oil_malal_motores.csv")` lee el archivo y crea una **tabla** (`data.frame`). Cada columna es un vector.
- `equipos$potencia_kw` toma la columna de potencia. `sum()` la suma completa, sin ciclos.
- `tapply(valores, grupos, sum)` suma los valores de cada grupo: aquí, el consumo mensual de cada área.
- `order(..., decreasing = TRUE)` entrega el orden de mayor a menor; `head(..., 3)` toma las tres primeras filas.
- `format(texto, width = 26)` completa el texto con espacios hasta 26 caracteres, para que los números queden alineados.

## Resultado esperado

```text
Equipos en el inventario: 20 
Primer equipo: Bomba de pozo - 0.7 kW
Potencia instalada total: 84.4 kW

Consumo mensual por área [kWh/mes]:
  Agua jabonosa y aditivos    385.2
  Almacenamiento              100.8
  Emulsión                    291.6
  Nodriza                     741.6

Tres equipos de mayor consumo:
  Motor de mezcladora          403.2 kWh/mes
  Bomba de asfalto in          201.6 kWh/mes
  Motor rotador emulsión       147.6 kWh/mes
```

## Qué aprendimos

R trabaja con columnas completas: sumar, agrupar y ordenar se hace con una sola función. Así se identifican los equipos que más pesan en el consumo.

## Ejercicio

Repite el análisis con `datos/oil_malal_aire_acondicionado.csv`: consumo anual por área y los tres equipos de mayor consumo.
