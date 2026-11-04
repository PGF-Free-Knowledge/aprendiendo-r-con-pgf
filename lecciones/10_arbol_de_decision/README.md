# Lección 10 · Árbol de decisión

**Objetivo:** Clasificar meses eficientes con reglas del tipo «si producción < X entonces...» que se pueden leer y explicar.

**Proyecto asociado:** Tesis Oil Malal.

## Paso a paso

1. Abre RStudio con el archivo `aprendiendo-r-con-pgf.Rproj` (doble clic). Así R trabaja desde la carpeta principal del repositorio.
2. Abre el archivo [`arbol_eficiencia.R`](arbol_eficiencia.R) (menú **File → Open File**) y léelo junto con la explicación de abajo.
3. Ejecuta el programa completo con el botón **Source** (arriba a la derecha del editor), o escribe en la consola:

```r
source("lecciones/10_arbol_de_decision/arbol_eficiencia.R")
```

4. Compara lo que aparece en la consola con el **resultado esperado**.

## Qué hace el código

- `rpart(eficiente ~ produccion_m3 + mes_num, method = "class")` construye un árbol de clasificación.
- `maxdepth` limita la profundidad: cuántas preguntas seguidas puede hacer el árbol.
- Por defecto `rpart` exige 20 datos para dividir un nodo (`minsplit = 20`); con 23 meses casi no dividiría, por eso se usa `minsplit = 2`.
- La exactitud se mide con «dejar uno fuera», igual que en la lección 08.
- `print(arbol)` muestra las reglas: cada línea es un nodo con la condición, el número de meses, los errores y la clase predicha. Las hojas se marcan con `*`.

## Resultado esperado

```text
Profundidad 1: exactitud 0.74
Profundidad 2: exactitud 0.65
Profundidad 3: exactitud 0.52

Reglas del árbol (profundidad 2):
n= 23 

node), split, n, loss, yval, (yprob)
      * denotes terminal node

1) root 23 10 1 (0.4347826 0.5652174)  
  2) mes_num>=8.5 8  2 0 (0.7500000 0.2500000) *
  3) mes_num< 8.5 15  4 1 (0.2666667 0.7333333)  
    6) produccion_m3>=289.785 1  0 0 (1.0000000 0.0000000) *
    7) produccion_m3< 289.785 14  3 1 (0.2142857 0.7857143) *
```

## Qué aprendimos

Los árboles son fáciles de explicar, pero con pocos datos conviene mantenerlos simples: más profundidad no significa más exactitud.

## Ejercicio

Instala `rpart.plot` (`install.packages("rpart.plot")`) y dibuja el árbol con `rpart.plot::rpart.plot(arbol)`.
