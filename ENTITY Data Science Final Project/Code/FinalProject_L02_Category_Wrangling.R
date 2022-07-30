## Group Analysis - Category Wrangling - Category 4 Nuts & Oils
### Sara Slocum

library(dplyr)
library(tidyr)

## Loading in dataset
usdaHoney <- read.csv("C:/Users/saslo/Documents/GitHub/FinalProjectEntity/Data/usdaHoney2.csv")

## Filtering out only Nut & Oil commodities
Nuts_Oil <- subset(usdaHoney, Category==4);

## Looking at different measurement types
unique(Nuts_Oil$Unit_Description);

## Separating (1000 MT) to convert to (MT)
conversions <- filter(Nuts_Oil, Unit_Description == "(1000 MT)");

## Converting & Recoding columns
newMT <- mutate(conversions, Value = Value * 1000)
newMT2 <- mutate(newMT, Unit_Description = "(MT)");

## Dropping previous data and appending converted data
Nuts_Oil <- subset(Nuts_Oil, Unit_Description != "(1000 MT)");
unique(Nuts_Oil$Unit_Description);

Nuts_Oil <- rbind(Nuts_Oil, newMT2);
unique(Nuts_Oil$Unit_Description);

## Observing list of commodities
unique(Nuts_Oil$Commodity_Description)
#[1] "Almonds, Shelled Basis"        "Filberts, Inshell Basis"       "Macadamia, Inshell Basis"      "Pecans, Inshell Basis"         "Pistachios, Inshell Basis"    
#[6] "Walnuts, Inshell Basis"        "Macadamia, Wet -Inshell Basis" "Oil, Coconut"                  "Oil, Cottonseed"               "Oil, Olive"                   
#[11] "Oil, Palm"                     "Oil, Palm Kernel"              "Oil, Peanut"                   "Oil, Rapeseed"                 "Oil, Soybean"                 
#[16] "Oil, Sunflowerseed"            "Oilseed, Cottonseed"           "Oilseed, Peanut"               "Oilseed, Rapeseed"             "Oilseed, Soybean"             
#[21] "Oilseed, Sunflowerseed" 


## Removing Redundant Entries - Keeping highest Value reported per year
# -------------------------------------------------------------------------------------------

## Looking at "Almonds, Shelled Basis"

Almonds98 <- subset(Nuts_Oil, Commodity_Description=="Almonds, Shelled Basis" & Year == 1998)
### Almonds 98 is fine

Almonds99 <- subset(Nuts_Oil, Commodity_Description=="Almonds, Shelled Basis" & Year == 1999)
### Almonds 99 has redundancy, dropping the extra values
Almonds99 <- subset(Almonds99, X==6883);

Almonds00 <- subset(Nuts_Oil, Commodity_Description=="Almonds, Shelled Basis" & Year == 2000)
### Almonds 00 has redundancy, dropping the extra values
Almonds00 <- subset(Almonds00, X==6884);

Almonds01 <- subset(Nuts_Oil, Commodity_Description=="Almonds, Shelled Basis" & Year == 2001)
### Almonds 01 has redundancy, dropping the extra values
Almonds01 <- subset(Almonds01, X==6228);

Almonds02 <- subset(Nuts_Oil, Commodity_Description=="Almonds, Shelled Basis" & Year == 2002)
### Almonds 02 has redundancy, dropping the extra values
Almonds02 <- subset(Almonds02, X==5);

Almonds03 <- subset(Nuts_Oil, Commodity_Description=="Almonds, Shelled Basis" & Year == 2003)
### Almonds 03 has redundancy, dropping the extra values
Almonds03 <- subset(Almonds03, X==5347);

Almonds04 <- subset(Nuts_Oil, Commodity_Description=="Almonds, Shelled Basis" & Year == 2004)
### Almonds 04 has redundancy, dropping the extra values
Almonds04 <- subset(Almonds04, X==7);

Almonds05 <- subset(Nuts_Oil, Commodity_Description=="Almonds, Shelled Basis" & Year == 2005)
### Almonds 05 has redundancy, dropping the extra values
Almonds05 <- subset(Almonds05, X==3214);

Almonds06 <- subset(Nuts_Oil, Commodity_Description=="Almonds, Shelled Basis" & Year == 2006)
### Almonds 06 has redundancy, dropping the extra values
Almonds06 <- subset(Almonds06, X==6890);

Almonds07 <- subset(Nuts_Oil, Commodity_Description=="Almonds, Shelled Basis" & Year == 2007)
### Almonds 07 has redundancy, dropping the extra values
Almonds07 <- subset(Almonds07, X==6891);

Almonds08 <- subset(Nuts_Oil, Commodity_Description=="Almonds, Shelled Basis" & Year == 2008)
### Almonds 08 has redundancy, dropping the extra values
Almonds08 <- subset(Almonds08, X==6235);

Almonds09 <- subset(Nuts_Oil, Commodity_Description=="Almonds, Shelled Basis" & Year == 2009)
### Almonds 09 has redundancy, dropping the extra values
Almonds09 <- subset(Almonds09, X==4494);

Almonds10 <- subset(Nuts_Oil, Commodity_Description=="Almonds, Shelled Basis" & Year == 2010)
### Almonds 10 has redundancy, dropping the extra values
Almonds10 <- subset(Almonds10, X==4495);

Almonds11 <- subset(Nuts_Oil, Commodity_Description=="Almonds, Shelled Basis" & Year == 2011)
### Almonds 11 has redundancy, dropping the extra values
Almonds11 <- subset(Almonds11, X==6238);

Almonds12 <- subset(Nuts_Oil, Commodity_Description=="Almonds, Shelled Basis" & Year == 2012);
### Almonds 12 has redundancy, dropping the extra values
Almonds12 <- subset(Almonds12, X==6239);

## Binding & Exporting Almond data
Almonds <- rbind(Almonds98, Almonds99, Almonds00, Almonds01, Almonds02, Almonds03, Almonds04, Almonds05, Almonds06, Almonds07, Almonds08, Almonds09, Almonds10, Almonds11, Almonds12);
write.csv(Almonds, "C:\\Users\\saslo\\Data_Science\\DS_Portfolio\\Queen_Bees\\Datasets\\Wrangled_Data\\usdaAlmonds.csv");


## Looking at "Filberts, Inshell Basis"

Filberts98 <- subset(Nuts_Oil, Commodity_Description=="Filberts, Inshell Basis" & Year == 1998)
### Filberts 98 has redundancy, dropping the extra values
Filberts98 <- subset(Filberts98, X==149);

Filberts99 <- subset(Nuts_Oil, Commodity_Description=="Filberts, Inshell Basis" & Year == 1999)
### Filberts 99 has redundancy, dropping the extra values
Filberts99 <- subset(Filberts99, X==150);

