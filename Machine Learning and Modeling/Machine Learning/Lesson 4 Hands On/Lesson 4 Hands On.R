# Lesson 4 Hands On


trials <- 10000
# Create a variable to hold onto the priors
# and the number of trials you want to extend
# this to.

alpha <- 9
beta <- 1
# Create your alpha and beta variables out of
# the priors which were 90% leaving the beta 
# to be 10%.

samplesA <- rbeta(trials, 27+alpha, 39 + beta)
samplesB <- rbeta(trials, 10+alpha, 45 + beta)
# Your rbeta() is ready to be set up by 
# placing the function inside of a two 
# separate sample variables. The alpha is
# added with the Mold Returned and the beta is
# added with the Did Not Return.

Bsuperior <- sum(samplesB > samplesA) / trials
# The sum() function is used to add up every
# time that samplesB was greater than samplesA
# out of the total number of trials. You are
# calculating the percentage of trials in
# which sampleB came back greater than sampleA

Bsuperior
# Print the answer of the function above.

# Bleach theres a 0.1318% chance that the
# "bleach" is 99% effective.
