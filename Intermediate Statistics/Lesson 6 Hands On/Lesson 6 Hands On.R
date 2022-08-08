# You will determine whether suicide rates (suicides/100k pop) has changed over
# the years (year), and see if the generation has any influence. To do so, you
# will be using a mixed measures ANOVA, since there is both a repeated time
# element and a between subjects element. Provide a one-sentence conclusion at
# the bottom of your program file about the analysis you performed.

library("rcompanion")
library("car")
library("IDPmisc")
library("dplyr")

library(readr)
suicide <- read_csv("Education/Other/Entity Academy/Intermediate Statistics/Hands On/Lesson 6 Hands On/suicide.csv")
View(suicide)

# Number of suicides by generation by country, with country being the repeated factor

## Check Assumptions

### Normality
plotNormalHistogram(suicide$`suicides/100k pop`)

suicide$suicides100kpopSQRT <- sqrt(suicide$`suicides/100k pop`)
plotNormalHistogram(suicide$suicides100kpopSQRT)

suicide$suicides100kpopLOG <- log(suicide$`suicides/100k pop`)

suicide1 <- NaRV.omit(suicide)

plotNormalHistogram(suicide1$suicides100kpopLOG)

#### Use the log

##Homogeneity of Variance
leveneTest(suicide1$suicides100kpopLOG ~ suicide1$generation, data=suicide1)

# This is signficant.

# Analysis

RManova1 <- aov(suicide1$suicides100kpopLOG ~ (suicide1$generation * suicide1$year) + Error(suicide1$country / (suicide1$year)), suicide1)
summary(RManova1)

### Looks like there is a generational effect to suicide, and an interaction to how the year has affected the generation

## Post Hocs
pairwise.t.test(suicide1$suicides100kpopLOG, suicide1$generation, p.adjust="bonferroni")

### Looks like there is a difference in suicide rates among ALL the generations

## Determine Means and Draw Conclusions

suicideMeans <- suicide1 %>% group_by(generation, year) %>% summarize(Mean=mean(suicide1$`suicides/100k pop`))

# Generation Z is the least likely to commit suicide.  They were born mid 90's to early 2000s. The GI generation is the most likely. They were born 1901-1924. You can see that these differ over time as well - looks like the GI generation as do millenials just keeps rising in terms of suicide rates, while others like gen z and gen x are staying steady. 