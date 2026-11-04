# Lección 02 - Condicionales (if) y ciclos (for)
# Se compara cada mes con la línea base energética de la tesis:
#   consumo esperado = 9,5209 · producción + 8058,7

PENDIENTE  <- 9.5209
INTERCEPTO <- 8058.7

# Primeros seis meses válidos de 2022
mes        <- c("2022-01", "2022-03", "2022-04", "2022-05", "2022-06", "2022-07")
produccion <- c(72.34, 104.70, 198.86, 265.41, 188.36, 177.70)    # m³
consumo    <- c(8674.83, 9689.25, 9823.56, 10503.89, 9931.33, 9668.73)  # kWh

sobre <- 0
for (i in seq_along(mes)) {
  esperado   <- PENDIENTE * produccion[i] + INTERCEPTO
  diferencia <- consumo[i] - esperado
  if (diferencia > 0) {
    estado <- "SOBRE la línea base"
    sobre  <- sobre + 1
  } else {
    estado <- "bajo la línea base"
  }
  cat(sprintf("%s: real %8.1f | esperado %8.1f | %+7.1f kWh -> %s\n",
              mes[i], consumo[i], esperado, diferencia, estado))
}

cat(sprintf("\nMeses sobre la línea base: %d de %d\n", as.integer(sobre), length(mes)))
