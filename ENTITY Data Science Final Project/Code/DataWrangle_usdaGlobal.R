# Wrangling And Writing a New CSV file for USDA Production Data for ARIMA

# Load Packages
library(readr)
library(dplyr)

# Load Data

# Reading USDA_Production_Supply_And_Distribution File

USDA_Production_Supply_And_Distribution <- read_csv("Desktop/Final Project/USDA_Production_Supply_And_Distribution.csv")

# Filtering USDA data set for the following:
# Year >= 1998 and <= 2021
# Attribute_Description == 'Production'
# Country_Code == 'US'

Filtered_USDA_DataSet <- filter(USDA_Production_Supply_And_Distribution, Year >= 1998 & Year <= 2021 & Attribute_Description == 'Production' & Country_Code == 'US')
View(Filtered_USDA_DataSet)


unique(Filtered_USDA_DataSet$Commodity_Description)

# As previously caluclated, following are the highle correlated Commodities with Honey.
# 
# Apples
# Barley
# Almonds
# Corn
# Milk
# Grapefruit
# Meat swine
# Oats
# Rapeseed oil
# Poultry meat turkey
# Walnuts in shell
# Coffee green
# Soybean oil
# Rye

# Filter for only highly correlated commodities and non missing - (remove poultry meat turkey as it has missing values)

Filtered_USDA_DS_HC <- filter(Filtered_USDA_DataSet, Commodity_Description == 'Apples, Fresh' | 
                                  Commodity_Description == 'Barley' |
                                  Commodity_Description == 'Almonds, Shelled Basis' |
                                  Commodity_Description == 'Corn' |
                                  Commodity_Description == 'Dairy, Milk, Fluid' |
                                  Commodity_Description == 'Grapefruit, Fresh' |
                                  Commodity_Description == 'Meat, Swine' |
                                  Commodity_Description == 'Oats' |
                                  Commodity_Description == 'Oil, Rapeseed' |
                                  Commodity_Description == 'Walnuts, Inshell Basis' |
                                  Commodity_Description == 'Coffee, Green' |
                                  Commodity_Description == 'Oil, Soybean' |
                                  Commodity_Description == 'Rye')


unique(Filtered_USDA_DS_HC$Unit_Description)

USDA_Commodities_MT <- Filtered_USDA_DS_HC

# Data Wrangling

USDA_Commodities_MT <- na.omit(USDA_Commodities_MT)

# Convert the 1000 MT to Tons

USDA_Commodities_MT$Value[USDA_Commodities_MT$Unit_Description == '(1000 MT)'] <- USDA_Commodities_MT$Value * 1000
USDA_Commodities_MT$Unit_Description[USDA_Commodities_MT$Unit_Description == '(1000 MT)'] <- '(MT)'

# Convert the (1000 60 KG BAGS) to Tons

USDA_Commodities_MT$Value[USDA_Commodities_MT$Unit_Description == '(1000 60 KG BAGS)'] <- USDA_Commodities_MT$Value * 1000 * .001 * 60
USDA_Commodities_MT$Unit_Description[USDA_Commodities_MT$Unit_Description == '(1000 60 KG BAGS)'] <- '(MT)'

# Convert the (1000 MT CWE) to Tons

USDA_Commodities_MT$Value[USDA_Commodities_MT$Unit_Description == '(1000 MT CWE)'] <- USDA_Commodities_MT$Value * 1000
USDA_Commodities_MT$Unit_Description[USDA_Commodities_MT$Unit_Description == '(1000 MT CWE)'] <- '(MT)'

View(USDA_Commodities_MT)
unique(USDA_Commodities_MT$Unit_Description)

# Picking the maximum Value for each Commodity and Year pair since there seems to be many duplicate entries.

FinalGlobalDS = USDA_Commodities_MT %>% group_by(Commodity_Description, Year) %>% 
  summarise(Value = max(Value), Country_Code = "US", Country_Name = "United States",
            Attribute_Description = "Production", Unit_Description = "(MT)",
            .groups = 'drop')

View(FinalGlobalDS)

# Writing the CSV file

write_csv(FinalGlobalDS, "../Data/usdaGlobal_HighCorr_Honey.csv")

