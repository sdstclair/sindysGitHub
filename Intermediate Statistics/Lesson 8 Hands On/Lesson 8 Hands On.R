library(readr)
heartAttacks <- read_csv("~/Education/Other/Entity Academy/Intermediate Statistics/Hands On/Lesson 8 Hands On/heartAttacks.csv")
View(heartAttacks)

# It is well-known that men are more likely to have heart attacks than women.
# How does gender (sex) influence some of the heart attack predictors like
# resting blood pressure (trestbps) and cholesterol (chol)?

# IV = gender (sex)
# DV = blood pressure (trestbps)
# DV = cholesterol (chol)

str(heartAttacks$trestbps)
str(heartAttacks$chol)

keeps <- c("trestbps", "chol")
heartAttacks1 <- heartAttacks[keeps]

# The dependent variables are already numeric, so no need for data wrangling.

#Wilks-Shapiro Test
mshapiro.test(t(heartAttacks1))

# Significant for the p value is less than 0.05. This does not meet the
# assumption for MANOVAs

# Homogeneity of Variance
leveneTest(heartAttacks$trestbps, heartAttacks$sex, data=kickstarter)
leveneTest(heartAttacks$chol, heartAttacks$sex, data=kickstarter)
# THe p value for cholesterol and sex's influence on it was significant, while
# the p value for blood pressure and sex's influence on it wasn't significant.

# The levene test for blood pressure meets the assumption for homogeneity of
# variance, while the cholesterol levene test does not due to its significance.

# Absence of Multicollinearity
cor.test(heartAttacks$trestbps, heartAttacks$chol, method="pearson", use="complete.obs")
# There is an absence of multicollinearity

# Analysis
MANOVA <- manova(cbind(trestbps, chol) ~ sex, data = heartAttacks)
summary(MANOVA)

# Looks significant.

# Post Hocs
summary.aov(MANOVA, test = "wilks")
# For bloodpressure, sex carries litle to no significant influence over blood pressure.
# For choleseterol, sex carries much significant influence over cholesterol readings.