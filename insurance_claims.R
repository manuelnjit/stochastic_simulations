set.seed(4)

# The following simulation finds the probability that an
# insurance company, will not go under throughout its first year. 
# The process assumes: claims are made according to a poisson process
# with rate 10 per day. Amount per claim is a random variable that has
# exponential distribution with mean $1000. Isurance company recieves
# payments continuously in time at constant rate of $11,000 per day. 
# And the insurance company starts with a capital of $25,000. 


firstclaim <- function(bigT){ # This function generates a poisson process
    s <- c()                  # up to parameter big T with rate 10
    t <- 0
    I <- 0
    u1 <- runif(1,0,1)
    t <- t - 1/(10)*log(u1)
    while (t < bigT){
      I <- I + 1
      s <- append(s, t)
      u1 <- runif(1,0,1)
      t <- t - 1/(10)*log(u1)
    }
    return(s[1])              # Although the function generates a poisson 
}                             # process I am only using the first value 
                              # and then using a subroutine

nextclaim <- function(t){     # generates simulated time of a new claim
  u1 <- runif(1,0,1)          # with constant rate 10
  t <- t -(1/10)*log(u1)
  return(t)
}

amountclaim <- function(){    # generates a random variable that has an 
  u1 <- runif(1,0,1)          # exponential distribution with mean 1000
  X <- (-1000)*log(u1)        # to simulate dollar amount of claim
  return(X)
}

insurancesim <- function(N){  # insurancesim runs N number of simulations 
  prob <- c()                 # where we will model each trial as a 
  for (i in 1:N){             # binomial distribution. 
    t <- 0                    # initializing time at starting point 0
    a <- 25000                # current budget
    n <- 365                  # number of days
    te <- firstclaim(365)     # starting time
    k <- 1
    statement <- TRUE

    while (statement == TRUE){
      if (te > 365){          # Case 1 ~ current time > 365 days 
        I <- 1                # I is 1; successfully completed w/o going under
        statement <- FALSE    # break loop
      }
      else if(te <= k){       # Case 2 ~ current time < k; where k is the kth day
        t <- te               # dummy variable
        te <- nextclaim(t)    # simulate time of new claim according to our past time
        
        if (te > k){          # if our simulated time is greater than our kth day
          lo.constant <- (k-t)*11000 # remaining part of continuous payment; kth day  
          a <- a + lo.constant       # add payment to the total budget
          lo.constant2 <- -1*(k-te)
          a <- a + loconstant2
          k <- k + 1
          next()
        }else{
          lo.constant2 <- 0 
        }
        p.constant <- (te-t)*11000 # part of payment coming in continously with claim
        a <- a + p.constant - amountclaim() + lo.constant2
        
        if (a < 0){            # if a is under 
          I <- 0               # I is 0; failed to complete a year of not going under 
          statement <- FALSE   # break loop
        }
        k <- k + 1             # next day 
      }
    }
    prob <- append(prob, I)    # for one simulation add 1 if trial was a success
  }                            # else add zero if trial was a failure
  return(sum(prob)/N)
}
insurancesim(100)


