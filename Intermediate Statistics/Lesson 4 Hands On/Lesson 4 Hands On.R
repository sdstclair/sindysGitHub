# Does the average price of avocados differ between Albany, Houston, and Seattle?
library("dplyr")
library("rcompanion")
library("car")

library(readr)
avocados <- read_csv("Education/Other/Entity Academy/Intermediate Statistics/Hands On/Lesson 4 Hands On/avocados.csv")
View(avocados)

# Your x or independent variable will be the cities, which has 3 levels:
# Albany, Houston, and Seattle. Your y, or dependent variable, will 
# be the average price of avocados. As with all ANOVAs, the IV will be categorical, and the DV will 
# be continuous.

#Filter the Data and Remove Missing Values
cities <- avocados %>% filter(region %in% c("Albany", "Houston", "Seattle"))
cities

#Make Price Numeric
cities$AveragePrice <- as.numeric(cities$AveragePrice)
cities$AveragePrice


#Test Assumptions
# Normality
plotNormalHistogram(cities$AveragePrice)
# This is not normally distributed, but positively skewed, so we will square root it, and if all else fails--cube it.

cities$AveragePriceSQRT <- sqrt(cities$AveragePrice)
plotNormalHistogram(cities$AveragePriceSQRT)
# This looks way better, but just in case it can even better, let's attempt to cube it.

cities$AveragePriceCUBE <- cities$AveragePrice ^ 3
plotNormalHistogram(cities$AveragePriceCUBE)
# This made it worse, so we will be keeping the SQRT version of this analysis.


#Testing Homogeneity of Variance
# Because the histogram was already determined to be not normally distributed, we will use Fligner's Test

# Bartlett's Test
bartlett.test(AveragePriceSQRT ~ region, data=cities)

# Fligner's Test
fligner.test(AveragePriceSQRT ~ region, data = cities)
# The p value is smaller than 0.05, making this significant. This means that this does not meet the assumption for homogeneity of variance.

# This data has a robust sample size higher than 15 or 20, so we can move forward in computing ANOVAs with unequal variance.


ANOVA <- lm(AveragePriceSQRT ~ region, data = cities)
Anova(ANOVA, Type="II", white.adjust=TRUE)

# Now we will move onto Post Hocs
pairwise.t.test(cities$AveragePriceSQRT, cities$region, p.adjust="bonferroni", pool.sd = FALSE)

#Group by Regions and Summarize by means of using Average Price
citiesMeans <- cities %>% group_by(region) %>% summarize(Mean = mean(AveragePrice))
citiesMeans

#These regions all had different average prices for avocados, with Albany containing the highest amount of 1.56, Seattle following second
#with 1.44, and Houston boasting the most inexpensive mean of the Average Price at 1.05.