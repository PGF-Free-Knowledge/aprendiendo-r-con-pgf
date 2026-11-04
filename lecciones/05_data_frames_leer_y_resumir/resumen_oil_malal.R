# Lección 05 - data.frame: leer, explorar y resumir datos reales

df <- read.csv("datos/oil_malal_mensual.csv", fileEncoding = "UTF-8")
cat("Primeras filas:\n")
print(head(df))
cat("\nTamaño (filas, columnas):", dim(df), "\n")

cat("\nEstadística descriptiva:\n")
print(summary(df[, c("produccion_m3", "consumo_kwh")]))

# Nueva columna calculada
df$indice_kwh_m3 <- df$consumo_kwh / df$produccion_m3

# Columna con el año y promedio por año
df$anio <- substr(df$mes, 1, 4)
cat("\nPromedio por año:\n")
promedio <- aggregate(cbind(produccion_m3, consumo_kwh) ~ anio, data = df, FUN = mean)
print(promedio, digits = 6)

# Filtrar: meses con producción sobre 200 m³
cat("\nMeses con producción > 200 m³:\n")
print(subset(df, produccion_m3 > 200, select = c(mes, produccion_m3, consumo_kwh)))

fila_max <- df[which.max(df$consumo_kwh), ]
cat(sprintf("\nMes de mayor consumo: %s (%.2f kWh)\n", fila_max$mes, fila_max$consumo_kwh))
