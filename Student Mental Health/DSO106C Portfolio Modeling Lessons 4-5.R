install.packages("car")
install.packages("caret")
install.packages("gvlma")
install.packages("predictmeans")
install.packages("e1071")
install.packages("lmtest")
library("car")
library("caret")
library("predictmeans")
library("e1071")
library("lmtest")
library("gvlma")

#Lesson 4
#Out of the 5 datasets that you chose during DSO104, choose a dataset that has a
#continuous variable that you think would be valuable to predict. Also, this dataset must
#have at least 4 other variables of type numeric or Boolean that can be used as
#independent variables. Perform stepwise regression in R. It is your choice to do forward or
#backward elimination. Are there any variables you chose that can be removed without
#decreasing R-squared?
#Tip: Make sure to remove NA's after you create a dataframe with your selected variables

library(readr)
Student_Mental_health <- read_csv("C:/Users/sdstc/Documents/Education/Other/Entity Academy/Portfolio/Datasets/Mental Health/Student Mental Health.csv")
View(Student_Mental_health)

#Question SETUP: Predict students' GPAs based on all other independent variables
#in the dataset.

stdntMH <- na.omit(Student_Mental_health)
colnames(stdntMH)[6] ="CGPA"
colnames(stdntMH)[5] = "Year"

stdntMH <- stdntMH %>% mutate(CGPA2=recode(CGPA, '0 - 1.99'='0', '2.00 - 2.49'='1', '2.50 - 2.99'='2', '3.00 - 3.49'='3', '3.50 - 4.00'='4'))


FitAll = lm(CGPA2 ~ ., data = stdntMH)
summary(FitAll)

#Using this dataframe only made it impossible to find out the coeeficients and statistics
#for the analysis of the dataset. So we will clean up our data a bit more in hopes of being
#able to perform a forward selection.

stdntMH <- stdntMH %>% mutate(Year2=recode(Year, 'year 1'='1', 'Year 1'='1', 'year 2'='2', 'Year 2'='2', 'year 3'='3', 'Year 3' = '3', 'year 4'='4', 'Year 4'='4'))

stdntMH2 <- subset(stdntMH, select = -c(Timestamp, Year, CGPA))
stdntMH2

#Write out CSV file to specific place in folder
write.csv(stdntMH2,"~/Education/Other/Entity Academy/Portfolio/DSO106C Extra Portfolio Activities/Student Mental Health//Student Mental Health Revamped.csv", row.names = FALSE)

FitAll = lm(CGPA2 ~ ., data=stdntMH2)
summary(FitAll)

#According to the statistics acquired via summary of the FitAll formula, Fiqh course held
#the most significance, followed by Biotechnology. Fiqh entails Islamic law, which may likely be a contributing
#factor to a student's current GPA and mental health outcomes.

step(FitAll, direction = 'backward')

# The model with the lowest AIC (-34.84) was CGPA2 ~ 'Choose your gender' + 'What is your course?' + 'Do you have Depression?' + 'Do you have Anxiety?' + Year2

# This means that these are the factors that would best influence the current GPA of these university students

#The best fit model appears to be:
fitsome = lm(CGPA2 ~ `Choose your gender` + `What is your course?` + `Do you have Depression?` + `Do you have Anxiety?` + Year2, data = stdntMH2)
summary(fitsome)

#Equation appears to be: y = 2.597 + (-0.3171)'Choose your gender' + (-3.000)'What is your course?' + (-0.2789)'Do you have Depression?' + (0.3931)'Do you have Anxiety?' + (0.6678)Year2(4)
#This equation is accounts for nearly 33.34% of the data, which isn't that high and is counted as significant according to the p value, deeming the y-intercept, Biotechnology, and Fiqh course
#as significant in determining one's CGPA.
