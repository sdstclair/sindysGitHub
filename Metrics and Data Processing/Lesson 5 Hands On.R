library(readr)
studentSurvey <- read_csv("studentSurvey.csv")
View(studentSurvey)

studentSurveyAreas <- studentSurvey[, 31:42]
studentSurveyAreas

studentSurveyAreas2 <- na.omit(studentSurveyAreas)

View(studentSurveyAreas2)

studentSurveyMatrix <- cor(studentSurveyAreas2)
studentSurveyMatrix



View(round(studentSurveyMatrix, 2))

cortest.bartlett(studentSurveyAreas2)

det(studentSurveyMatrix)

#If this value is greater than 0.00001 then this is a suff-
#-icient relation between your variables to proceed further.
#In this case, it is!

pcModel1 <- principal(studentSurveyAreas2, nfactors = 12, rotate = "none")
pcModel1

#Examine the Scree Plot
plot(pcModel1$values, type="b")

pcModel2 <- principal(studentSurveyAreas2, nfactors = 2, rotate = "none")
pcModel2

residuals <- factor.residuals(studentSurveyMatrix, pcModel2$loadings)
residuals

residuals1 <- as.matrix(residuals[upper.tri(residuals)])
residuals1

largeResid <- abs(residuals) > .05
largeResid

sum(largeResid)
#This is equal to 72

sum(largeResid/nrow(residuals))
#This is equal to 6

pcModel3 <- principal(studentSurveyAreas2, nfactors = 2, rotate = "oblimin")
pcModel3

print.psych(pcModel3, cut=.3, sort=TRUE)

pcModel4 <- principal(studentSurveyAreas2, nfactors = 2, rotate = "varimax")
print.psych(pcModel4, cut=.3, sort=TRUE)
