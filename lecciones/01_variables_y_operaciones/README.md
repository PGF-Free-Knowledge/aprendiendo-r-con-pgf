# Lección 01 · Variables y operaciones

**Objetivo:** Guardar datos en variables y operar con ellos, usando el consumo real de la planta Oil Malal y la escala del goniómetro.

**Proyecto asociado:** Tesis Oil Malal (consumo y producción de enero 2022) y sistema de posicionamiento angular (pulsos del encoder).

## Paso a paso

1. Abre RStudio con el archivo `aprendiendo-r-con-pgf.Rproj` (doble clic). Así R trabaja desde la carpeta principal del repositorio.
2. Abre el archivo [`energia_basica.R`](energia_basica.R) (menú **File → Open File**) y léelo junto con la explicación de abajo.
3. Ejecuta el programa completo con el botón **Source** (arriba a la derecha del editor), o escribe en la consola:

```r
source("lecciones/01_variables_y_operaciones/energia_basica.R")
```

4. Compara lo que aparece en la consola con el **resultado esperado**.

## Qué hace el código

- `consumo_kwh <- 8674.83` crea una variable llamada `consumo_kwh` y le asigna el valor 8674.83. En R se asigna con la flecha `<-`.
- `consumo_kwh / 1000` divide. Así se convierte de kWh a MWh.
- `consumo_kwh / produccion_m3` calcula el **índice de consumo**: cuántos kWh se gastaron por cada m³ producido.
- `3000L`: la letra `L` indica que el número es entero (`integer`). Sin la `L`, R lo guarda como decimal (`numeric`).
- `cat()` muestra textos y números en la consola. `\n` es el salto de línea.
- `sprintf("%.4f", x)` muestra un número con 4 decimales; `%d` muestra un entero. `round(x, 3)` redondea a 3 decimales.
- `class(variable)` indica el tipo de dato.

## Resultado esperado

```text
Planta: Oil Malal 
Consumo enero 2022: 8674.83 kWh = 8.675 MWh
Índice de consumo: 119.92 kWh/m³
15000 pulsos = 5.0 ° del brazo = 0.0938 vueltas del motor
Clase de consumo_kwh: numeric 
Clase de pulsos_leidos: integer
```

## Qué aprendimos

Una variable es un nombre que guarda un valor. Con los operadores `+ - * /` se calculan indicadores de ingeniería como el índice de consumo o la conversión de pulsos a grados.

## Ejercicio

Cambia `consumo_kwh` y `produccion_m3` por los de mayo de 2023 (11503.69 kWh y 314.16 m³) y compara el índice de consumo con el de enero de 2022.