Filberts00 <- subset(Nuts_Oil, Commodity_Description=="Filberts, Inshell Basis" & Year == 2000)
### Filberts 00 has redundancy, dropping the extra values
Filberts00 <- subset(Filberts00, X==151);

Filberts01 <- subset(Nuts_Oil, Commodity_Description=="Filberts, Inshell Basis" & Year == 2001)
### Filberts 01 has redundancy, dropping the extra values
Filberts01 <- subset(Filberts01, X==152);

Filberts02 <- subset(Nuts_Oil, Commodity_Description=="Filberts, Inshell Basis" & Year == 2002)
### Filberts 02 has redundancy, dropping the extra values
Filberts02 <- subset(Filberts02, X==6250);

Filberts03 <- subset(Nuts_Oil, Commodity_Description=="Filberts, Inshell Basis" & Year == 2003)
### Filberts 03 has redundancy, dropping the extra values
Filberts03 <- subset(Filberts03, X==6251);

Filberts04 <- subset(Nuts_Oil, Commodity_Description=="Filberts, Inshell Basis" & Year == 2004)
### Filberts 04 has redundancy, dropping the extra values
Filberts04 <- subset(Filberts04, X==155);

Filberts05 <- subset(Nuts_Oil, Commodity_Description=="Filberts, Inshell Basis" & Year == 2005)
### Filberts 05 has redundancy, dropping the extra values
Filberts05 <- subset(Filberts05, X==156);

Filberts06 <- subset(Nuts_Oil, Commodity_Description=="Filberts, Inshell Basis" & Year == 2006)
### Filberts 06 has redundancy, dropping the extra values
Filberts06 <- subset(Filberts06, X==2484);

Filberts07 <- subset(Nuts_Oil, Commodity_Description=="Filberts, Inshell Basis" & Year == 2007)
### Filberts 07 has redundancy, dropping the extra values
Filberts07 <- subset(Filberts07, X==6255);

Filberts08 <- subset(Nuts_Oil, Commodity_Description=="Filberts, Inshell Basis" & Year == 2008)
### Filberts 08 has redundancy, dropping the extra values
Filberts08 <- subset(Filberts08, X==2486);

Filberts09 <- subset(Nuts_Oil, Commodity_Description=="Filberts, Inshell Basis" & Year == 2009)
### Filberts 09 has redundancy, dropping the extra values
Filberts09 <- subset(Filberts09, X==4514);

Filberts10 <- subset(Nuts_Oil, Commodity_Description=="Filberts, Inshell Basis" & Year == 2010)
### Filberts 10 has redundancy, dropping the extra values
Filberts10 <- subset(Filberts10, X==6258);

Filberts11 <- subset(Nuts_Oil, Commodity_Description=="Filberts, Inshell Basis" & Year == 2011)
### Filberts 11 has redundancy, dropping the extra values
Filberts11 <- subset(Filberts11, X==5375);

Filberts12 <- subset(Nuts_Oil, Commodity_Description=="Filberts, Inshell Basis" & Year == 2012)
### Filberts 12 is fine

## Binding & Exporting Filberts Data
Filberts <- rbind(Filberts98, Filberts99, Filberts00, Filberts01, Filberts02, Filberts03, Filberts04, Filberts05, Filberts06, Filberts07, Filberts08, Filberts09, Filberts10, Filberts11, Filberts12);
write.csv(Filberts, "C:\\Users\\saslo\\Data_Science\\DS_Portfolio\\Queen_Bees\\Datasets\\Wrangled_Data\\usdaFilberts.csv");


## Looking at "Macadamia, Inshell Basis"

Macadamia98 <- subset(Nuts_Oil, Commodity_Description=="Macadamia, Inshell Basis" & Year == 1998)
### Macadamia 98 is fine

Macadamia99 <- subset(Nuts_Oil, Commodity_Description=="Macadamia, Inshell Basis" & Year == 1999)
### Macadamia 99 is fine

Macadamia00 <- subset(Nuts_Oil, Commodity_Description=="Macadamia, Inshell Basis" & Year == 2000)
### Macadamia 00 is fine

Macadamia01 <- subset(Nuts_Oil, Commodity_Description=="Macadamia, Inshell Basis" & Year == 2001)
### Macadamia 01 is fine

Macadamia02 <- subset(Nuts_Oil, Commodity_Description=="Macadamia, Inshell Basis" & Year == 2002)
### Macadamia 02 has redundancy, dropping the extra values
Macadamia02 <- subset(Macadamia02, X==226);

Macadamia03 <- subset(Nuts_Oil, Commodity_Description=="Macadamia, Inshell Basis" & Year == 2003)
### Macadamia 03 has redundancy, dropping the extra values
Macadamia03 <- subset(Macadamia03, X==227);

Macadamia04 <- subset(Nuts_Oil, Commodity_Description=="Macadamia, Inshell Basis" & Year == 2004)
### Macadamia 04 has redundancy, dropping the extra values
Macadamia04 <- subset(Macadamia04, X==228);

Macadamia05 <- subset(Nuts_Oil, Commodity_Description=="Macadamia, Inshell Basis" & Year == 2005)
### Macadamia 05 has redundancy, dropping the extra values
Macadamia05 <- subset(Macadamia05, X==229);

Macadamia06 <- subset(Nuts_Oil, Commodity_Description=="Macadamia, Inshell Basis" & Year == 2006)
### Macadamia 06 is fine

Macadamia07 <- subset(Nuts_Oil, Commodity_Description=="Macadamia, Inshell Basis" & Year == 2007)
### Macadamia 07 is fine

Macadamia08 <- subset(Nuts_Oil, Commodity_Description=="Macadamia, Inshell Basis" & Year == 2008)
### Macadamia 08 is null

Macadamia09 <- subset(Nuts_Oil, Commodity_Description=="Macadamia, Inshell Basis" & Year == 2009)
### Macadamia 09 is null

Macadamia10 <- subset(Nuts_Oil, Commodity_Description=="Macadamia, Inshell Basis" & Year == 2010)
### Macadamia 10 is null

Macadamia11 <- subset(Nuts_Oil, Commodity_Description=="Macadamia, Inshell Basis" & Year == 2011)
### Macadamia 11 is null

Macadamia12 <- subset(Nuts_Oil, Commodity_Description=="Macadamia, Inshell Basis" & Year == 2012)
### Macadamia 12 is null


## Looking at "Macadamia, Wet -Inshell Basis"
### Data is the same as "Macadamia, Inshell Basis" - Dropping duplicate value grouping

## Binding & Exporting Macadamia Data
Macadamia <- rbind(Macadamia98, Macadamia99, Macadamia00, Macadamia01, Macadamia02, Macadamia03, Macadamia04, Macadamia05, Macadamia06, Macadamia07)
write.csv(Macadamia, "C:\\Users\\saslo\\Data_Science\\DS_Portfolio\\Queen_Bees\\Datasets\\Wrangled_Data\\usdaMacadamia.csv");


