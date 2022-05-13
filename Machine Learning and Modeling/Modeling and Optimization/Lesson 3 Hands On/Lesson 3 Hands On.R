library("ggplot2")

quadPlot1 <- ggplot(nonlinear, aes(x = X1, y = Y1)) + geom_point() + stat_smooth(method = "lm", formula = y ~x + I(x^2), size =1)
quadPlot1

X1Q <- nonlinear$X1^2
X1Q

quadModel <- lm(nonlinear$Y1~nonlinear$X1+X1Q)
summary(quadModel)

# This is appears to be quadratic. 
# Because the p value is less than 2.2e-16, it is significant.
# This means that X1 is a significant quadratic predictor of Y1.

quadPlot2 <- ggplot(nonlinear, aes(x = X2, y = Y2)) + geom_point() + stat_smooth(method = "lm", formula = y ~x + I(x^2), size = 1)
quadPlot2

exMod <- lm(log(nonlinear$Y2)~nonlinear$X2)
summary(exMod)
# This appears to be exponential.
# According to the F-statistic and associated p value, one can
# see that this model is significant. In other words,
# exponential growth is being exhibited here by 99.5%.


