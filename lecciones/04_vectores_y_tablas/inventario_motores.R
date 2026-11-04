# Lección 04 - Vectores y tablas con el inventario de motores de Oil Malal

# 1) Leer el CSV: cada columna queda como un vector
equipos <- read.csv("datos/oil_malal_motores.csv", fileEncoding = "UTF-8")

cat("Equipos en el inventario:", nrow(equipos), "\n")
cat("Primer equipo:", equipos$equipo[1], "-", equipos$potencia_kw[1], "kW\n")

# 2) Sumar un vector completo, sin ciclos
cat("Potencia instalada total:", round(sum(equipos$potencia_kw), 1), "kW\n")

# 3) Agrupar: consumo mensual por área
por_area <- tapply(equipos$kwh_mes, equipos$area, sum)
cat("\nConsumo mensual por área [kWh/mes]:\n")
for (area in names(por_area)) {
  cat(sprintf("  %-26s %7.1f\n", area, por_area[[area]]))
}

# 4) Ordenar: los 3 equipos de mayor consumo
top <- head(equipos[order(equipos$kwh_mes, decreasing = TRUE), ], 3)
cat("\nTres equipos de mayor consumo:\n")
for (i in seq_len(nrow(top))) {
  cat(sprintf("  %-28s %6.1f kWh/mes\n", top$equipo[i], top$kwh_mes[i]))
}