## Looking at "Pecans, Inshell Basis"

Pecans98 <- subset(Nuts_Oil, Commodity_Description=="Pecans, Inshell Basis" & Year == 1998)
### Pecans 98 is fine

Pecans99 <- subset(Nuts_Oil, Commodity_Description=="Pecans, Inshell Basis" & Year == 1999)
### Pecans 99 is fine

Pecans00 <- subset(Nuts_Oil, Commodity_Description=="Pecans, Inshell Basis" & Year == 2000)
### Pecans 00 is fine

Pecans01 <- subset(Nuts_Oil, Commodity_Description=="Pecans, Inshell Basis" & Year == 2001)
### Pecans 01 is fine

Pecans02 <- subset(Nuts_Oil, Commodity_Description=="Pecans, Inshell Basis" & Year == 2002)
### Pecans 02 has redundancy, dropping the extra values
Pecans02 <- subset(Pecans02, X==473);

Pecans03 <- subset(Nuts_Oil, Commodity_Description=="Pecans, Inshell Basis" & Year == 2003)
### Pecans 03 has redundancy, dropping the extra values
Pecans03 <- subset(Pecans03, X==474);

Pecans04 <- subset(Nuts_Oil, Commodity_Description=="Pecans, Inshell Basis" & Year == 2004)
### Pecans 04 has redundancy, dropping the extra values
Pecans04 <- subset(Pecans04, X==475);

Pecans05 <- subset(Nuts_Oil, Commodity_Description=="Pecans, Inshell Basis" & Year == 2005)
### Pecans 05 has redundancy, dropping the extra values
Pecans05 <- subset(Pecans05, X==2125);

Pecans06 <- subset(Nuts_Oil, Commodity_Description=="Pecans, Inshell Basis" & Year == 2006)
### Pecans 06 is fine

Pecans07 <- subset(Nuts_Oil, Commodity_Description=="Pecans, Inshell Basis" & Year == 2007)
### Pecans 07 has redundancy, dropping the extra values
Pecans07 <- subset(Pecans07, X==2127);

Pecans08 <- subset(Nuts_Oil, Commodity_Description=="Pecans, Inshell Basis" & Year == 2008)
### Pecans 08 is fine

Pecans09 <- subset(Nuts_Oil, Commodity_Description=="Pecans, Inshell Basis" & Year == 2009)
### Pecans 09 is null

Pecans10 <- subset(Nuts_Oil, Commodity_Description=="Pecans, Inshell Basis" & Year == 2010)
### Pecans 10 is null

Pecans11 <- subset(Nuts_Oil, Commodity_Description=="Pecans, Inshell Basis" & Year == 2011)
### Pecans 11 is null

Pecans12 <- subset(Nuts_Oil, Commodity_Description=="Pecans, Inshell Basis" & Year == 2012)
### Pecans 12 is null

## Binding & Exporting Pecan Data
Pecans <- rbind(Pecans98, Pecans99, Pecans00, Pecans01, Pecans02, Pecans03, Pecans04, Pecans05, Pecans06, Pecans07, Pecans08)
write.csv(Pecans, "C:\\Users\\saslo\\Data_Science\\DS_Portfolio\\Queen_Bees\\Datasets\\Wrangled_Data\\usdaPecans.csv");


## Looking at "Pistachios, Inshell Basis"

Pistachios98 <- subset(Nuts_Oil, Commodity_Description=="Pistachios, Inshell Basis" & Year == 1998)
### Pistachios 98 is fine

Pistachios99 <- subset(Nuts_Oil, Commodity_Description=="Pistachios, Inshell Basis" & Year == 1999)
### Pistachios 99 is fine

Pistachios00 <- subset(Nuts_Oil, Commodity_Description=="Pistachios, Inshell Basis" & Year == 2000)
### Pistachios 00 has redundancy, dropping the extra values
Pistachios00 <- subset(Pistachios00, X==479);

Pistachios01 <- subset(Nuts_Oil, Commodity_Description=="Pistachios, Inshell Basis" & Year == 2001)
### Pistachios 01 has redundancy, dropping the extra values
Pistachios01 <- subset(Pistachios01, X==480);

Pistachios02 <- subset(Nuts_Oil, Commodity_Description=="Pistachios, Inshell Basis" & Year == 2002)
### Pistachios 02 has redundancy, dropping the extra values
Pistachios02 <- subset(Pistachios02, X==481);

Pistachios03 <- subset(Nuts_Oil, Commodity_Description=="Pistachios, Inshell Basis" & Year == 2003)
### Pistachios 03 has redundancy, dropping the extra values
Pistachios03 <- subset(Pistachios03, X==2129);

Pistachios04 <- subset(Nuts_Oil, Commodity_Description=="Pistachios, Inshell Basis" & Year == 2004)
### Pistachios 04 has redundancy, dropping the extra values
Pistachios04 <- subset(Pistachios04, X==4855);

Pistachios05 <- subset(Nuts_Oil, Commodity_Description=="Pistachios, Inshell Basis" & Year == 2005)
### Pistachios 05 has redundancy, dropping the extra values
Pistachios05 <- subset(Pistachios05, X==2612);

Pistachios06 <- subset(Nuts_Oil, Commodity_Description=="Pistachios, Inshell Basis" & Year == 2006)
### Pistachios 06 has redundancy, dropping the extra values
Pistachios06 <- subset(Pistachios06, X==7181);

Pistachios07 <- subset(Nuts_Oil, Commodity_Description=="Pistachios, Inshell Basis" & Year == 2007)
### Pistachios 07 has redundancy, dropping the extra values
Pistachios07 <- subset(Pistachios07, X==2614);

Pistachios08 <- subset(Nuts_Oil, Commodity_Description=="Pistachios, Inshell Basis" & Year == 2008)
### Pistachios 08 has redundancy, dropping the extra values
Pistachios08 <- subset(Pistachios08, X==4859);

Pistachios09 <- subset(Nuts_Oil, Commodity_Description=="Pistachios, Inshell Basis" & Year == 2009)
### Pistachios 09 has redundancy, dropping the extra values
Pistachios09 <- subset(Pistachios09, X==4860);

Pistachios10 <- subset(Nuts_Oil, Commodity_Description=="Pistachios, Inshell Basis" & Year == 2010)
### Pistachios 10 has redundancy, dropping the extra values
Pistachios10 <- subset(Pistachios10, X==4861);

Pistachios11 <- subset(Nuts_Oil, Commodity_Description=="Pistachios, Inshell Basis" & Year == 2011)
### Pistachios 11 has redundancy, dropping the extra values
Pistachios11 <- subset(Pistachios11, X==5702);

Pistachios12 <- subset(Nuts_Oil, Commodity_Description=="Pistachios, Inshell Basis" & Year == 2012)
### Pistachios 12 has redundancy, dropping the extra values
Pistachios12 <- subset(Pistachios12, X==7470);

