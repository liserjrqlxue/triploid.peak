args = commandArgs(T)
input = args[1]

output = args[2]

read.table(
  input,
  stringsAsFactors = F,
  header = T,
  comment.char = ""
) -> a

a <- a[!is.na(a$A.Ratio),]
a$A.Ratio <- as.numeric(a$A.Ratio)
a[a$X.Chr %in% 1:22 & a$Zygosity %in% c("het-ref"),] -> het
density(na.omit(het$A.Ratio)) -> dens
peak_value = max(dens$y)
peak = dens$x[dens$y == max(dens$y)]
peak1 = dens$x[dens$y == max(dens$y[dens$x <= 0.5])]
peak2 = dens$x[dens$y == max(dens$y[dens$x >= 0.5])]
alpha = 0.05
threshold = c(c(1 - alpha, 1 + alpha) * 1 / 3, c(1 - alpha, 1 + alpha) * 2 / 3)
threshold2 = c(1 - alpha, 1 + alpha)  / 2

result = ""
if ((threshold[1] - peak) * (threshold[2] - peak) * (threshold[3] - peak) *
    (threshold[4] - peak) <= 0) {
  result = "是"
} else if ((threshold2[1] - peak) * (threshold2[2] - peak) <= 0) {
  result = "否"
} else{
  result = "异常"
}

write(file = paste0(output, ".txt"),
      paste(result, peak, peak1, peak2, sep = "\t"))

pdf(paste0(output, ".pdf"), width = 16, height = 9)
plot(dens, t = 'l', main = "Density of ALT Allele Ratio", col = 2)
abline(v = peak, col = 'grey')
text(peak, peak_value / 2, peak, col = 4)
dev.off()
