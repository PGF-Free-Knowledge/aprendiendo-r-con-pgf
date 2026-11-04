# Lección 09 - k vecinos más cercanos (KNN): clasificar meses eficientes
library(class)   # viene incluido con R

df <- read.csv("datos/oil_malal_mensual.csv", fileEncoding = "UTF-8")
df$mes_num <- as.integer(substr(df$mes, 6, 7))

# Etiqueta: 1 = mes eficiente (consumo real <= consumo esperado por la LBEn)
esperado <- 9.5209 * df$produccion_m3 + 8058.7
df$eficiente <- factor(as.integer(df$consumo_kwh <= esperado))
cat("Meses eficientes:", sum(df$eficiente == "1"), "de", nrow(df), "\n")

# scale(): pone ambas variables en la misma escala antes de medir distancias
# (si no, la producción dominaría al mes).
X <- scale(df[, c("produccion_m3", "mes_num")])
y <- df$eficiente

# knn.cv() hace directamente la validación «dejar uno fuera».
set.seed(1)   # los empates se resuelven al azar; la semilla los fija
for (k in c(1, 3, 5, 7)) {
  pred <- knn.cv(train = X, cl = y, k = k)
  cat(sprintf("k = %d: exactitud %.2f\n", k, mean(pred == y)))
}

set.seed(1)
pred <- knn.cv(train = X, cl = y, k = 3)
cat("\nMatriz de confusión (k = 3):\n")
print(table(real = y, predicho = pred))

# Mes nuevo: se escala con la media y la desviación de los datos de entrenamiento
centro <- attr(X, "scaled:center")
escala <- attr(X, "scaled:scale")
nuevo  <- scale(data.frame(produccion_m3 = 250, mes_num = 5), center = centro, scale = escala)
clase  <- knn(train = X, test = nuevo, cl = y, k = 3)
cat("\nMes nuevo con 250 m³ en mayo ->", ifelse(clase == "1", "eficiente", "no eficiente"), "\n")