## Binding & Exporting Pistachios data
Pistachios <- rbind(Pistachios98, Pistachios99, Pistachios00, Pistachios01, Pistachios02, Pistachios03, Pistachios04, Pistachios05, Pistachios06, Pistachios07, Pistachios08, Pistachios09, Pistachios10, Pistachios11, Pistachios12)
write.csv(Pistachios, "C:\\Users\\saslo\\Data_Science\\DS_Portfolio\\Queen_Bees\\Datasets\\Wrangled_Data\\usdaPistachios.csv");


## Looking at "Walnuts, Inshell Basis"

Walnuts98 <- subset(Nuts_Oil, Commodity_Description=="Walnuts, Inshell Basis" & Year == 1998)
### Walnuts 98 has redundancy, dropping the extra values
Walnuts98 <- subset(Walnuts98, X==602);

Walnuts99 <- subset(Nuts_Oil, Commodity_Description=="Walnuts, Inshell Basis" & Year == 1999)
### Walnuts 99 has redundancy, dropping the extra values
Walnuts99 <- subset(Walnuts99, X==603);

Walnuts00 <- subset(Nuts_Oil, Commodity_Description=="Walnuts, Inshell Basis" & Year == 2000)
### Walnuts 00 has redundancy, dropping the extra values
Walnuts00 <- subset(Walnuts00, X==604);

Walnuts01 <- subset(Nuts_Oil, Commodity_Description=="Walnuts, Inshell Basis" & Year == 2001)
### Walnuts 01 has redundancy, dropping the extra values
Walnuts01 <- subset(Walnuts01, X==6357);

Walnuts02 <- subset(Nuts_Oil, Commodity_Description=="Walnuts, Inshell Basis" & Year == 2002)
### Walnuts 02 has redundancy, dropping the extra values
Walnuts02 <- subset(Walnuts02, X==606);

Walnuts03 <- subset(Nuts_Oil, Commodity_Description=="Walnuts, Inshell Basis" & Year == 2003)
### Walnuts 03 has redundancy, dropping the extra values
Walnuts03 <- subset(Walnuts03, X==607);

Walnuts04 <- subset(Nuts_Oil, Commodity_Description=="Walnuts, Inshell Basis" & Year == 2004)
### Walnuts 04 has redundancy, dropping the extra values
Walnuts04 <- subset(Walnuts04, X==608);

Walnuts05 <- subset(Nuts_Oil, Commodity_Description=="Walnuts, Inshell Basis" & Year == 2005)
### Walnuts 05 has redundancy, dropping the extra values
Walnuts05 <- subset(Walnuts05, X==6361);

Walnuts06 <- subset(Nuts_Oil, Commodity_Description=="Walnuts, Inshell Basis" & Year == 2006)
### Walnuts 06 has redundancy, dropping the extra values
Walnuts06 <- subset(Walnuts06, X==1249);

Walnuts07 <- subset(Nuts_Oil, Commodity_Description=="Walnuts, Inshell Basis" & Year == 2007)
### Walnuts 07 has redundancy, dropping the extra values
Walnuts07 <- subset(Walnuts07, X==6363);

Walnuts08 <- subset(Nuts_Oil, Commodity_Description=="Walnuts, Inshell Basis" & Year == 2008)
### Walnuts 08 has redundancy, dropping the extra values
Walnuts08 <- subset(Walnuts08, X==6364);

Walnuts09 <- subset(Nuts_Oil, Commodity_Description=="Walnuts, Inshell Basis" & Year == 2009)
### Walnuts 09 has redundancy, dropping the extra values
Walnuts09 <- subset(Walnuts09, X==6365);

Walnuts10 <- subset(Nuts_Oil, Commodity_Description=="Walnuts, Inshell Basis" & Year == 2010)
### Walnuts 10 has redundancy, dropping the extra values
Walnuts10 <- subset(Walnuts10, X==4611);

Walnuts11 <- subset(Nuts_Oil, Commodity_Description=="Walnuts, Inshell Basis" & Year == 2011)
### Walnuts 11 has redundancy, dropping the extra values
Walnuts11 <- subset(Walnuts11, X==5479);

Walnuts12 <- subset(Nuts_Oil, Commodity_Description=="Walnuts, Inshell Basis" & Year == 2012)
### Walnuts 12 has redundancy, dropping the extra values
Walnuts12 <- subset(Walnuts12, X==8005);

## Binding & Exporting Walnut Data
Walnuts <- rbind(Walnuts98, Walnuts99, Walnuts00, Walnuts01, Walnuts02, Walnuts03, Walnuts04, Walnuts05, Walnuts06, Walnuts07, Walnuts08, Walnuts09, Walnuts10, Walnuts11, Walnuts12)
write.csv(Walnuts, "C:\\Users\\saslo\\Data_Science\\DS_Portfolio\\Queen_Bees\\Datasets\\Wrangled_Data\\usdaWalnuts.csv");

## Binding & Exporting Nut Data
Nuts <- rbind(Walnuts, Pistachios, Pecans, Macadamia, Filberts, Almonds);
write.csv(Nuts, "C:\\Users\\saslo\\Data_Science\\DS_Portfolio\\Queen_Bees\\Datasets\\Wrangled_Data\\usdaNuts.csv");


## Looking at "Oil, Coconut"
### All values for all years of Coconut Oil production are zero, so we will unfortunately eliminate this commodity from our analysis

## Looking at "Oil, Cottonseed"

CottonseedOil98 <- subset(Nuts_Oil, Commodity_Description=="Oil, Cottonseed" & Year == 1998)
### Cottonseed Oil 98 has redundancy, dropping the extra values
CottonseedOil98 <- subset(CottonseedOil98, X==320);

CottonseedOil99 <- subset(Nuts_Oil, Commodity_Description=="Oil, Cottonseed" & Year == 1999)
### Cottonseed Oil 99 has redundancy, dropping the extra values
CottonseedOil99 <- subset(CottonseedOil99, X==321);

CottonseedOil00 <- subset(Nuts_Oil, Commodity_Description=="Oil, Cottonseed" & Year == 2000)
### Cottonseed Oil 00 is fine

CottonseedOil01 <- subset(Nuts_Oil, Commodity_Description=="Oil, Cottonseed" & Year == 2001)
### Cottonseed Oil 01 has redundancy, dropping the extra values
CottonseedOil01 <- subset(CottonseedOil01, X==323);

CottonseedOil02 <- subset(Nuts_Oil, Commodity_Description=="Oil, Cottonseed" & Year == 2002)
### Cottonseed Oil 02 has redundancy, dropping the extra values
CottonseedOil02 <- subset(CottonseedOil02, X==324);

