# Lección 07 - Regresión lineal con lm() en dos proyectos reales

salidas <- "lecciones/07_regresion_lineal/salidas"
dir.create(salidas, showWarnings = FALSE)

# Caso 1: línea base energética de Oil Malal
df <- read.csv("datos/oil_malal_mensual.csv", fileEncoding = "UTF-8")
lben <- lm(consumo_kwh ~ produccion_m3, data = df)     # ajuste E = m·P + b
m  <- coef(lben)[["produccion_m3"]]
b  <- coef(lben)[["(Intercept)"]]
r2 <- summary(lben)$r.squared
cat(sprintf("Línea base Oil Malal: E = %.4f·P + %.1f   R² = %.4f\n", m, b, r2))

# Caso 2: distancia de parada del goniómetro según la velocidad
g <- read.csv("datos/goniometro_distancia_parada.csv", fileEncoding = "UTF-8")
parada <- lm(distancia_parada_pulsos ~ velocidad_rpm, data = g)
cat(sprintf("Distancia de parada: d = %.1f·v + %.1f pulsos   R² = %.4f\n",
            coef(parada)[[2]], coef(parada)[[1]], summary(parada)$r.squared))
pred15 <- predict(parada, newdata = data.frame(velocidad_rpm = 15))
cat(sprintf("Predicción a 15 rpm: %.0f pulsos\n", pred15))

cat("\nResumen completo del modelo de línea base:\n")
print(summary(lben))

png(file.path(salidas, "regresiones.png"), width = 1300, height = 500, res = 120)
par(mfrow = c(1, 2))
plot(df$produccion_m3, df$consumo_kwh, pch = 19, col = "#1F3864",
     main = "Línea base energética", xlab = "Producción [m³]", ylab = "Consumo [kWh]")
abline(lben, col = "#E07A1F", lwd = 2)
plot(g$velocidad_rpm, g$distancia_parada_pulsos, pch = 19, col = "#1F3864", xlim = c(0, 20),
     main = "Goniómetro: distancia de parada", xlab = "Velocidad [rpm]", ylab = "Pulsos")
abline(parada, col = "#E07A1F", lwd = 2)
dev.off()
