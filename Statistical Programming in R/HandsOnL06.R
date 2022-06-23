#From the mtcars data frame, create a box plot of miles per gallon (the mpg variable) grouped by the number of cylinders in the engine (the cyl variable). Do these box plots make sense? Also, use the summarize() and group_by() functions to compute how many cars have four cylinders, how many have six, and how many have eight.

#Prepare a report (using MS Power Point or similar) with all of these elements and any code used to arrive at the results.


#This is to view the dataset in its entirety

mtcars

#Box plot of miles per gallon grouped by number of cynlinders

#The simple way using the built-in R function boxplot
boxplot(mtcars$mpg ~ mtcars$cyl, data=mtcars)

#The slighttly more complex way with more adaptability, using ggplot
library("ggplot2")
ggplot(mtcars, aes(x = cyl, y = mpg)) + geom_boxplot(aes(group=cyl))

#Yes, this makes sense- the more cylinders a car has, the more gas it will use and the lower the miles per gallon will be.

