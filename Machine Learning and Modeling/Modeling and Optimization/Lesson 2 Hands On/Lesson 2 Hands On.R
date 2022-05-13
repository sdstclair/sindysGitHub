library("caret")
library("magrittr")
library("dplyr")
library("tidyr")
library("lmtest")
library("popbio")
library("e1071")

#Geologists have long known that the presence
#of antimony in a ground sample can be a good
#indication that there is a gold deposit nearby.
#In the attached data, you will find antimony (Sb)
#levels for 64 different locations, and whether or
#not gold was found nearby. The "gold" column is
#coded as 0 for no gold present, and 1 for gold present.

#I will be using logistic regression in R to create a
#prediction model that will give the probability of the
#presence of gold as a response. Your complete report
#should contain the following information.

##Run the Base Logistic Model
mylogit <- glm(Gold ~ ï..Antimony, data=minerals, family="binomial")
mylogit

##Predict Presence of Gold in Antimony
probabilities <- predict(mylogit, type = "response")
probabilities

minerals$Predicted <- ifelse(probabilities > .5, "pos", "neg")
minerals$Predicted

##Recode the Predicted Variable
minerals$PredictedR <- NA
minerals$PredictedR[minerals$Predicted=='pos'] <- 1
minerals$PredictedR[minerals$Predicted=='neg'] <- 0

minerals$PredictedR <- as.factor(minerals$PredictedR)
minerals$PredictedR

minerals$Gold <- as.factor(minerals$Gold)
minerals$Gold

##Create a Confusion Matrix

conf_mat <- caret::confusionMatrix(minerals$PredictedR, minerals$Gold)
conf_mat

###According to the Confusion Matrix and Statistics produced below,
#there were 34 predictions in which there were no gold found in the antimony
#and it was found to be true. There were 2 predictions that there were 
#instances of gold in the antimony, but in reality there were not. There were
#8 predictions of gold not being present in the antimony when in reality
#there were 8 instances of gold being present in the antimony. And lastly,
#there were 20 predictions in which gold was found in the antimony, and 20
#instances where this was true.

###According to the P-Value, it was found to be less than 0.05, thus making the
#antimony a significant predictor of the presence of gold.

#Logit Linearity

minerals1 <- minerals %>%
dplyr::select_if(is.numeric)

minerals1

predictors <- colnames(minerals1)

minerals1 <- minerals1 %>%
mutate(logit=log(probabilities/(1-probabilities))) %>%
gather(key = "predictors", value ="predictor.value", -logit)

ggplot(minerals1, aes(logit, predictor.value)) + geom_point(size=.5, alpha=.5) + geom_smooth(method= "loess") + theme_bw() + facet_wrap(~predictors, scales="free_y")

###The logit is linearly related to the independent variable according the plot
#

#Graphing the Errors

plot(mylogit$residuals)

#Use the Durbin-Watson Test
dwtest(mylogit, alternative="two.sided")

#Screening for Outliers
infl <- influence.measures(mylogit)
summary(infl)

#Running Logistic Regression and Interpreting the Output
summary(mylogit)

#Graphing the Logistic Model
logi.hist.plot(minerals$ï..Antimony, minerals$Gold, boxp=FALSE, type="hist", col="gray")
