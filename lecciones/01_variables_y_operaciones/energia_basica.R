# Lección 01 - Variables y operaciones
# Datos reales: enero de 2022 en la planta Oil Malal y escala del goniómetro.

# --- Variables numéricas ---------------------------------------------------
consumo_kwh   <- 8674.83   # consumo eléctrico de enero 2022 [kWh]
produccion_m3 <- 72.34     # producción de emulsión de enero 2022 [m³]

# --- Operaciones -------------------------------------------------------------
consumo_mwh    <- consumo_kwh / 1000             # conversión de unidades
indice_consumo <- consumo_kwh / produccion_m3    # kWh por cada m³ producido

# --- Números enteros del goniómetro (la L final indica entero) --------------
pulsos_por_vuelta_motor <- 160000L   # resolución medida del encoder
pulsos_por_grado_brazo  <- 3000L     # escala del brazo del goniómetro
pulsos_leidos           <- 15000L    # lectura de ejemplo para el cálculo

grados_brazo  <- pulsos_leidos / pulsos_por_grado_brazo
vueltas_motor <- pulsos_leidos / pulsos_por_vuelta_motor

# --- Texto y resultados -------------------------------------------------------
planta <- "Oil Malal"
cat("Planta:", planta, "\n")
cat("Consumo enero 2022:", consumo_kwh, "kWh =", round(consumo_mwh, 3), "MWh\n")
cat("Índice de consumo:", round(indice_consumo, 2), "kWh/m³\n")
cat(sprintf("%d pulsos = %.1f ° del brazo = %.4f vueltas del motor\n",
            pulsos_leidos, grados_brazo, vueltas_motor))
cat("Clase de consumo_kwh:", class(consumo_kwh), "\n")
cat("Clase de pulsos_leidos:", class(pulsos_leidos), "\n")
