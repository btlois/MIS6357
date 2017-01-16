#Center Scale
x <- c(1,2,3,4,5,6,7,8,9,10)
x_cs <- scale(x, center = TRUE, scale = TRUE)
print(x_cs)
attributes(x_cs)
attr(x, 'dim')
attr(x, 'scaled:center')
attr(x, 'scaled:scale')
attr(x, 'col_name') <- 'sample'

#Box Coc
# install.packages('caret')
# install.packages('e1071')
library(caret)
x <- c(runif(1000), .1*runif(100), .2*runif(100))
ggplot() + aes(x) + geom_histogram(binwidth = .15)
bc <- BoxCoxTrans(x)
x_bc <- predict(bc, x)
ggplot() + aes(x_bc) + geom_histogram(binwidth = .1)

#PCA
x_1 <- seq(100)
x_2 <- seq(100) + runif(100)
data <- cbind(x_1, x_2)
plot_1 <- ggplot(data = as.data.frame(data)) + geom_point(mapping=aes(x=x_1, y = x_2))
PCA_obj <- prcomp(data, center = TRUE, scale = TRUE)
attributes(PCA_obj)
PCA_obj$x %*% t(PCA_obj$rotation)
t(PCA_obj$x[,1]) %*% PCA_obj$x[,2]
cor(PCA_obj$x)
percent_variance <- PCA_obj$sdev^2 / sum(PCA_obj$sdev^2)
PCA_obj$rotation
plot_1 + geom_point(data = as.data.frame(PCA_obj$x), mapping = aes(x = PC1, y = PC2), color = 'red')
ggplot() + geom_point(data = as.data.frame(PCA_obj$x), mapping = aes(x = PC1, y = PC2), color = 'red')



