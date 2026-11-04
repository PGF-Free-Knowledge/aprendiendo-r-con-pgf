# Lección 12 - Explicar un modelo: importancia por permutación y dependencia parcial
library(randomForest)

df <- read.csv("datos/oil_malal_mensual.csv", fileEncoding = "UTF-8")
df$mes_num <- as.integer(substr(df$mes, 6, 7))
salidas <- "lecciones/12_explicabilidad/salidas"
dir.create(salidas, showWarnings = FALSE)

set.seed(0)
modelo <- randomForest(consumo_kwh ~ produccion_m3 + mes_num, data = df,
                       ntree = 300, nodesize = 2, importance = TRUE)

# Permutación: si desordeno una variable y el error sube mucho, esa variable importa.
# %IncMSE = cuánto aumenta el error cuadrático medio (en %) al desordenarla.
imp <- importance(modelo, type = 1, scale = FALSE)
cat("Importancia por permutación (aumento del error cuadrático al desordenar):\n")
for (nombre in rownames(imp)) cat(sprintf("  %-14s %10.0f\n", nombre, imp[nombre, 1]))

# Dependencia parcial: cómo cambia la predicción al variar la producción.
png(file.path(salidas, "dependencia_parcial.png"), width = 750, height = 560, res = 120)
partialPlot(modelo, pred.data = df, x.var = "produccion_m3",
            main = "Efecto de la producción en el consumo predicho",
            xlab = "Producción [m³/mes]", ylab = "Consumo predicho [kWh]")
dev.off()
cat("\nGráfico guardado en:", file.path(salidas, "dependencia_parcial.png"), "\n")
