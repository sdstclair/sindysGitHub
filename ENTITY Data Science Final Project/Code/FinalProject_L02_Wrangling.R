# Entity Final Project - Queen Bees
## Evaluation #4 - How have commodity production levels changed over time?
## Sara Slocum

library(readr)
library(ggplot2)
library(dplyr)
library(tidyr)

## Loading Datasets
USDA <- read.csv("C:/Users/saslo/Data_Science/DS_Portfolio/Queen_Bees/Datasets/1_FirstChoice/USDA_Production_Supply_And_Distribution.csv")
USDA_Hon <- read.csv("C:/Users/saslo/Documents/GitHub/FinalProjectEntity/Data/Appended_Data_USDAHoney.csv");

## Observing Data
unique(USDA_Hon$Commodity_Description);

## Dropping unneeded data
USDA_Hon <- subset(USDA_Hon, select = -c(X, Seen_On));
USDA2 <- subset(USDA, Year>2012);
USDA2 <- subset(USDA2, select = -c(X, Seen_On));

## Creating new columns for commodity categories
### 1 - Livestock & Dairy 
### 2 - Fruits & Vegetables
### 3 - Grains & Meal
### 4 - Nuts & Oil
### 5 - Misc 
### 6 - Honey

## Adding category column to USDA US + Honey Dataset
USDA_Hon$Category = "commodity"

USDA_Hon$Category[USDA_Hon$Commodity_Description=="Almonds, Shelled Basis"] <- 4
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Animal Numbers, Cattle"] <- 1
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Animal Numbers, Swine"] <- 1
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Apple Juice, Concentrated"] <- 2
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Apples, Fresh"] <- 2
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Asparagus, Fresh"] <- 2
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Avocados, Fresh"] <- 2
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Barley"] <- 3
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Citrus, Other, Fresh"] <- 2
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Coffee, Green"] <- 5
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Corn"] <- 2
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Cotton"] <- 5
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Dairy, Butter"] <- 1
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Dairy, Cheese"] <- 1
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Dairy, Dry Whole Milk Powder"] <- 1
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Dairy, Milk, Fluid"] <- 1
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Dairy, Milk, Nonfat Dry"] <- 1
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Filberts, Inshell Basis"] <- 4
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Fresh Apricots"] <- 2
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Fresh Cherries,(Sweet&Sour)"] <- 2
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Fresh Peaches & Nectarines"] <- 2
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Fresh Plums & Prunes"] <- 2
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Grapefruit, Fresh"] <- 2
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Grapes, Table, Fresh"] <- 2
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Kiwifruit"] <- 2
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Lemons, Fresh"] <- 2
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Macadamia, Inshell Basis"] <- 4
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Meal, Cottonseed"] <- 3
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Meal, Fish"] <- 3
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Meal, Peanut"] <- 3
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Meal, Rapeseed"] <- 3
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Meal, Soybean"] <- 3
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Meal, Sunflowerseed"] <- 3
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Meat, Beef and Veal"] <- 1
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Meat, Swine"] <- 1
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Oats"] <- 3
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Oil, Coconut"] <- 4
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Oil, Cottonseed"] <- 4
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Oil, Olive"] <- 4
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Oil, Palm"] <- 4
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Oil, Palm Kernel"] <- 4
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Oil, Peanut"] <- 4
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Oil, Rapeseed"] <- 4
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Oil, Soybean"] <- 4
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Oil, Sunflowerseed"] <- 4
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Oilseed, Cottonseed"] <- 4
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Oilseed, Peanut"] <- 4
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Oilseed, Rapeseed"] <- 4
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Oilseed, Soybean"] <- 4
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Oilseed, Sunflowerseed"] <- 4
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Orange Juice"] <- 2
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Oranges, Fresh"] <- 2
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Peaches, Canned"] <- 2
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Pears, Fresh"] <- 2
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Pecans, Inshell Basis"] <- 4
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Pistachios, Inshell Basis"] <- 4
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Potato Products, Frozen"] <- 2
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Poultry, Meat, Broiler"] <- 1
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Poultry, Meat, Turkey"] <- 1
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Prunes (Plums, Dried)"] <- 2
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Raisins"] <- 2
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Rice, Milled"] <- 3
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Rye"] <- 3
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Sorghum"] <- 3
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Strawberries, Fresh"] <- 2
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Strawberries, Frozen"] <- 2
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Sugar, Centrifugal"] <- 5
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Tangerines, Fresh"] <- 2
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Tobacco, Mfg., Cigarettes"] <- 5
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Tobacco, Unmfg., Total"] <- 5
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Walnuts, Inshell Basis"] <- 4
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Wheat"] <- 3
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Tangerines/Mandarins, Fresh"] <- 2
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Macadamia, Wet -Inshell Basis"] <- 4
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Grapes, Fresh"] <- 2
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Lemons/Limes, Fresh"] <- 2
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Grapes"] <- 2
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Cherries (Sweet&Sour), Fresh"] <- 2
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Grapes, Fresh Table"] <- 2
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Peaches & Nectarines, Fresh"] <- 2
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Meat, Chicken"] <- 1
USDA_Hon$Category[USDA_Hon$Commodity_Description=="Honey"] <- 6;

