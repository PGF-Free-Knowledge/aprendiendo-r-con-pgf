# Lección 06 - Gráficos con R base

df <- read.csv("datos/oil_malal_mensual.csv", fileEncoding = "UTF-8")
salidas <- "lecciones/06_graficos/salidas"
dir.create(salidas, showWarnings = FALSE)

# Gráfico 1: barras de consumo mensual
png(file.path(salidas, "consumo_mensual.png"), width = 1200, height = 500, res = 120)
par(mar = c(6, 5, 3, 1))
barplot(df$consumo_kwh, names.arg = df$mes, las = 2, col = "#1F3864",
        main = "Consumo eléctrico mensual - Oil Malal", ylab = "kWh/mes", cex.names = 0.8)
invisible(dev.off())   # cierra el archivo de imagen

# Gráfico 2: dispersión consumo vs producción
png(file.path(salidas, "consumo_vs_produccion.png"), width = 750, height = 560, res = 120)
plot(df$produccion_m3, df$consumo_kwh, pch = 19, col = "#E07A1F",
     main = "Consumo vs producción",
     xlab = "Producción [m³/mes]", ylab = "Consumo [kWh/mes]")
grid()
invisible(dev.off())   # cierra el archivo de imagen

cat("Gráficos guardados en:", salidas, "\n")
