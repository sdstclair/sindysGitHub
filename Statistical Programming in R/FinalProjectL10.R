head(Cigarette)
Cigarette_df <- data.frame(Cigarette)

#1. Create a boxplot of the average number of packs per capita by state. Which states have the highest number of packs? Which have the lowest?
ggplot(Cigarette, aes(x = factor(state), y = packpc)) + geom_boxplot() + scale_y_log10()

#A: Kentucky and New Hampshire are two states with the highest number of packs of cigarettes. California, New Mexico, and Utah have the lowest number of packs of cigarettes.

#2. Find the median over all the states of the number of packs per capita for each year. Plot this median value for the years from 1985 to 1995. What can you say about cigarette usage in these years?

median(Cigarette$packpc)

ggplot(Cigarette, aes(x = factor(year), y = packpc)) + geom_boxplot() + scale_y_log10()

#A: The median for all the states of the number of packs per capita for each year is 105.9096. According to the boxplot, the average number of cigarette packs used decreased steadily over the decade.

#3. Create a scatter plot of price per pack vs number of packs per capita for all states and years.
cg <- ggplot(Cigarette, aes(x = packpc, y = avgprs))
cg + geom_point() + ggtitle("Price per Pack of Cigarettes vs Packs per Capita for All States and Years") + xlab("Packs Per Capita For All States and Years") + ylab("Average Price per Pack of Cigarettes") + geom_smooth(method = lm, color = "goldenrod2")

#4. Are the price and the per capita packs positively correlated, negatively correlated, or uncorrelated? Explain why your answer would be expected.
#A: The price and the per capita packs are negatively correlated. This would be expected because the more popular cigarettes became, the cheaper the average price for cigarettes.

#5. Change your scatter plot to show the points for each year in a different color. Does the relationship between the two variables change over time?
cg + geom_point(aes(x = packpc, y = avgprs, color = year)) + xlab("Packs Per Capita For All States and Years") + ylab("Average Price per Pack of Cigarettes") + geom_smooth(method = lm, color = "goldenrod2")

#A: Yes, the more sales of packs of cigarettes that are being made over the decade, the lower the prices drop for the packs of cigarettes purchased. As one continues along the x-axis, the colors of the points grow darker, indicating an increase of years within the decade.

# 6. Do a linear regression for these two variables. How much variability does the line explain?
lin_reg <- lm(packpc ~ avgprs, Cigarette)
print(lin_reg)

summary(lin_reg)
#A: The linear regression is y = -0.4088x + 167.8774. The Adjusted R-squared is 0.3415, but when multiplied by 100% it entails that the line approximately explains 34.15% of the variability of the data.

#7. The plot above does not adjust for inflation. You can adjust the price of a pack of cigarettes for inflation by dividing the avgprs variable by the cpi variable. Create an adjusted price for each row, then re-do your scatter plot and linear regression using this adjusted price.

x <- Cigarette$avgprs
y <- Cigarette$cpi

print(x / y)
adj.Price_inflation <- (x / y)

data.frame(adj.Price_inflation)

cg.adj <- ggplot(Cigarette, aes(x = packpc, y = adj.Price_inflation))
cg.adj + geom_point(aes(x = packpc, y = adj.Price_inflation, color = year)) + xlab("Packs per Capita for all States and Years") + ylab("Adjusted Price of Inflation per Pack of Cigarettes") + geom_smooth(method = lm, color = "goldenrod2")

lin_reg2 <- lm(packpc ~ adj.Price_inflation, Cigarette)
print(lin_reg2)

summary(lin_reg2)
#The linear regression is y = -0.9164x + 211.7682. The Adjusted R-squared is 0.3757, but when multiplied by 100% it entails the line approximately explains 37.57% of the variability of the data.

#8. Create a data frame with just the rows from 1985. Create a second data frame with just the rows from 1995. Then, from each of these data frames, get a vector of the number of packs per capita. Use a paired t-test to see if the number of packs per capita in 1995 was significantly different than the number of packs per capita in 1985.
Cig1985_df <- Cigarette %>% filter(year == 1985)
Cig1985_df

Cig1985_df$packpc

Cig1995_df <- Cigarette %>% filter(year ==1995)
Cig1995_df

Cig1995_df$packpc

t_dep <- t.test(Cig1985_df$packpc, Cig1995_df$packpc, paired = TRUE)
t_dep

#The 2 populations are not equal to each other. I reject the null hypothesis for the p-value is sufficiently small, so the two population means are not equal. Because the p value is less than 0.05, the number of packs per capita in 1995 was significantly different than the number of packs per capita in 1985.