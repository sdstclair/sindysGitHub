library("rcompanion")
library("car")
library("effects")
library("multcomp")

library(readr)
cellPhone <- read.csv("Education/Other/Entity Academy/Intermediate Statistics/Hands On/Lesson 7 Hands On/cellPhone.csv")
View(cellPhone)

#Many folks with international relatives often find themselves calling at odd
#hours to fit typical schedules in other time zones. How does the presence or
#absence of an international phone plan (International.Plan) influence the use
#of nighttime minutes (Night.Mins), holding whether or not the client has a
#voicemail plan (vMail.Plan) constant?

# CV = vMail.Plan
# IV = International.Plan
# DV = Night.Mins

#Are the CV and the IV categorical and strings?
str(cellPhone$International.Plan)
str(cellPhone$vMail.Plan)
#Yes, there are already in strings.

#Test Assumptions

# Normality
plotNormalHistogram(cellPhone$Night.Mins)
# This meets the assumption of normality.

# Homogeneity of Variance 
leveneTest(cellPhone$Night.Mins ~ cellPhone$International.Plan, data=cellPhone)
# This is not significant. So the assumption for homogeneity of variance has been validated.

Homogeneity_RegrSlp = lm(Night.Mins~vMail.Plan, data=cellPhone)
anova(Homogeneity_RegrSlp)

#Running the Analysis
ANCOVA = lm(Night.Mins ~ vMail.Plan + International.Plan * vMail.Plan, data=cellPhone)
anova(ANCOVA)

#Whether a client has an international plan or not does not influence the number
#of night minutes he or she uses, even holding whether they have a voice mail
#plan constant.