CottonseedOil03 <- subset(Nuts_Oil, Commodity_Description=="Oil, Cottonseed" & Year == 2003)
### Cottonseed Oil 03 has redundancy, dropping the extra values
CottonseedOil03 <- subset(CottonseedOil03, X==325);

CottonseedOil04 <- subset(Nuts_Oil, Commodity_Description=="Oil, Cottonseed" & Year == 2004)
### Cottonseed Oil 04 has redundancy, dropping the extra values
CottonseedOil04 <- subset(CottonseedOil04, X==326);

CottonseedOil05 <- subset(Nuts_Oil, Commodity_Description=="Oil, Cottonseed" & Year == 2005)
### Cottonseed Oil 05 has redundancy, dropping the extra values
CottonseedOil05 <- subset(CottonseedOil05, X==327);

CottonseedOil06 <- subset(Nuts_Oil, Commodity_Description=="Oil, Cottonseed" & Year == 2006)
### Cottonseed Oil 06 has redundancy, dropping the extra values
CottonseedOil06 <- subset(CottonseedOil06, X==775);

CottonseedOil07 <- subset(Nuts_Oil, Commodity_Description=="Oil, Cottonseed" & Year == 2007)
### Cottonseed Oil 07 has redundancy, dropping the extra values
CottonseedOil07 <- subset(CottonseedOil07, X==1994);

CottonseedOil08 <- subset(Nuts_Oil, Commodity_Description=="Oil, Cottonseed" & Year == 2008)
### Cottonseed Oil 08 has redundancy, dropping the extra values
CottonseedOil08 <- subset(CottonseedOil08, X==2210);

CottonseedOil09 <- subset(Nuts_Oil, Commodity_Description=="Oil, Cottonseed" & Year == 2009)
### Cottonseed Oil 09 has redundancy, dropping the extra values
CottonseedOil09 <- subset(CottonseedOil09, X==3181);

CottonseedOil10 <- subset(Nuts_Oil, Commodity_Description=="Oil, Cottonseed" & Year == 2010)
### Cottonseed Oil 10 has redundancy, dropping the extra values
CottonseedOil10 <- subset(CottonseedOil10, X==7383);

CottonseedOil11 <- subset(Nuts_Oil, Commodity_Description=="Oil, Cottonseed" & Year == 2011)
### Cottonseed Oil 11 has redundancy, dropping the extra values
CottonseedOil11 <- subset(CottonseedOil11, X==4989);

CottonseedOil12 <- subset(Nuts_Oil, Commodity_Description=="Oil, Cottonseed" & Year == 2012)
### Cottonseed Oil 12 has redundancy, dropping the extra values
CottonseedOil12 <- subset(CottonseedOil12, X==6110);

## Binding & Exporting Cottonseed Oil Data
CottonseedOil <- rbind(CottonseedOil98, CottonseedOil99, CottonseedOil00, CottonseedOil01, CottonseedOil02, CottonseedOil03, CottonseedOil04, CottonseedOil05, CottonseedOil06, CottonseedOil07, CottonseedOil08, CottonseedOil09, CottonseedOil10, CottonseedOil11, CottonseedOil12);
write.csv(CottonseedOil, "C:\\Users\\saslo\\Data_Science\\DS_Portfolio\\Queen_Bees\\Datasets\\Wrangled_Data\\usdaCottonseedOil.csv");


## Looking at "Oil, Olive"

OliveOil98 <- subset(Nuts_Oil, Commodity_Description=="Oil, Olive" & Year == 1998)
### Olive Oil 98 has redundancy, dropping the extra values
OliveOil98 <- subset(OliveOil98, X==329);

OliveOil99 <- subset(Nuts_Oil, Commodity_Description=="Oil, Olive" & Year == 1999)
### Olive Oil 99 is fine

OliveOil00 <- subset(Nuts_Oil, Commodity_Description=="Oil, Olive" & Year == 2000)
### Olive Oil 00 has redundancy, dropping the extra values
OliveOil00 <- subset(OliveOil00, X==331);

OliveOil01 <- subset(Nuts_Oil, Commodity_Description=="Oil, Olive" & Year == 2001)
### Olive Oil 01 has redundancy, dropping the extra values
OliveOil01 <- subset(OliveOil01, X==332);

OliveOil02 <- subset(Nuts_Oil, Commodity_Description=="Oil, Olive" & Year == 2002)
### Olive Oil 02 has redundancy, dropping the extra values
OliveOil02 <- subset(OliveOil02, X==333);

OliveOil03 <- subset(Nuts_Oil, Commodity_Description=="Oil, Olive" & Year == 2003)
### Olive Oil 03 has redundancy, dropping the extra values
OliveOil03 <- subset(OliveOil03, X==2417);

OliveOil04 <- subset(Nuts_Oil, Commodity_Description=="Oil, Olive" & Year == 2004)
### Olive Oil 04 has redundancy, dropping the extra values
OliveOil04 <- subset(OliveOil04, X==2418);

OliveOil05 <- subset(Nuts_Oil, Commodity_Description=="Oil, Olive" & Year == 2005)
### Olive Oil 05 has redundancy, dropping the extra values
OliveOil05 <- subset(OliveOil05, X==2419);

OliveOil06 <- subset(Nuts_Oil, Commodity_Description=="Oil, Olive" & Year == 2006)
### Olive Oil 06 has redundancy, dropping the extra values
OliveOil06 <- subset(OliveOil06, X==337);

OliveOil07 <- subset(Nuts_Oil, Commodity_Description=="Oil, Olive" & Year == 2007)
### Olive Oil 07 has redundancy, dropping the extra values
OliveOil07 <- subset(OliveOil07, X==2420);

OliveOil08 <- subset(Nuts_Oil, Commodity_Description=="Oil, Olive" & Year == 2008)
### Olive Oil 08 has redundancy, dropping the extra values
OliveOil08 <- subset(OliveOil08, X==4882);

OliveOil09 <- subset(Nuts_Oil, Commodity_Description=="Oil, Olive" & Year == 2009)
### Olive Oil 09 has redundancy, dropping the extra values
OliveOil09 <- subset(OliveOil09, X==6111);

OliveOil10 <- subset(Nuts_Oil, Commodity_Description=="Oil, Olive" & Year == 2010)
### Olive Oil 10 has redundancy, dropping the extra values
OliveOil10 <- subset(OliveOil10, X==7934);

OliveOil11 <- subset(Nuts_Oil, Commodity_Description=="Oil, Olive" & Year == 2011)
### Olive Oil 11 has redundancy, dropping the extra values
OliveOil11 <- subset(OliveOil11, X==7935);

OliveOil12 <- subset(Nuts_Oil, Commodity_Description=="Oil, Olive" & Year == 2012)
### Olive Oil 12 has redundancy, dropping the extra values
OliveOil12 <- subset(OliveOil12, X==7936);

