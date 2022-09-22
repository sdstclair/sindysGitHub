install.packages("car")
install.packages("caret")
install.packages("gvlma")
install.packages("predictmeans")
install.packages("e1071")
install.packages("lmtest")
library("car")
library("caret")
library("predictmeans")
library("e1071")
library("lmtest")
library("gvlma")

#Lesson 1

#Out of the 5 datasets that you chose during DSO104, choose a dataset which has 2
#variables that you intuit have a linear relationship of some importance. Complete all the
#assumption tests and create a linear model. Do this in RStudio. Assess R-squared value to
#see if there is a linear relationship and if all assumptions are met.
#Tip: Make sure to remove NA's after you create a dataframe with your 2 selected variables

library(readr)
diabetes <- read_csv("~/Education/Other/Entity Academy/Portfolio/DSO106C Extra Portfolio Activities/Diabetes Prediction/diabetes.csv")
View(diabetes)

#Context
#This dataset is originally from the National Institute of Diabetes and
#Digestive and Kidney Diseases. The objective of the dataset is to
#diagnostically predict whether or not a patient has diabetes, based on certain
#diagnostic measurements included in the dataset. Several constraints were
#placed on the selection of these instances from a larger database. In
#particular, all patients here are females at least 21 years old of Pima Indian heritage.

#Content
#The datasets consists of several medical predictor variables and one target
#variable, Outcome. Predictor variables includes the number of pregnancies the
#patient has had, their BMI, insulin level, age, and so on.

#About The File
#The datasets consist of several medical predictor (independent) variables and
#one target (dependent) variable, Outcome. Independent variables include the
#number of pregnancies the patient has had, their BMI, insulin level, age, and so on.

# Null hypothesis: There is not a linear relationship between blood pressure and age amidst the select population of Pima Indian women.

# Test Assumptions

## Linearity

scatter.smooth(x=diabetes$Age, y=diabetes$BloodPressure, main="Blood Pressure by Age")

### There is no linear relationship shown here.

##Homoscedasticity

lmMod <- lm(Age~BloodPressure, data=diabetes)
lmMod

### For the graph-inclined
par(mfrow=c(2,2))
plot(lmMod)

### For people like me!
lmtest::bptest(lmMod)

### Since the p value is greater than 0.05, thus in line with the assumption of
### homoscedasticity.


## Testing for Homogeneity of Variance
##Above, you were able to generate plots for testing homoscedasticity by looking
##at your residuals. These plots also provide useful information about homogeneity
##of variance, or how evenly your data is distributed. All you need to do is to
##see whether your data forms a nice box, or whether it is cone shaped at either
##end. In this case, the residual plots generated above (repeated here for
##your convenience) show a box, so I have passed the assumption of homogeneity
##of variance.

gvlma(lmMod)
# 	Global Stat: This indicates whether the relationship between your x and y data is linear. - Assumptions NOT Satisfied
#   Skewness: This is a measure of whether your data is normally distributed horizontally. - Assumptions NOT Satisfied
#   Kurtosis: This is an indicator of whether your data is normally distributed vertically - Assumptions NOT Satisfied
# 	Link Function: This tests whether your variable is continuous. If this has been violated,
#    then data is categorical and analyses such as logistic regression should be used instead. - Assumptions NOT Satisfied
# 	Heteroscedasticity: This is an indicator of whether your residuals are constant. If you
#    fail this, you fail the assumption of homoscedasticity discussed extensively above. - Assumptions acceptable.


# Screening for Outliers
CookD(lmMod, group=NULL, plot=TRUE, idn=3, newwd=TRUE)
### The numbers that appear are row numbers of data.  It appears as though the main outliers that pose to be a threat
### are cases 337, 358, and 454 in x space.

### You can also look at leverage values. Anything that has a leverage value of
###between .2 and .5 is a moderate problem, and anything over .5 is a major problem.
lev = hat(model.matrix(lmMod))
plot(lev)
# There is nothing over 0.2, but let's double check with the code below.
diabetes[lev>.2,]

# Testing for outliers in y space
car::outlierTest(lmMod)
### Case 454 and 460 has rstudent values of 4.361872 and 4.164339 with p values less than 0.05, so we will leave it be.
### The bonferroni p values are less than 0.05 indicating a level of significance.

#Testing for outliers in y and x space
summary(influence.measures(lmMod))
### If dffits or dfb.1 have any values greater than 1, then there are influential outliers.
### In this case, there are no influential outliers.

# Interpreting Output
summary(lmMod)
# First, look at the F statistic. The larger the F statistic, the more likely it
# is to be significant. What confirms this high F statistic, is that the
# P value is less than 0.05 - a second indicator of the linear model's significance.

#The slope was quite close to zero, at 0.14553. Because the linear model was considered
#significant, we can accept the null hypothesis that the Age of the many Pima Indian
#women influence their Blood Pressure, an additional complication from having diabetes.
#We can also take from the data that as these women's age, the more stabilized their
#blood pressure readings become, however, there is a high concentration of medium to
#high blood pressure readings for those in between the ages of 20-40 years old, indicating
#that there may be other factors attributed to this concentration and instances of 
#hypertension in the Pima Indian women community.




#Lesson 2

#Out of the 5 datasets that you chose during DSO104, choose a dataset that has 1 variable
#that is a binary classification (yes/no, on/off, true/false, etc) and one continuous variable
#that you intuit might influence this classification. Complete all the assumption tests and
#create a logistic regression model. Create a confusion matrix and assess the model's
#accuracy. Do this in R
library("caret")
library("magrittr")
library("dplyr")
library("tidyr")
library("lmtest")
library("popbio")
library("e1071")


