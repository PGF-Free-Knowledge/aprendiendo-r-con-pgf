# Lección 11 - Random Forest: muchos árboles que votan
suppressPackageStartupMessages(library(randomForest))   # install.packages("randomForest") la primera vez

df <- read.csv("datos/oil_malal_mensual.csv", fileEncoding = "UTF-8")
df$mes_num <- as.integer(substr(df$mes, 6, 7))
formula <- consumo_kwh ~ produccion_m3 + mes_num

pred_lineal <- numeric(nrow(df))
pred_rf     <- numeric(nrow(df))
set.seed(0)
for (i in seq_len(nrow(df))) {            # validación «dejar uno fuera»
  entrenamiento  <- df[-i, ]
  pred_lineal[i] <- predict(lm(formula, data = entrenamiento), df[i, ])
  bosque         <- randomForest(formula, data = entrenamiento, ntree = 300, nodesize = 2)
  pred_rf[i]     <- predict(bosque, df[i, ])
}

mae <- function(real, pred) mean(abs(real - pred))
cat(sprintf("MAE regresión lineal : %6.1f kWh\n", mae(df$consumo_kwh, pred_lineal)))
cat(sprintf("MAE Random Forest    : %6.1f kWh\n", mae(df$consumo_kwh, pred_rf)))

set.seed(0)
bosque <- randomForest(formula, data = df, ntree = 300, nodesize = 2)
imp <- importance(bosque)[, "IncNodePurity"]
imp <- imp / sum(imp)                     # en proporción, para comparar
cat("\nImportancia de variables (Random Forest):\n")
for (nombre in names(imp)) cat(sprintf("  %-14s %.2f\n", nombre, imp[[nombre]]))

nuevo <- data.frame(produccion_m3 = 150, mes_num = 6L)
cat(sprintf("\nPredicción para 150 m³ en junio: %.1f kWh\n", predict(bosque, nuevo)))
