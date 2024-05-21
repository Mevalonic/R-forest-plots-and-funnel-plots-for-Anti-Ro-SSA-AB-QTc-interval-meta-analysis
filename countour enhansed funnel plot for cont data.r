### Contour-enhanced funnel plots for cont data using meta ###

# Load meta package

library("meta")

# Load spreadsheet via copy-paste

dat <- read.table(pipe("pbpaste"), sep = "\t", header = TRUE)
head(dat)

# Calculate effects estimates for continuous data via standart mean difference

res_dat <- metacont(n.exp, mean.exp, sd.exp, n.cont, mean.cont, sd.cont,
                    comb.fixed = TRUE, comb.random = TRUE,
                    studlab = study, data = dat, sm = "SMD")

res_dat

# forest plot

forest(res_dat, leftcols = c("studlab"))

# Funnel plot

funnel(res_dat, contour.levels = c(0.9, 0.95, 0.99),
       col.contour = c("darkorange", "orange", "#f2cc42"),
       pch = 20, col = c("green"), studlab = TRUE) +
  legend("topright", bg = c("white"),
         c("1 ≥ p > 0.1", "0.1 ≥ p > 0.05", "0.05 ≥ p > 0.01", "0.01 ≥ p"),
         bty = "o", fill = c("white", "darkorange", "orange", "#f2cc42"))
