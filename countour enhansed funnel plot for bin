### Contour-enhanced funnel plots using meta ###

# Load meta package

library("meta")

# Load spreadsheet via copy-paste

dat <- read.table(pipe("pbpaste"), sep = "\t", header = TRUE)
head(dat)

# Calculate effects estimates for binary data via risk ratio

res_dat <- metabin(n.e = n.e, event.e = event.e, n.c = n.c, event.c = event.c,
                   comb.fixed = TRUE, comb.random = TRUE, data = dat, sm = "RR",
                   allstudies = TRUE, studlab = study)

res_dat

# forest plot

forest(res_dat, leftcols = c("studlab"))

# Funnel plot with legend

funnel(res_dat, contour.levels = c(0.9, 0.95, 0.99),
       col.contour = c("darkorange", "orange", "#f2cc42"),
       pch = 20, col = c("blue"), studlab = TRUE) +
  legend("topright", bg = c("white"),
         c("1 ≥ p > 0.1", "0.1 ≥ p > 0.05", "0.05 ≥ p > 0.01", "0.01 ≥ p"),
         bty = "o", fill = c("white", "darkorange", "orange", "#f2cc42"))
