# Lección 08 · Validación «dejar uno fuera»

**Objetivo:** Medir cuánto se equivoca un modelo con datos que no vio, y comparar dos modelos de forma justa.

**Proyecto asociado:** Tesis Oil Malal.

## Paso a paso

1. Abre RStudio con el archivo `aprendiendo-r-con-pgf.Rproj` (doble clic). Así R trabaja desde la carpeta principal del repositorio.
2. Abre el archivo [`validacion_loo.R`](validacion_loo.R) (menú **File → Open File**) y léelo junto con la explicación de abajo.
3. Ejecuta el programa completo con el botón **Source** (arriba a la derecha del editor), o escribe en la consola:

```r
source("lecciones/08_validacion_dejar_uno_fuera/validacion_loo.R")
```

4. Compara lo que aparece en la consola con el **resultado esperado**.

## Qué hace el código

- `as.integer(substr(df$mes, 6, 7))` extrae el número del mes (1 a 12) desde el texto `2022-05`.
- La función `dejar_uno_fuera()` entrena el modelo 23 veces: cada vez deja fuera un mes (`datos[-i, ]`) y predice ese mes.
- `mae()` calcula el **error absoluto medio**: el promedio de cuánto se equivocó el modelo, en kWh.
- El modelo B agrega el mes del año. Si su MAE no baja, la variable no aporta información útil.

## Resultado esperado

```text
Modelo A: E = 9.5210·P + 8058.7
Error medio (MAE) modelo A:  264.0 kWh
Error medio (MAE) modelo B:  267.4 kWh
Predicción para 150 m³: 9486.8 kWh
```

## Qué aprendimos

Un modelo se evalúa con datos que no usó para entrenar. Con pocos datos, «dejar uno fuera» aprovecha todos los meses.

## Ejercicio

Crea un modelo C con `consumo_kwh ~ produccion_m3 + I(produccion_m3^2)` y compara su MAE con el del modelo A.
