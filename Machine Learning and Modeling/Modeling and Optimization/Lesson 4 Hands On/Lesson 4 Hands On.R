#PART 1

library(readr)
IQ <- read_csv("Education/Other/Entity Academy/Machine Learning and Modeling/IQ.csv")
View(IQ)

#BACKWARD SELECTION
FitAll1 <- lm(IQ ~ ., data = IQ)
FitAll1

summary(FitAll1)

step(FitAll1, direction = 'backward')

#Create another model for only selected variables and compare their results
fitsome <- lm(IQ ~ Test1 + Test2 + Test4, data = IQ)
fitsome

summary(fitsome)

#Which model is the best? Why?
bestmodel <- lm(IQ ~ Test1 + Test2 + Test4, data = IQ)
bestmodel

summary(bestmodel)
#From the best model, what is the adjusted R2 value and what does it mean?
# The adjusted R^2 is equal to 0.2158, which ultimately judges whether the data in the regression
# equation is a good fit. The higher the adjusted R^2, the better the regression equation
# as it implies that the independent variable is chosen to determine the dependent variable.

#From the best model, how does each variable influence IQ?
# In this case, 21.58% implies that the independent variables explains only that amount of the
# variation in the dependent variable.

#PART 2

library(readr)
stepwiseRegression <- read_csv("Education/Other/Entity Academy/Machine Learning and Modeling/stepwiseRegression.csv")
View(stepwiseRegression)

#Backward Selection
FitAll <- lm(Y ~ ., data = stepwiseRegression)
FitAll
summary(FitAll)

step(FitAll, direction = 'backward', scope = formula(FitAll))

#Forward Selection
fitstart <- lm(Y ~ 1, data = stepwiseRegression)
summary(fitstart)

step(fitstart, direction = 'forward', scope = (formula(FitAll)))

#StepWise
step(fitstart, direction = 'both', scope = formula(FitAll))

fitsome <- lm(formula = Y ~ X2 + X4 + X6 + X10 + X11 + X12, data = stepwiseRegression)
summary(fitsome)

#Which model was the best for each type of method?
# fitsome was the best for this type of method, or lm(formula = Y ~ X2 + X4, X6 + X10 + X11 + X12, data = stepwiseRegression)

#How do the final models from each method compare to each other?
# The AIC of fitsome was 213.38, the smallest out of all of the other models in the stepwise regression, which explains why it
# was chosen. The summary of the fitsome linear model exhibited characteristics of a "good fit." In other words, the adjusted R^2
# value was 99.98%, which means that the independent variable explained nearly 100% or all of the variation of the dependent variable.

#From your chosen "best model," explain what variable(s) contribute to predicting Y and for how much variance they account.
#   X2, X4, X6, X10, X11, and X12 were the variables that contributed to predicting Y. (incomplete)