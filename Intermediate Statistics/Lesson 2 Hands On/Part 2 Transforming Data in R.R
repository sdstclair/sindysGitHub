library(rcompanion)

library(readr)
Seattle_ParksnRec <- read_csv("Education/Other/Entity Academy/Intermediate Statistics/Hands On/Lesson 2 Hands On/Seattle_ParksnRec.csv")
View(Seattle_ParksnRec)

#Number of Trips Fall
plotNormalHistogram(Seattle_ParksnRec$`# of trips Fall`)
# This seems to already be a good distribution, just more positive than not.
# But we want to get it to be perfectly distributed. So we will square root it.

SeattlePRsqrt <- sqrt(Seattle_ParksnRec$`# of trips Fall`)
plotNormalHistogram(SeattlePRsqrt)
#This seems to have a more normal distribution with a positive skew.
#If we wanted to continue in checking to see if logarithm would make a more
#healthier and normal distribution, we could. So, we shall.

SeattlePRlog <- log(Seattle_ParksnRec$`# of trips Fall`)
plotNormalHistogram(SeattlePRlog)
#This bell shaped normal distribution is the best out of all the distributions.
#So, it will be kept.


#Number of Participants Fall
plotNormalHistogram(Seattle_ParksnRec$`# of participants Fall`)
# This graph appears to be positively skewed in distribution. So we will use
# square root to transform it.

SeattlePRsqrtPF <- sqrt(Seattle_ParksnRec$`# of participants Fall`)
plotNormalHistogram(SeattlePRsqrtPF)
# This histogram is nearly perfect. I want to try to apply the logarithm to the
# data in hopes of it being even more neat. Let's try it.

SeattlePRlogPF <- log(Seattle_ParksnRec$`# of participants Fall`)
plotNormalHistogram(SeattlePRlogPF)
# This displays a normal distribution that is neither negative or positive.
# This is nearly, if not entirely, perfect.


#Number of Trips Per Year
plotNormalHistogram(Seattle_ParksnRec$`# of trips per year`)
# This histogram appears to be positively skewed in distribution. So for that,
# we will apply square root in hopes of transforming the data to acquire a more
# normal distribution.

SeattlePRsqrtTPY <- sqrt(Seattle_ParksnRec$`# of trips per year`)
plotNormalHistogram(SeattlePRsqrtTPY)
# This histogram is becoming more normal in distribution as square root is
# applied. So let's continue by using log.

SeattlePRlogTPY <- log(Seattle_ParksnRec$`# of trips per year`)
plotNormalHistogram(SeattlePRlogTPY)
# This histogram is perfectly balanced and exhibits a normal distribution.


#Number of Participants Per Year
plotNormalHistogram(Seattle_ParksnRec$`# participants per year`)
# This histogram is positively skewed, though rather close to being normal. So
# let's apply square root once again to transform the data into perhaps a more 
# normal distribution.

SeattlePRsqrtPPY <- sqrt(Seattle_ParksnRec$`# participants per year`)
plotNormalHistogram(SeattlePRsqrtPPY)
# This made it less positive in distribution, but still bearing a positive skew.
# Let's try logarithm to see if it will budge even further to the right.

SeattlePRlogPPY <- log(Seattle_ParksnRec$`# participants per year`)
plotNormalHistogram(SeattlePRlogPPY)
# Applying the logarithm made it more negatively skewed than positively skewed.
# So, perhaps leaving it as it were after square rooting it would be the better
# option.


#Increase/Decrease of Prior Year
plotNormalHistogram(Seattle_ParksnRec$`increase/decrease of prior year`)
# This graph is already perfectly distributed or normally distributed. But for 
# the purposes of this graph, we will apply the methodology for transforming
# positive data, just to see if it could improve.

SeattlePRsqrtIDPY <- sqrt(Seattle_ParksnRec$`increase/decrease of prior year`)
plotNormalHistogram(SeattlePRsqrtIDPY)
# This only made the graph worse, darn it! Now it is way more positively skewed
# in distribution. But let's keep trying for the sake of this assignment. Let's
# use logarithm to see where it goes.

SeattlePRlogIDPY <- log(Seattle_ParksnRec$`increase/decrease of prior year`)
plotNormalHistogram(SeattlePRlogIDPY)
# Uh oh! This calls for a removal of infinite values!

library("IDPmisc")
Seattle_PnR2 <- NaRV.omit(Seattle_ParksnRec)

plotNormalHistogram(Seattle_PnR2$`increase/decrease of prior year`)
# This appears to be normally distributed.


#Average Number of People Per Trip
plotNormalHistogram(Seattle_ParksnRec$`Average # people per trip`)
# This appears to be rather positively skewed in distribution. But let's toy 
# around with it.

SeattlePRsqrtPPT <- sqrt(Seattle_ParksnRec$`Average # people per trip`)
plotNormalHistogram(SeattlePRsqrtPPT)
# This histogram appears to be even more normal than the last, closer towards
# the middle of the histogram. What would happen if we were to apply log to this
# histogram?

SeattlePRlogPPT <- log(Seattle_ParksnRec$`Average # people per trip`)
plotNormalHistogram(SeattlePRlogPPT)
#This histogram transformed into a negatively skewed histogram. I think I prefer
#the square rooted version of the data to the logarithm of this data.