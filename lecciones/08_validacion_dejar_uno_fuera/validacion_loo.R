# Lección 08 - Entrenar, predecir y validar con «dejar uno fuera»

df <- read.csv("datos/oil_malal_mensual.csv", fileEncoding = "UTF-8")
df$mes_num <- as.integer(substr(df$mes, 6, 7))   # 1 = enero ... 12 = diciembre

# Modelo A: solo producción (equivale a la línea base)
modelo_a <- lm(consumo_kwh ~ produccion_m3, data = df)
cat(sprintf("Modelo A: E = %.4f·P + %.1f\n", coef(modelo_a)[[2]], coef(modelo_a)[[1]]))

# Modelo B: producción + mes del año
formula_b <- consumo_kwh ~ produccion_m3 + mes_num

# Validación "dejar uno fuera": con 23 meses, se entrena 23 veces con 22
# meses y se predice el mes que quedó fuera.
dejar_uno_fuera <- function(formula, datos) {
  pred <- numeric(nrow(datos))
  for (i in seq_len(nrow(datos))) {
    modelo  <- lm(formula, data = datos[-i, ])
    pred[i] <- predict(modelo, newdata = datos[i, ])
  }
  pred
}

pred_a <- dejar_uno_fuera(consumo_kwh ~ produccion_m3, df)
pred_b <- dejar_uno_fuera(formula_b, df)
mae <- function(real, pred) mean(abs(real - pred))
cat(sprintf("Error medio (MAE) modelo A: %6.1f kWh\n", mae(df$consumo_kwh, pred_a)))
cat(sprintf("Error medio (MAE) modelo B: %6.1f kWh\n", mae(df$consumo_kwh, pred_b)))

nuevo <- data.frame(produccion_m3 = 150)
cat(sprintf("Predicción para 150 m³: %.1f kWh\n", predict(modelo_a, newdata = nuevo)))