## Binding and Exporting Olive Oil Data
OliveOil <- rbind(OliveOil98, OliveOil99, OliveOil00, OliveOil01, OliveOil02, OliveOil03, OliveOil04, OliveOil05, OliveOil06, OliveOil07, OliveOil08, OliveOil09, OliveOil10, OliveOil11, OliveOil12)
write.csv(OliveOil, "C:\\Users\\saslo\\Data_Science\\DS_Portfolio\\Queen_Bees\\Datasets\\Wrangled_Data\\usdaOliveOil.csv");


## Looking at "Oil, Palm"
### All production values for all years of production are zero, so we will drop this commodity from analysis
PalmOil <- subset(Nuts_Oil, Commodity_Description=="Oil, Palm")


## Looking at "Oil, Palm Kernel"
### All production values for all years of production are zero, so we will drop this commodity from analysis
PalmKernelOil <- subset(Nuts_Oil, Commodity_Description=="Oil, Palm Kernel")


## Looking at "Oil, Peanut"

PeanutOil98 <- subset(Nuts_Oil, Commodity_Description=="Oil, Peanut" & Year == 1998)
### Peanut Oil is fine

PeanutOil99 <- subset(Nuts_Oil, Commodity_Description=="Oil, Peanut" & Year == 1999)
### Peanut Oil 99 is fine

PeanutOil00 <- subset(Nuts_Oil, Commodity_Description=="Oil, Peanut" & Year == 2000)
### Peanut Oil 00 has redundancy, dropping the extra values
PeanutOil00 <- subset(PeanutOil00, X==358);

PeanutOil01 <- subset(Nuts_Oil, Commodity_Description=="Oil, Peanut" & Year == 2001)
### Peanut Oil 01 has redundancy, dropping the extra values
PeanutOil01 <- subset(PeanutOil01, X==359);

PeanutOil02 <- subset(Nuts_Oil, Commodity_Description=="Oil, Peanut" & Year == 2002)
### Peanut Oil 02 has redundancy, dropping the extra values
PeanutOil02 <- subset(PeanutOil02, X==360);

PeanutOil03 <- subset(Nuts_Oil, Commodity_Description=="Oil, Peanut" & Year == 2003)
### Peanut Oil 03 has redundancy, dropping the extra values
PeanutOil03 <- subset(PeanutOil03, X==361);

PeanutOil04 <- subset(Nuts_Oil, Commodity_Description=="Oil, Peanut" & Year == 2004)
### Peanut Oil 04 has redundancy, dropping the extra values
PeanutOil04 <- subset(PeanutOil04, X==362);

PeanutOil05 <- subset(Nuts_Oil, Commodity_Description=="Oil, Peanut" & Year == 2005)
### Peanut Oil 05 has redundancy, dropping the extra values
PeanutOil05 <- subset(PeanutOil05, X==363);

PeanutOil06 <- subset(Nuts_Oil, Commodity_Description=="Oil, Peanut" & Year == 2006)
### Peanut Oil 06 has redundancy, dropping the extra values
PeanutOil06 <- subset(PeanutOil06, X==781);

PeanutOil07 <- subset(Nuts_Oil, Commodity_Description=="Oil, Peanut" & Year == 2007)
### Peanut Oil 07 has redundancy, dropping the extra values
PeanutOil07 <- subset(PeanutOil07, X==1832);

PeanutOil08 <- subset(Nuts_Oil, Commodity_Description=="Oil, Peanut" & Year == 2008)
### Peanut Oil 08 has redundancy, dropping the extra values
PeanutOil08 <- subset(PeanutOil08, X==2424);

PeanutOil09 <- subset(Nuts_Oil, Commodity_Description=="Oil, Peanut" & Year == 2009)
### Peanut Oil 09 has redundancy, dropping the extra values
PeanutOil09 <- subset(PeanutOil09, X==3344);

PeanutOil10 <- subset(Nuts_Oil, Commodity_Description=="Oil, Peanut" & Year == 2010)
### Peanut Oil 10 has redundancy, dropping the extra values
PeanutOil10 <- subset(PeanutOil10, X==6484);

PeanutOil11 <- subset(Nuts_Oil, Commodity_Description=="Oil, Peanut" & Year == 2011)
### Peanut Oil 11 has redundancy, dropping the extra values
PeanutOil11 <- subset(PeanutOil11, X==6204);

PeanutOil12 <- subset(Nuts_Oil, Commodity_Description=="Oil, Peanut" & Year == 2012)
### Peanut Oil 12 has redundancy, dropping the extra values
PeanutOil12 <- subset(PeanutOil12, X==6486);

## Binding and Exporting Peanut Oil Data
PeanutOil <- rbind(PeanutOil98, PeanutOil99, PeanutOil00, PeanutOil01, PeanutOil02, PeanutOil03, PeanutOil04, PeanutOil05, PeanutOil06, PeanutOil07, PeanutOil08, PeanutOil09, PeanutOil10, PeanutOil11, PeanutOil12)
write.csv(PeanutOil, "C:\\Users\\saslo\\Data_Science\\DS_Portfolio\\Queen_Bees\\Datasets\\Wrangled_Data\\usdaPeanutOil.csv");


## Looking at "Oil, Rapeseed"

RapeseedOil98 <- subset(Nuts_Oil, Commodity_Description=="Oil, Rapeseed" & Year == 1998)
### Rapeseed Oil has redundancy, dropping the extra values
RapeseedOil98 <- subset(RapeseedOil98, X==4104);

RapeseedOil99 <- subset(Nuts_Oil, Commodity_Description=="Oil, Rapeseed" & Year == 1999)
### Rapeseed Oil 99 has redundancy, dropping the extra values
RapeseedOil99 <- subset(RapeseedOil99, X==4105);

RapeseedOil00 <- subset(Nuts_Oil, Commodity_Description=="Oil, Rapeseed" & Year == 2000)
### Rapeseed Oil 00 has redundancy, dropping the extra values
RapeseedOil00 <- subset(RapeseedOil00, X==4106);

RapeseedOil01 <- subset(Nuts_Oil, Commodity_Description=="Oil, Rapeseed" & Year == 2001)
### Rapeseed Oil 01 has redundancy, dropping the extra values
RapeseedOil01 <- subset(RapeseedOil01, X==4107);

RapeseedOil02 <- subset(Nuts_Oil, Commodity_Description=="Oil, Rapeseed" & Year == 2002)
### Rapeseed Oil 02 has redundancy, dropping the extra values
RapeseedOil02 <- subset(RapeseedOil02, X==4108);

RapeseedOil03 <- subset(Nuts_Oil, Commodity_Description=="Oil, Rapeseed" & Year == 2003)
### Rapeseed Oil 03 has redundancy, dropping the extra values
RapeseedOil03 <- subset(RapeseedOil03, X==4109);

