# This code helps exporting graphs to images
# Exporting data
setwd("C:/Users/fsaiu/UNI/MAGISTRALE/TELERILEVAMENTO")
getwd()
# png
png("greenland_output.png")
plot(gr)
dev.off()
# pdf
pdf("greenland_output.pdf")
plot(gr)
dev.off()
# Con le differenze
pdf("greenland_differences.pdf")
plot(grdiff)
dev.off()
# jpeg
jpeg("greenland_differences.jpeg")
plot(grdiff)
dev.off()
