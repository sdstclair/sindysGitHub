#Histogram of North American River Lengths (in miles)

rr = data.frame(rivers)

m <- ggplot(rr, aes(x = rivers))
m + geom_histogram(binwidth = 500, color = "dark blue", fill = "sky blue") + ggtitle("Histogram of Length of Major North American Rivers") + xlab("Miles of the Rivers") + ylab("Number of Rivers")

#Boxplot of North American River Lengths (in miles)

rivers_boxplot <- ggplot(rr, aes(x=" ", y = rivers))
rivers_boxplot + geom_boxplot() + xlab(" ")

#Mathematically screen for outliers

summary(rivers)

IQR <- 680 - 310

Outlier_Range <- IQR * 1.5

680 + Outlier_Range
310 - Outlier_Range

#Normal Probability Plot of North American River Lengths (in miles)

ggplot(rr, aes(sample = rivers)) + geom_qq()