# Load Packages
library(readr)
library(dplyr)
library(ggplot2)

# Load Data

# Reading honeyproduction CSV file

honeyproduction <- read_csv("../Data/honeyproduction_w_State.csv")
Honey_Production_DS <- honeyproduction

View(Honey_Production_DS)

# Honey Production from 1998-2001 over the years in US (In Metric Tons)

Honey_Production_DS %>% select(Year, Total_Production) %>%
  group_by(Year) %>%
  summarize(Total_Prod = sum(Total_Production/2000)) %>%
  ggplot(aes(Year, Total_Prod))+
  geom_line(lwd = 2, color = 'blue')+
  scale_x_continuous(breaks = 1998:2012)+
  scale_y_continuous(breaks = seq(from = 70000, to = 110000, by = 5000))+
  labs(y = 'Honey Production In Tons', x = 'Year') +
  ggtitle(' Trend of Honey Production')
  
# We can see here that production is on constant decline. There were big dips 
# between 2000 -2002 and around 2004 and continued till 2007.

# Visualizing the trend of Yield per Colony from year 1998 to 2012

Honey_Production_DS %>% select(Year, Production_per_Colony) %>%
  group_by(Year) %>%
  summarize(TotalProd_per_Colony = sum(Production_per_Colony)) %>%
  ggplot(aes(Year, TotalProd_per_Colony))+
  geom_line(lwd = 2, color = 'blue')+
  scale_x_continuous(breaks = 1998:2012)+
  labs(y = 'Yield per Colony', x = 'Year') +
  ggtitle('Trend of Honey Yield per Colony')

# The trend is showing there is a consistent decline in honey yield per 
# colony from year 2002 to 2007.

# Barplot for Honey Production

Honey_Production_DS %>% select(State_Name, Total_Production) %>%
  group_by(State_Name) %>%
  summarize(Total_Prod = sum(Total_Production/2000)) %>%
  arrange(desc(Total_Prod)) %>% 
  ggplot(aes(reorder(State_Name, -Total_Prod), Total_Prod, fill = State_Name))+
  geom_bar(stat = 'identity')+
  scale_y_continuous(breaks = seq(from = 0, to = 250000, by = 25000))+
  labs(y = 'Honey Production In Tons', x = '')+
  ggtitle('Honey Production from 1998- 2012')


# As we can see North Dakota and California,South Dakota, Florida, are the 
# top honey producing states over the years.
# Maryland, Oklohoma and South Carolina producing the least.

# As we saw there is a decline in Production over the years, let's 
# what states showed more decline and which one less.
# State Wise Production Decline Trend.


# Creating a table to find out maximum and minimun production over the years


# aggregate
Max_Prod_State <- aggregate(Honey_Production_DS$Total_Production, by = list(Honey_Production_DS$State_Name), max)
Min_Prod_State <- aggregate(Honey_Production_DS$Total_Production, by = list(Honey_Production_DS$State_Name), min)

View(Max_Prod_State)
View(Min_Prod_State)

# Merging the two tables

State_Prod <- cbind(Max_Prod_State, Min = Min_Prod_State$x) 
State_Prod1 <- rename(State_Prod, Max = x)

# Calculating the percentage change in Honey Production

State_Prod1$Change_Per <- NA
State_Prod1$Change_Per <- ((State_Prod1$Max - State_Prod1$Min)/ State_Prod1$Max)*100
newdata <- State_Prod1[order(-State_Prod1$Change_Per),] 

#write.csv(newdata, "Desktop/Final Project/Data/StateProdDecline.csv")
# Creating a Bar graph to visualize the State wise decline trend.

newdata %>% 
  ggplot(aes(reorder(Group.1, -Change_Per), Change_Per, fill = Group.1)) +
  geom_bar(stat = 'identity') +
  labs(y = 'Percentage Decline', x = 'State')+
  ggtitle('Sate Wise Honey Production Decline Trend')

# We can see Missouri, New Mexico, Maine have highest rate of decline in honey production 
# while Michigan, South Carolina and Oregon have the least decline.


###---
#Scatter Plot to see Number of Colonies vs Yield perColony across all states and Years
ggplot(Honey_Production_DS, aes(x= Production_per_Colony, y= Num_of_Colony)) + geom_point() + geom_smooth(method = lm) 

###---