scatter.smooth(x=diabetes$Pregnancies, y=diabetes$Outcome, main="Diabetic Outcome by Number of Pregnancies")

mylogit <- glm(Outcome ~ Pregnancies, data=diabetes, family="binomial")
mylogit

probabilities <- predict(mylogit, type = "response")
probabilities

diabetes$Predicted <- ifelse(probabilities > .5, "pos", "neg")
diabetes$Predicted

diabetes$PredictedR <- NA
diabetes$PredictedR[diabetes$Predicted=='pos'] <- 1
diabetes$PredictedR[diabetes$Predicted=='neg'] <- 0

diabetes$PredictedR <- as.factor(diabetes$PredictedR)
diabetes$OutcomeR <- as.factor(diabetes$Outcome)
# Create a confusion matrix
conf_mat <- caret::confusionMatrix(diabetes$PredictedR, diabetes$OutcomeR)
conf_mat

#According to this confusion matrix, out of the sample size of Pima Indian women
#studied that were predicted to not have acquired diabetes, 462 did not in actuality
#acquire diabetes, whereas 220 of them did acquire diabetes despite predictions
#that they wouldn't.

#Out of the sample size of Pima Indian women studied, 38 of those that were predicted
#to have acquired diabetes did not whereas 48 of those predicted to have diabetes
#actually acquired it.

#Roughly 66% of the time, my predictions are correct.

diabetes1 <- diabetes %>% 
  dplyr::select_if(is.numeric)

predictors <- colnames(diabetes1)

diabetes1 <- diabetes1 %>% mutate(logit=log(probabilities/(1-probabilities))) %>% gather(key="predictors", value="predictor.value", -logit)
diabetes1

ggplot(diabetes1, aes(logit, predictor.value))+
  geom_point(size=.5, alpha=.5)+
  geom_smooth(method= "loess")+
  theme_bw()+
  facet_wrap(~predictors, scales="free_y")

#As you can see from the multitude of graphs plotted, pregnancies exhibited a 
#highly linear relationship with being diagnosed with Diabetes. This graph shows
#that as the number of pregnancies increase, so does their likelihood of being
#diagnosed with diabetes.

plot(mylogit$residuals)
# This has not met the assumption for independent error entirely due to there not
# being an entirely even distribution at the top nor the bottom.

dwtest(mylogit, alternative="two.sided")
# Not significant, so we have met the assumption of having no independent errors.

infl <- influence.measures(mylogit)
summary(infl)

# There are no influential outliers present.

summary(mylogit)

# So the number of pregnancies is a significant predictor in the outcome of diabetes,
# due to the significant p values associated with the intercept and pregnancies
# coefficients.

logi.hist.plot(diabetes$Pregnancies, diabetes$Outcome, boxp=FALSE, type="hist", col="gray")

# This is the logistic model graphed and plotted.




#Multiple Logistic Regression
model.full = glm(OutcomeR ~ Pregnancies + Glucose + BloodPressure + SkinThickness + Insulin + BMI + DiabetesPedigreeFunction + Age, data = diabetes, family = binomial(link="logit"))
model.full

model.null = glm(OutcomeR ~ 1,
                 data=diabetes,
                 family = binomial(link="logit"))

step(model.null,
     scope = list(upper=model.full),
     direction="both",
     test="Chisq",
     data=diabetes)

model.final = glm(OutcomeR ~ Glucose + BMI + Pregnancies + DiabetesPedigreeFunction + BloodPressure + Age + Insulin,
                  data=diabetes,
                  family = binomial(link="logit"),
                  na.action(na.omit)
)

summary(model.final)

# Glucose, BMI, Pregnancies, Diabetes Pedigree Function, and Blood Pressure all
# have significant impact on the outcome of whether or not these Pima Indian
# women will have diabetes.

# Insulin and Age are not significant factors in determining whether or not these
# Pima Indian women will have diabetes because the p values for these coefficients
# are more than 0.05.

Anova(model.final, type="II", test="Wald")

#Lesson 3
#With the dataset and variables you chose for the Extra Activity in Lesson 1, create a
#quadratic and an exponential model. Assess R-squared value for each to see which of the 3
#models fits best.
#Tip: Make sure to remove NA's after you create a dataframe with your 2 selected variables

# To see if our model is quadratic in nature, let's graph it along a best fit quadratic line.
quadPlot <- ggplot(diabetes, aes(x = Age, y=BloodPressure)) + geom_point() + stat_smooth(method = "lm", formula = y ~x + I(x^2), size =1)
quadPlot

# Looks like the quadratic line is a pretty good fit for the data

#Model the qudratic relationship
Agesq <- diabetes$Age^2
quadModel <- lm(diabetes$BloodPressure~diabetes$Age+Agesq)
summary(quadModel)
# Looking at the F statistic and the p value of this model, this model has been 
# deemed significant, meaning that Age does play a quadratic role in how high or
# low these Pima Indian women's blood pressure readings are.

#Next we will produce an exponential model.
exMod <- lm(log(diabetes$Age)~diabetes$BloodPressure)
summary(exMod)
# The F statistic and the p value exhibits signs of significance, meaning that 
# there is an exponential relationship between blood pressure and age. When
# examining the estimate column, the blood pressure of the Pima Indian women
# increased by 0.4%.
