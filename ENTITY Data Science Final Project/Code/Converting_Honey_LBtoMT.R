library(dplyr)

# Recoding Honey lbs to mt
## The conversion is 0.00045359 mt to 1 lb

#Separating data for conversion
honey <- filter(usdaHoney, Category == 6);
honey

#Converting & recoding columns
newhon <- mutate(honey, Value = Value * 0.00045359)
newhon2 <- mutate(newhon, Unit_Description = "MT")
newhon2

#Dropping previous data & appending to usdaHoney df
usdaHoney <- subset(USDA_Hon, Category != 6);
usdaHoney <- subset(usdaHoney, select = -c(NewVal));

usdaHoney <- rbind(usdaHoney, newhon2);

#Dropping previous data & appending to usdaGlobal df
usdaGlobal <- subset(USDA3, Category != 6);

usdaGlobal <- rbind(usdaGlobal, newhon2);

#Exporting new df
write.csv(usdaHoney, "C:\\Users\\saslo\\Data_Science\\DS_Portfolio\\Queen_Bees\\Datasets\\Wrangled_Data\\usdaHoney2.csv");

write.csv(usdaGlobal, "C:\\Users\\saslo\\Data_Science\\DS_Portfolio\\Queen_Bees\\Datasets\\Wrangled_Data\\usdaGlobal2.csv");