RapeseedOil04 <- subset(Nuts_Oil, Commodity_Description=="Oil, Rapeseed" & Year == 2004)
### Rapeseed Oil 04 has redundancy, dropping the extra values
RapeseedOil04 <- subset(RapeseedOil04, X==4110);

RapeseedOil05 <- subset(Nuts_Oil, Commodity_Description=="Oil, Rapeseed" & Year == 2005)
### Rapeseed Oil 05 has redundancy, dropping the extra values
RapeseedOil05 <- subset(RapeseedOil05, X==4111);

RapeseedOil06 <- subset(Nuts_Oil, Commodity_Description=="Oil, Rapeseed" & Year == 2006)
### Rapeseed Oil 06 has redundancy, dropping the extra values
RapeseedOil06 <- subset(RapeseedOil06, X==988);

RapeseedOil07 <- subset(Nuts_Oil, Commodity_Description=="Oil, Rapeseed" & Year == 2007)
### Rapeseed Oil 07 has redundancy, dropping the extra values
RapeseedOil07 <- subset(RapeseedOil07, X==1430);

RapeseedOil08 <- subset(Nuts_Oil, Commodity_Description=="Oil, Rapeseed" & Year == 2008)
### Rapeseed Oil 08 has redundancy, dropping the extra values
RapeseedOil08 <- subset(RapeseedOil08, X==4114);

RapeseedOil09 <- subset(Nuts_Oil, Commodity_Description=="Oil, Rapeseed" & Year == 2009)
### Rapeseed Oil 09 has redundancy, dropping the extra values
RapeseedOil09 <- subset(RapeseedOil09, X==3624);

RapeseedOil10 <- subset(Nuts_Oil, Commodity_Description=="Oil, Rapeseed" & Year == 2010)
### Rapeseed Oil 10 has redundancy, dropping the extra values
RapeseedOil10 <- subset(RapeseedOil10, X==5317);

RapeseedOil11 <- subset(Nuts_Oil, Commodity_Description=="Oil, Rapeseed" & Year == 2011)
### Rapeseed Oil 11 has redundancy, dropping the extra values
RapeseedOil11 <- subset(RapeseedOil11, X==5834);

RapeseedOil12 <- subset(Nuts_Oil, Commodity_Description=="Oil, Rapeseed" & Year == 2012)
### Rapeseed Oil 12 has redundancy, dropping the extra values
RapeseedOil12 <- subset(RapeseedOil12, X==6032);

## Binding & Extracting Rapeseed Oil Data
RapeseedOil <- rbind(RapeseedOil98, RapeseedOil99, RapeseedOil00, RapeseedOil01, RapeseedOil02, RapeseedOil03, RapeseedOil04, RapeseedOil05, RapeseedOil06, RapeseedOil07, RapeseedOil08, RapeseedOil09, RapeseedOil10, RapeseedOil11, RapeseedOil12)
write.csv(RapeseedOil, "C:\\Users\\saslo\\Data_Science\\DS_Portfolio\\Queen_Bees\\Datasets\\Wrangled_Data\\usdaRapeseedOil.csv");


## Looking at "Oil, Soybean"

SoybeanOil98 <- subset(Nuts_Oil, Commodity_Description=="Oil, Soybean" & Year == 1998)
### Soybean Oil has redundancy, dropping the extra values
SoybeanOil98 <- subset(SoybeanOil98, X==374);

SoybeanOil99 <- subset(Nuts_Oil, Commodity_Description=="Oil, Soybean" & Year == 1999)
### Soybean Oil 99 has redundancy, dropping the extra values
SoybeanOil99 <- subset(SoybeanOil99, X==375);

SoybeanOil00 <- subset(Nuts_Oil, Commodity_Description=="Oil, Soybean" & Year == 2000)
### Soybean Oil 00 has redundancy, dropping the extra values
SoybeanOil00 <- subset(SoybeanOil00, X==376);

SoybeanOil01 <- subset(Nuts_Oil, Commodity_Description=="Oil, Soybean" & Year == 2001)
### Soybean Oil 01 has redundancy, dropping the extra values
SoybeanOil01 <- subset(SoybeanOil01, X==377);

SoybeanOil02 <- subset(Nuts_Oil, Commodity_Description=="Oil, Soybean" & Year == 2002)
### Soybean Oil 02 has redundancy, dropping the extra values
SoybeanOil02 <- subset(SoybeanOil02, X==378);

SoybeanOil03 <- subset(Nuts_Oil, Commodity_Description=="Oil, Soybean" & Year == 2003)
### Soybean Oil 03 has redundancy, dropping the extra values
SoybeanOil03 <- subset(SoybeanOil03, X==379);

SoybeanOil04 <- subset(Nuts_Oil, Commodity_Description=="Oil, Soybean" & Year == 2004)
### Soybean Oil 04 has redundancy, dropping the extra values
SoybeanOil04 <- subset(SoybeanOil04, X==1431);

SoybeanOil05 <- subset(Nuts_Oil, Commodity_Description=="Oil, Soybean" & Year == 2005)
### Soybean Oil 05 has redundancy, dropping the extra values
SoybeanOil05 <- subset(SoybeanOil05, X==684);

SoybeanOil06 <- subset(Nuts_Oil, Commodity_Description=="Oil, Soybean" & Year == 2006)
### Soybean Oil 06 has redundancy, dropping the extra values
SoybeanOil06 <- subset(SoybeanOil06, X==7071);

SoybeanOil07 <- subset(Nuts_Oil, Commodity_Description=="Oil, Soybean" & Year == 2007)
### Soybean Oil 07 has redundancy, dropping the extra values
SoybeanOil07 <- subset(SoybeanOil07, X==2225);

SoybeanOil08 <- subset(Nuts_Oil, Commodity_Description=="Oil, Soybean" & Year == 2008)
### Soybean Oil 08 has redundancy, dropping the extra values
SoybeanOil08 <- subset(SoybeanOil08, X==2110);

SoybeanOil09 <- subset(Nuts_Oil, Commodity_Description=="Oil, Soybean" & Year == 2009)
### Soybean Oil 09 has redundancy, dropping the extra values
SoybeanOil09 <- subset(SoybeanOil09, X==7394);

SoybeanOil10 <- subset(Nuts_Oil, Commodity_Description=="Oil, Soybean" & Year == 2010)
### Soybean Oil 10 has redundancy, dropping the extra values
SoybeanOil10 <- subset(SoybeanOil10, X==5082);

SoybeanOil11 <- subset(Nuts_Oil, Commodity_Description=="Oil, Soybean" & Year == 2011)
### Soybean Oil 11 has redundancy, dropping the extra values
SoybeanOil11 <- subset(SoybeanOil11, X==6308);

SoybeanOil12 <- subset(Nuts_Oil, Commodity_Description=="Oil, Soybean" & Year == 2012)
### Soybean Oil 12 has redundancy, dropping the extra values
SoybeanOil12 <- subset(SoybeanOil12, X==8084);

