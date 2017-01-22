#1
#a
is_prime <- function(n){
  if (n == 1){
    return(FALSE)
  }
  if (n == 2){
    return(TRUE)
  }
  for (i in 2:(n-1)){
    if (n %% i == 0){
      return(FALSE)
    }
  }
  return(TRUE)
}

#b
nth_prime <- function(n){
  primes <- c()
  i <- 2
  while (length(primes) < n){
    if (is_prime(i)){
      primes <- c(primes, i)
    }
    i <- i + 1
  }
  return(primes[length(primes)])
}

#c
sapply(seq(20), nth_prime)

#2
x <- c(91, NA, 90, 7, 67, NA, 87, 36, 2, 93, 27, 16)
x <- x[!is.na(x)]
x[c(1, 3, 8)]
x[x > 50]
x[x %% 2 == 1]

#3 abc
ggplot(data = mtcars) + geom_point(mapping = aes(x = disp, y = mpg)) +
  geom_abline(slope = 0, intercept = median(mtcars$mpg)) +
  geom_vline(xintercept = median(mtcars$disp))
#d
ggplot(data = mtcars) + geom_boxplot(mapping = aes(x = cyl, y = qsec, group = cyl))
?geom_boxplot

#4
#a
# Suppose someone wants to gamble on the outcome of sporting events.
# He buils a model to predict the winner and score of each game.
# In this case all the modeler cares about is the predictions.
# If the predictions are good he will win money.

#b
# Suppose a data scientist is working for a sports team and builds a model
# to predict the winner and score of his team's games.
# Here the model is only useful if there is some insight gained
# that can improve the team's chance of winning.








