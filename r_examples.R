x <- c(1,2,3,4,5,6,7,8,9,10)
x_cs <- scale(x, center = TRUE, scale = TRUE)
print(x_cs)
attributes(x_cs)
attr(x, 'dim')
attr(x, 'scaled:center')
attr(x, 'scaled:scale')
attr(x, 'col_name') <- 'sample'

# install.packages('caret')
# install.packages('e1071')
library(caret)
x <- c(runif(1000), .1*runif(100), .2*runif(100))
ggplot() + aes(x) + geom_histogram(binwidth = .15)
bc <- BoxCoxTrans(x)
x_bc <- predict(bc, x)
ggplot() + aes(x_bc) + geom_histogram(binwidth = .1)



