# Lección 10 - Árbol de decisión: reglas que se pueden leer
library(rpart)   # viene incluido con R

df <- read.csv("datos/oil_malal_mensual.csv", fileEncoding = "UTF-8")
df$mes_num <- as.integer(substr(df$mes, 6, 7))
df$eficiente <- factor(as.integer(df$consumo_kwh <= 9.5209 * df$produccion_m3 + 8058.7))

# Con solo 23 meses se relajan los mínimos por defecto de rpart
# (minsplit = 20 casi no dejaría dividir).
control_arbol <- function(profundidad) {
  rpart.control(maxdepth = profundidad, minsplit = 2, minbucket = 1, cp = 0, xval = 0)
}

for (profundidad in 1:3) {
  pred <- character(nrow(df))
  for (i in seq_len(nrow(df))) {          # validación «dejar uno fuera»
    arbol   <- rpart(eficiente ~ produccion_m3 + mes_num, data = df[-i, ],
                     method = "class", control = control_arbol(profundidad))
    pred[i] <- as.character(predict(arbol, df[i, ], type = "class"))
  }
  cat(sprintf("Profundidad %d: exactitud %.2f\n", profundidad, mean(pred == df$eficiente)))
}

arbol <- rpart(eficiente ~ produccion_m3 + mes_num, data = df,
               method = "class", control = control_arbol(2))
cat("\nReglas del árbol (profundidad 2):\n")
print(arbol)
