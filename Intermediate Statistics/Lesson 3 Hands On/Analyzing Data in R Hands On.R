#Load in Data
library(readr)
loans <- read_csv("Education/Other/Entity Academy/Intermediate Statistics/Hands On/Lesson 3 Hands On/loans.csv")
View(loans)

#Load in Libraries
library("gmodels")
library("dplyr")
library("tidyr")

#Part 1 - Does the term of the loan influence loan status? If so, how?
#Independent Chi-Square
CrossTable(loans$term, loans$loan_status, fisher=TRUE, chisq = TRUE, expected = TRUE, sresid=TRUE, format="SPSS")

#The expected values or frequency in each cell are well above 5. This meets the
#assumption for Chi-Square. Let's interpret the results.

#The p value is less than 0.05, making this analysis significant, which truly
#means that the term of the loan does in fact influence the loan status.

#But HOW does loan term influence loan status? Let's engage in post hoc analysis
#to determine where these differences lie. In 36 month term loans, it is less
#likely to be charged off or current, but more likely to be fully paid. In 60
#month term loans, it is more likely to be charged off or current, but less likely
#to be fully paid. I have come to the conclusion that shorter-term loans were
#more likely to be fully paid off than long term loans.


#Part 2 - How has the ability to own a home changed after 2009?
str(loans)

loans$DateR <- as.Date(paste(loans$Date), "%m/%d/%Y")
loans1 <- separate(loans, DateR, c("Year", "Month", "Day"), sep = "-")

loans1$YearR <- NA
loans1$YearR[loans1$Year <= 2009] <- 0
loans1$YearR[loans1$Year > 2009] <- 1

loans1$RentvOwn <- NA
loans1$RentvOwn[loans1$home_ownership == "RENT"] <- 0
loans1$RentvOwn[loans1$home_ownership == "OWN"] <- 1

CrossTable(loans1$RentvOwn, loans1$YearR, fisher = TRUE, chisq = TRUE, mcnemar = TRUE, expected = TRUE, sresid = TRUE, format = "SPSS")

# According to the standard residuals of the Chi-Square, there was little to no
# change in one's ability to own a home after the year 2009 when compared to the
# years prior to 2009. The p value is less than 0.05, making the data analysis
# Rather significant. In other words, This means that on this occasion, there is
# a difference in ability to own a home before and after 2009.


#Part 3 - The news just ran a story that only 15% of homes are fully paid for in
#America, and that another 10% have given up on paying it back, so the bank has 
#"charged off" the loan. Does it seem likely that the data for this hands on
#came from the larger population of America?

loans %>% group_by(loan_status) %>% summarize(count=n())

observed = c(18173, 502, 3282)
expected = c(0.83, 0.02, 0.15)
chisq.test(x = observed, p = expected)

#The p value is less than 0.05, making the data analysis significant. In other
#words, the data for this hands on did in fact come from a larger population of America.