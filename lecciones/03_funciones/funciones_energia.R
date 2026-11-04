# Lección 03 - Funciones: escribir una vez, usar muchas veces

# Consumo según la línea base energética de la tesis [kWh]
consumo_esperado <- function(produccion_m3, pendiente = 9.5209, intercepto = 8058.7) {
  pendiente * produccion_m3 + intercepto
}

# kWh consumidos por cada m³ producido
indice_consumo <- function(consumo_kwh, produccion_m3) {
  consumo_kwh / produccion_m3
}

# Convierte pulsos del encoder a grados del brazo del goniómetro
pulsos_a_grados <- function(pulsos, pulsos_por_grado = 3000) {
  pulsos / pulsos_por_grado
}

cat("Consumo esperado con 150 m³:", round(consumo_esperado(150), 1), "kWh\n")
cat("Índice de consumo mayo 2023:", round(indice_consumo(11503.69, 314.16), 2), "kWh/m³\n")
cat("540000 pulsos =", pulsos_a_grados(540000), "° del brazo\n")
cat("Con otra escala (444.44 pulsos/°):", round(pulsos_a_grados(20000, 444.44), 2), "°\n")

# Una función de R también recibe vectores completos:
cat("Consumo esperado con 100, 200 y 300 m³:", round(consumo_esperado(c(100, 200, 300)), 1), "\n")