## Binding and Exporting Soybean Oil Data
SoybeanOil <- rbind(SoybeanOil98, SoybeanOil99, SoybeanOil00, SoybeanOil01, SoybeanOil02, SoybeanOil03, SoybeanOil04, SoybeanOil05, SoybeanOil06, SoybeanOil07, SoybeanOil08, SoybeanOil09, SoybeanOil10, SoybeanOil11, SoybeanOil12)
write.csv(SoybeanOil, "C:\\Users\\saslo\\Data_Science\\DS_Portfolio\\Queen_Bees\\Datasets\\Wrangled_Data\\usdaRapeseedOil.csv")


## Looking at "Oil, Sunflowerseed"

SunflowerseedOil98 <- subset(Nuts_Oil, Commodity_Description=="Oil, Sunflowerseed" & Year == 1998)
### Sunflowerseed Oil has redundancy, dropping the extra values
SunflowerseedOil98 <- subset(SunflowerseedOil98, X==383);

SunflowerseedOil99 <- subset(Nuts_Oil, Commodity_Description=="Oil, Sunflowerseed" & Year == 1999)
### Sunflowerseed Oil 99 has redundancy, dropping the extra values
SunflowerseedOil99 <- subset(SunflowerseedOil99, X==2860);

SunflowerseedOil00 <- subset(Nuts_Oil, Commodity_Description=="Oil, Sunflowerseed" & Year == 2000)
### Sunflowerseed Oil 00 has redundancy, dropping the extra values
SunflowerseedOil00 <- subset(SunflowerseedOil00, X==385);

SunflowerseedOil01 <- subset(Nuts_Oil, Commodity_Description=="Oil, Sunflowerseed" & Year == 2001)
### Sunflowerseed Oil 01 has redundancy, dropping the extra values
SunflowerseedOil01 <- subset(SunflowerseedOil01, X==2862);

SunflowerseedOil02 <- subset(Nuts_Oil, Commodity_Description=="Oil, Sunflowerseed" & Year == 2002)
### Sunflowerseed Oil 02 has redundancy, dropping the extra values
SunflowerseedOil02 <- subset(SunflowerseedOil02, X==7537);

SunflowerseedOil03 <- subset(Nuts_Oil, Commodity_Description=="Oil, Sunflowerseed" & Year == 2003)
### Sunflowerseed Oil 03 has redundancy, dropping the extra values
SunflowerseedOil03 <- subset(SunflowerseedOil03, X==388);

SunflowerseedOil04 <- subset(Nuts_Oil, Commodity_Description=="Oil, Sunflowerseed" & Year == 2004)
### Sunflowerseed Oil 04 has redundancy, dropping the extra values
SunflowerseedOil04 <- subset(SunflowerseedOil04, X==389);

SunflowerseedOil05 <- subset(Nuts_Oil, Commodity_Description=="Oil, Sunflowerseed" & Year == 2005)
### Sunflowerseed Oil 05 has redundancy, dropping the extra values
SunflowerseedOil05 <- subset(SunflowerseedOil05, X==7539);

SunflowerseedOil06 <- subset(Nuts_Oil, Commodity_Description=="Oil, Sunflowerseed" & Year == 2006)
### Sunflowerseed Oil 06 has redundancy, dropping the extra values
SunflowerseedOil06 <- subset(SunflowerseedOil06, X==1503);

SunflowerseedOil07 <- subset(Nuts_Oil, Commodity_Description=="Oil, Sunflowerseed" & Year == 2007)
### Sunflowerseed Oil 07 has redundancy, dropping the extra values
SunflowerseedOil07 <- subset(SunflowerseedOil07, X==1800);

SunflowerseedOil08 <- subset(Nuts_Oil, Commodity_Description=="Oil, Sunflowerseed" & Year == 2008)
### Sunflowerseed Oil 08 has redundancy, dropping the extra values
SunflowerseedOil08 <- subset(SunflowerseedOil08, X==4569);

SunflowerseedOil09 <- subset(Nuts_Oil, Commodity_Description=="Oil, Sunflowerseed" & Year == 2009)
### Sunflowerseed Oil 09 has redundancy, dropping the extra values
SunflowerseedOil09 <- subset(SunflowerseedOil09, X==7079);

SunflowerseedOil10 <- subset(Nuts_Oil, Commodity_Description=="Oil, Sunflowerseed" & Year == 2010)
### Sunflowerseed Oil 10 has redundancy, dropping the extra values
SunflowerseedOil10 <- subset(SunflowerseedOil10, X==4702);

SunflowerseedOil11 <- subset(Nuts_Oil, Commodity_Description=="Oil, Sunflowerseed" & Year == 2011)
### Sunflowerseed Oil 11 has redundancy, dropping the extra values
SunflowerseedOil11 <- subset(SunflowerseedOil11, X==5262);

SunflowerseedOil12 <- subset(Nuts_Oil, Commodity_Description=="Oil, Sunflowerseed" & Year == 2012)
### Sunflowerseed Oil 12 has redundancy, dropping the extra values
SunflowerseedOil12 <- subset(SunflowerseedOil12, X==5840);

## Binding & Extracting Sunflowerseed Oil Data
SunflowerseedOil <- rbind(SunflowerseedOil98, SunflowerseedOil99, SunflowerseedOil00, SunflowerseedOil01, SunflowerseedOil02, SunflowerseedOil03, SunflowerseedOil04, SunflowerseedOil05, SunflowerseedOil06, SunflowerseedOil07, SunflowerseedOil08, SunflowerseedOil09, SunflowerseedOil10, SunflowerseedOil11, SunflowerseedOil12)
write.csv(SunflowerseedOil, "C:\\Users\\saslo\\Data_Science\\DS_Portfolio\\Queen_Bees\\Datasets\\Wrangled_Data\\usdaSunflowerseedOil.csv");

## To avoid multicollinearity, the oilseed data will be dropped from analysis, as these are the seed from which the above oils are extracted. 

## Binding & Exporting Oil Data
Oils <- rbind(SunflowerseedOil, SoybeanOil, RapeseedOil, PeanutOil, OliveOil, CottonseedOil)
write.csv(Oils, "C:\\Users\\saslo\\Data_Science\\DS_Portfolio\\Queen_Bees\\Datasets\\Wrangled_Data\\usdaOils.csv")

## Combining Nuts & Oils Data
Nuts_Oils <- rbind(Nuts, Oils)

## Adding in Honey Data
honey <- subset(usdaHoney, Category==6)
Nuts_Oils <- rbind(Nuts_Oils, honey)

write.csv(Nuts_Oils, "C:\\Users\\saslo\\Data_Science\\DS_Portfolio\\Queen_Bees\\Datasets\\Wrangled_Data\\usdaNuts_Oils.csv", row.names = FALSE)
