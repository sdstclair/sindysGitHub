#PART 1

library(readr)
FVH <- read_csv("C:/Users/sdstc/Documents/Education/Other/Entity Academy/Final Project/Final Project/Datasets for Final Project/First Choice Dataset/pivoted_usdaHoney2.csv")
View(FVH)

#BACKWARD SELECTION
FitAll1 <- lm(Honey ~ ., data = FVH)
FitAll1

summary(FitAll1)

#The overall p value at the bottom is not significant and  none of the individual
#predictors are, meaning that the model is  not a good fit; what the independent
#variables are does not really matter.

#Once you have created a new model after backward elimination, you can compare the
#above model summary with all 10 predictors against what R has helped determine is the best fit.

step(FitAll1, direction = 'backward')

#According to the the backwards stepwise regression, if none of the predictors
#were removed, it would yield the lowest AIC score of 51.84.

#Create another model for only selected variables and compare their results
fitsome <- lm(formula = Honey ~ Year + Corn + `Fresh Cherries,(Sweet&Sour)` + 
                `Grapefruit, Fresh` + `Grapes, Fresh` + `Lemons/Limes, Fresh` + 
                Raisins + `Tangerines/Mandarins, Fresh`, data = FVH)
fitsome

summary(fitsome)

#PART 2

#Forward Selection
FitAll2 <- lm(Honey ~ 1, data = FVH)
summary(FitAll2)

step(FitAll2, direction = 'forward', scope = (formula(FitAll1)))

#StepWise
step(FitAll2, direction = 'both', scope = formula(FitAll1))

fitsome1 <- lm(formula = Honey ~ Year, data = FVH)
summary(fitsome1)

#Which model is the best? Why?
bestmodel <- lm(formula = Honey ~ Year + Corn + `Fresh Cherries,(Sweet&Sour)` + 
                  `Grapefruit, Fresh` + `Grapes, Fresh` + `Lemons/Limes, Fresh` + 
                  Raisins + `Tangerines/Mandarins, Fresh`, data = FVH)
bestmodel

summary(bestmodel)
#From the best model, what is the adjusted R2 value and what does it mean?
# The adjusted R^2 is equal to 0.8214, which ultimately judges whether the data in the regression
# equation is a good fit. The higher the adjusted R^2, the better the regression equation
# as it implies that the independent variable is chosen to determine the dependent variable.

#From the best model, how does each variable influence Honey?
# In this case, 82.14% implies that the independent variables explains only that amount of the
# variation in the dependent variable.


#Which model was the best for each type of method?
# fitsome was the best for this type of method, or lm(formula = Honey ~ Year + Corn + `Fresh Cherries,(Sweet&Sour)` + `Grapefruit, Fresh` + `Grapes, Fresh` + `Lemons/Limes, Fresh` + Raisins + `Tangerines/Mandarins, Fresh`, data = FVH)

#How do the final models from each method compare to each other?
# The AIC of fitsome was 51.84, the smallest out of all of the other models in the stepwise regression, which explains why it
# was chosen. The summary of the fitsome linear model exhibited characteristics of a "good fit." In other words, the adjusted R^2
# value was 82.14%, which means that the independent variable explained nearly 82% or all of the variation of the dependent variable.

#From your chosen "best model," explain what variable(s) contribute to predicting Y and for how much variance they account.
#   Year, Corn, Fresh Cherries, Fresh Grapefruit, Fresh Grapes, Fresh Lemons/Limes, Raisins, and Fresh Tangerines/Mandarins.