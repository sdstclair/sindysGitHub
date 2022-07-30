# Wrangling and Analysis for Category 5 - Miscellanious

# Load Packages
library(readr)
library(dplyr)
library(ggplot2)
library(stringr)                               

# Read data 
usdaHoney2 <- read_csv("../Data/usdaHoney2.csv")


View(usdaHoney2)
# Pick only the Categories Needed for Analysis
# Category 5 - Miscellanious.
# Category 6 - Honey

USDA_Commodities <- filter(usdaHoney2, Category == 5 | Category == 6)

View(USDA_Commodities)

# View Commodities and Unit of Measurements

unique(USDA_Commodities$Unit_Description)
unique(USDA_Commodities$Commodity_Description)

# Creating/ Renaming the dataset to work

USDA_Commodities_MT <- USDA_Commodities 

## Data Wrangling

# Convert the 1000 MT to Tons

USDA_Commodities_MT$Value[USDA_Commodities_MT$Unit_Description == '(1000 MT)'] <- USDA_Commodities_MT$Value * 1000
USDA_Commodities_MT$Unit_Description[USDA_Commodities_MT$Unit_Description == '(1000 MT)'] <- '(MT)'

View(USDA_Commodities_MT)

# Remove the Commodity_Description having 'Sugar, Centrifugal' and 'Tobacco, Mfg., Cigarettes' since it's not a crop; it's just a byproduct.

# USDA_Commodities_DS <- USDA_Commodities_MT[!(str_detect(USDA_Commodities_MT$Commodity_Description, 'Sugar, Centrifugal')), ] 

USDA_Commodities_DS <- USDA_Commodities_MT[!(str_detect(USDA_Commodities_MT$Commodity_Description, 'Tobacco, Mfg., Cigarettes')), ] 
USDA_Commodities_DS <- USDA_Commodities_DS[!(str_detect(USDA_Commodities_DS$Commodity_Description, 'Tobacco, Unmfg., Total')), ] 



unique(USDA_Commodities_DS$Commodity_Description)

# Drop null values

USDA_Commodities_DS <- na.omit(USDA_Commodities_DS)

# Converting different Units of Measurements in MT
unique(USDA_Commodities_DS$Unit_Description)

# 1 kg = .001 MT
USDA_Commodities_DS$Value[USDA_Commodities_DS$Unit_Description == '(1000 60 KG BAGS)'] <- (USDA_Commodities_DS$Value * 1000 * .001 * 60)

USDA_Commodities_DS$Unit_Description[USDA_Commodities_DS$Unit_Description == '(1000 60 KG BAGS)'] <- '(MT)'


# 1 LBS = 0.00045 MT
USDA_Commodities_DS$Value[USDA_Commodities_DS$Unit_Description == '1000 480 lb. Bales'] <- (USDA_Commodities_DS$Value * 1000 * .00045 * 480)

USDA_Commodities_DS$Unit_Description[USDA_Commodities_DS$Unit_Description == '1000 480 lb. Bales'] <- '(MT)'

View(USDA_Commodities_DS)

# Max_Prod_AllComm <- aggregate(USDA_Commodities_MT$Value, by = list(USDA_Commodities_MT$Year, USDA_Commodities_MT$Commodity_Description), max)

# Picking the maximum Value for each commodity and Year pair since there seems to be many duplicate entries.

Grouped_Honey_DS5 = USDA_Commodities_DS %>% group_by(Commodity_Description, Year) %>% 
  summarise(Value = max(Value), Country_Code = "US", Country_Name = "United States",
            Attribute_Description = "Production", Unit_Description = "(MT)",
            .groups = 'drop')

View(Grouped_Honey_DS5)
write.csv(Grouped_Honey_DS5,"Desktop/Final Project/Data/Grouped_Honey_DS5.csv")


#-------TRANSPOSE--Putting the Commodity as Columns and their Values corresponding to the year.


testTranspose <- Grouped_Honey_DS5

colnames(testTranspose)

#Delete the non numeric columns

FinalDSY <- testTranspose[, c('Commodity_Description', 'Year', 'Value')]
View(FinalDSY)
# Picking the Year
FinalDSYear <- testTranspose[, c('Year')]

# Picking only the years from 1998-2012
FinalDSYear98to12 <- FinalDSYear[1:15, ]

# Making a subset of just Commodity and Value
FinalDSNY <- testTranspose[, c('Commodity_Description', 'Value')]

# Picking Coffee, Green
DSCoffee <- subset(FinalDSNY, Commodity_Description == "Coffee, Green")

# Changing the colname to CoffeeValue

colnames(DSCoffee)[2] <- 'CoffeeValue'

# Creating a new column 
FinalDSYear98to12$CoffeeValue <- NA

DSCoffee <- as.data.frame(DSCoffee)

# Assigning values 
FinalDSYear98to12$CoffeeValue <- DSCoffee$CoffeeValue

# Honey
DSHoney <- subset(FinalDSNY, Commodity_Description == "Honey")

# Changing the colname to HoneyValue

colnames(DSHoney)[2] <- 'HoneyValue'

# Creating a new column 
FinalDSYear98to12$HoneyValue <- NA

DSHoney <- as.data.frame(DSHoney)

# Assigning values 
FinalDSYear98to12$HoneyValue <- DSHoney$HoneyValue

#Cotton
DSCotton <- subset(FinalDSNY, Commodity_Description == "Cotton")

# Changing the colname to CottonValue

colnames(DSCotton)[2] <- 'CottonValue'

# Creating a new column 
FinalDSYear98to12$CottonValue <- NA

DSCotton <- as.data.frame(DSCotton)

# Assigning values 
FinalDSYear98to12$CottonValue <- DSCotton$CottonValue

#Sugar, Centrifugal
DSSugar <- subset(FinalDSNY, Commodity_Description == "Sugar, Centrifugal")

# Changing the colname to RiceValue

colnames(DSSugar)[2] <- 'SugarValue'

# Creating a new column 
FinalDSYear98to12$SugarValue <- NA

DSSugar <- as.data.frame(DSSugar)

# Assigning values 
FinalDSYear98to12$SugarValue <- DSSugar$SugarValue

View(FinalDSYear98to12)

# Writing csv
write_csv(FinalDSYear98to12, "../Data/Category5Final98to12.csv")

# Correlation Matrix

corMat <- cor(FinalDSYear98to12)
round(corMat, 2)
 

  
  
  
  
  