## Exporting usdaHoney dataframe
write.csv(USDA_Hon, "C:\\Users\\saslo\\Data_Science\\DS_Portfolio\\Queen_Bees\\Datasets\\1_FirstChoice\\usdaHoney.csv", row.names=FALSE);

## Observing usdaHon data with new coding
aggregate(USDA_Hon$Commodity_Description, by=list(USDA_Hon$Category), FUN=length);

cat1 <- subset(USDA_Hon, Category==1)
cat2 <- subset(USDA_Hon, Category==2)
cat3 <- subset(USDA_Hon, Category==3)
cat4 <- subset(USDA_Hon, Category==4)
cat5 <- subset(USDA_Hon, Category==5);

unique(cat1$Commodity_Description)
unique(cat2$Commodity_Description)
unique(cat3$Commodity_Description)
unique(cat4$Commodity_Description)
unique(cat5$Commodity_Description);


## Adding category column to USDA Global dataset
USDA2$Category = "commodity"

USDA2$Category[USDA2$Commodity_Description=="Almonds, Shelled Basis"] <- 4
USDA2$Category[USDA2$Commodity_Description=="Animal Numbers, Cattle"] <- 1
USDA2$Category[USDA2$Commodity_Description=="Animal Numbers, Swine"] <- 1
USDA2$Category[USDA2$Commodity_Description=="Apple Juice, Concentrated"] <- 2
USDA2$Category[USDA2$Commodity_Description=="Apples, Fresh"] <- 2
USDA2$Category[USDA2$Commodity_Description=="Asparagus, Fresh"] <- 2
USDA2$Category[USDA2$Commodity_Description=="Avocados, Fresh"] <- 2
USDA2$Category[USDA2$Commodity_Description=="Barley"] <- 3
USDA2$Category[USDA2$Commodity_Description=="Citrus, Other, Fresh"] <- 2
USDA2$Category[USDA2$Commodity_Description=="Coffee, Green"] <- 5
USDA2$Category[USDA2$Commodity_Description=="Corn"] <- 2
USDA2$Category[USDA2$Commodity_Description=="Cotton"] <- 5
USDA2$Category[USDA2$Commodity_Description=="Dairy, Butter"] <- 1
USDA2$Category[USDA2$Commodity_Description=="Dairy, Cheese"] <- 1
USDA2$Category[USDA2$Commodity_Description=="Dairy, Dry Whole Milk Powder"] <- 1
USDA2$Category[USDA2$Commodity_Description=="Dairy, Milk, Fluid"] <- 1
USDA2$Category[USDA2$Commodity_Description=="Dairy, Milk, Nonfat Dry"] <- 1
USDA2$Category[USDA2$Commodity_Description=="Filberts, Inshell Basis"] <- 4
USDA2$Category[USDA2$Commodity_Description=="Fresh Apricots"] <- 2
USDA2$Category[USDA2$Commodity_Description=="Fresh Cherries,(Sweet&Sour)"] <- 2
USDA2$Category[USDA2$Commodity_Description=="Fresh Peaches & Nectarines"] <- 2
USDA2$Category[USDA2$Commodity_Description=="Fresh Plums & Prunes"] <- 2
USDA2$Category[USDA2$Commodity_Description=="Grapefruit, Fresh"] <- 2
USDA2$Category[USDA2$Commodity_Description=="Grapes, Table, Fresh"] <- 2
USDA2$Category[USDA2$Commodity_Description=="Kiwifruit"] <- 2
USDA2$Category[USDA2$Commodity_Description=="Lemons, Fresh"] <- 2
USDA2$Category[USDA2$Commodity_Description=="Macadamia, Inshell Basis"] <- 4
USDA2$Category[USDA2$Commodity_Description=="Meal, Cottonseed"] <- 3
USDA2$Category[USDA2$Commodity_Description=="Meal, Fish"] <- 3
USDA2$Category[USDA2$Commodity_Description=="Meal, Peanut"] <- 3
USDA2$Category[USDA2$Commodity_Description=="Meal, Rapeseed"] <- 3
USDA2$Category[USDA2$Commodity_Description=="Meal, Soybean"] <- 3
USDA2$Category[USDA2$Commodity_Description=="Meal, Sunflowerseed"] <- 3
USDA2$Category[USDA2$Commodity_Description=="Meat, Beef and Veal"] <- 1
USDA2$Category[USDA2$Commodity_Description=="Meat, Swine"] <- 1
USDA2$Category[USDA2$Commodity_Description=="Oats"] <- 3
USDA2$Category[USDA2$Commodity_Description=="Oil, Coconut"] <- 4
USDA2$Category[USDA2$Commodity_Description=="Oil, Cottonseed"] <- 4
USDA2$Category[USDA2$Commodity_Description=="Oil, Olive"] <- 4
USDA2$Category[USDA2$Commodity_Description=="Oil, Palm"] <- 4
USDA2$Category[USDA2$Commodity_Description=="Oil, Palm Kernel"] <- 4
USDA2$Category[USDA2$Commodity_Description=="Oil, Peanut"] <- 4
USDA2$Category[USDA2$Commodity_Description=="Oil, Rapeseed"] <- 4
USDA2$Category[USDA2$Commodity_Description=="Oil, Soybean"] <- 4
USDA2$Category[USDA2$Commodity_Description=="Oil, Sunflowerseed"] <- 4
USDA2$Category[USDA2$Commodity_Description=="Oilseed, Cottonseed"] <- 4
USDA2$Category[USDA2$Commodity_Description=="Oilseed, Peanut"] <- 4
USDA2$Category[USDA2$Commodity_Description=="Oilseed, Rapeseed"] <- 4
USDA2$Category[USDA2$Commodity_Description=="Oilseed, Soybean"] <- 4
USDA2$Category[USDA2$Commodity_Description=="Oilseed, Sunflowerseed"] <- 4
USDA2$Category[USDA2$Commodity_Description=="Orange Juice"] <- 2
USDA2$Category[USDA2$Commodity_Description=="Oranges, Fresh"] <- 2
USDA2$Category[USDA2$Commodity_Description=="Peaches, Canned"] <- 2
USDA2$Category[USDA2$Commodity_Description=="Pears, Fresh"] <- 2
USDA2$Category[USDA2$Commodity_Description=="Pecans, Inshell Basis"] <- 4
USDA2$Category[USDA2$Commodity_Description=="Pistachios, Inshell Basis"] <- 4
USDA2$Category[USDA2$Commodity_Description=="Potato Products, Frozen"] <- 2
USDA2$Category[USDA2$Commodity_Description=="Poultry, Meat, Broiler"] <- 1
USDA2$Category[USDA2$Commodity_Description=="Poultry, Meat, Turkey"] <- 1
USDA2$Category[USDA2$Commodity_Description=="Prunes (Plums, Dried)"] <- 2
USDA2$Category[USDA2$Commodity_Description=="Raisins"] <- 2
USDA2$Category[USDA2$Commodity_Description=="Rice, Milled"] <- 3
USDA2$Category[USDA2$Commodity_Description=="Rye"] <- 3
USDA2$Category[USDA2$Commodity_Description=="Sorghum"] <- 3
USDA2$Category[USDA2$Commodity_Description=="Strawberries, Fresh"] <- 2
USDA2$Category[USDA2$Commodity_Description=="Strawberries, Frozen"] <- 2
USDA2$Category[USDA2$Commodity_Description=="Sugar, Centrifugal"] <- 5
USDA2$Category[USDA2$Commodity_Description=="Tangerines, Fresh"] <- 2
USDA2$Category[USDA2$Commodity_Description=="Tobacco, Mfg., Cigarettes"] <- 5
USDA2$Category[USDA2$Commodity_Description=="Tobacco, Unmfg., Total"] <- 5
USDA2$Category[USDA2$Commodity_Description=="Walnuts, Inshell Basis"] <- 4
USDA2$Category[USDA2$Commodity_Description=="Wheat"] <- 3
USDA2$Category[USDA2$Commodity_Description=="Tangerines/Mandarins, Fresh"] <- 2
USDA2$Category[USDA2$Commodity_Description=="Macadamia, Wet -Inshell Basis"] <- 4
USDA2$Category[USDA2$Commodity_Description=="Grapes, Fresh"] <- 2
USDA2$Category[USDA2$Commodity_Description=="Lemons/Limes, Fresh"] <- 2
USDA2$Category[USDA2$Commodity_Description=="Grapes"] <- 2
USDA2$Category[USDA2$Commodity_Description=="Cherries (Sweet&Sour), Fresh"] <- 2
USDA2$Category[USDA2$Commodity_Description=="Grapes, Fresh Table"] <- 2
USDA2$Category[USDA2$Commodity_Description=="Peaches & Nectarines, Fresh"] <- 2
USDA2$Category[USDA2$Commodity_Description=="Meat, Chicken"] <- 1;

## Looking at commodities that weren't coded (no US Data for production before 2013)
unique(USDA2$Category);

Other <- subset(USDA2, Category=="commodity")
unique(Other$Commodity_Description)

## Dropping these commodities as they cannot be compared against honey and we already have a wealth of data for the Nuts & Oils category
USDA3 <- subset(USDA2, Category!="commodity");
unique(USDA3$Category);

## Exporting usdaGlobal dataframe
write.csv(USDA3, "C:\\Users\\saslo\\Data_Science\\DS_Portfolio\\Queen_Bees\\Datasets\\1_FirstChoice\\usdaGlobal.csv", row.names=FALSE);




