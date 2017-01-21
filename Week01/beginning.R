#Assignment
x <- 5
y <- 6
z <- NA #not available

#Arithmetic
x + y
x - y
x * y
x / y
x ** y 
x ^ y
y %% x

#Basic data types
##Vectors
x <- c(1,2,3,4,5,6)

double_it <- function(x){
  return(x*2)
}
y <- sapply(x, double_it) #indexing
y <- 2*x

n <- 100
x <- seq(n)
y <- 2*x + rnorm(n, mean = 0, sd = 30)

plot(x,y)

simple_model <- lm(y~x)
summary(simple_model)
abline(simple_model[['coefficients']])

##Arrays
x <- seq(n)
X_2 <- array(x, dim = c(10,10)) #indexing: nothing means everything
X_3 <- array(x, dim = c(25,2,2))
X_4 <- array(x, dim = c(5,5,2,2))

##Matrices
is.matrix(X_2)
apply(X_2, 1, mean)
apply(X_2, 2, mean)

##Data frames
col_1 <- c(1,2,3,4,5)
col_2 <- c('one','two','three','four','five')
A <- array(c(col_1, col_2), dim = c(5,2))
mean(A[,1])

DF <- data.frame(col_1,col_2)
mean(DF$col_1)

install.packages('datasets')
library(datasets)
mtcars

nrow(mtcars)

ncol(mtcars)

summary(mtcars)

for (var in colnames(mtcars)){
  plot(mtcars[,var], main=var)
}
var_types <- c('continuous', 'discrete', 'continuous', 'continuous', 'continuous', 'continuous', 'continuous', 'factor_like', 'factor_like', 'discrete', 'discrete')

install.packages('corrplot')
library(corrplot)

C <- cor(mtcars[,!names(mtcars) %in% c("vs_factor", "am_factor")])
corrplot(C, method='pie')

mtcars$vs_factor <- factor(mtcars$vs, levels=c(0,1), labels=c('V','Straight'))
plot(mtcars$mpg ~ mtcars$vs_factor)

mtcars$am_factor <- factor(mtcars$am, levels=c(0,1), labels=c('Automatic', 'Manual'))
plot(mtcars$mpg ~ mtcars$am_factor)

var_types <- c(var_types, 'factor', 'factor')

table(mtcars$vs_factor, mtcars$am_factor)

#Clustering
plot(mtcars$disp, mtcars$wt)
clusters <- kmeans(mtcars[,c(3,6)], 3)
points(clusters[['centers']][,c(1,2)],col='black',pch=19)
points(mtcars[clusters[['cluster']]==1,c(3,6)],col='red', pch=19)
points(mtcars[clusters[['cluster']]==2,c(3,6)],col='green', pch=19)
points(mtcars[clusters[['cluster']]==3,c(3,6)],col='blue', pch=19)
points(clusters[['centers']],pch=19)

#PCA
X <- array(c(0,1,2,1,0,0,1,1,2), dim = c(3,3))
pcX <- prcomp(X)
pcX[['x']] %*% t(pcX[['rotation']])

colmeans_X <- apply(X, 2, mean)
colmeans_X_mat <- matrix(rep(colmeans_X,each=3),nrow=3, ncol=3)

pcX[['x']] %*% t(pcX[['rotation']]) + colmeans_X_mat

continuous_cols <- colnames(mtcars)[var_types=='continuous']
pca_cols <- continuous_cols[!continuous_cols %in% c('mpg')]
pca <- prcomp(mtcars[, pca_cols], center = TRUE, scale. = TRUE)
mtcars_pca = cbind(mtcars, pca[['x']])
solve(pca[['rotation']])


#Build a model
mpg_model <- lm(mpg ~ ., data=mtcars)

for (var in colnames(mtcars)){
  plot(mtcars[,var], mtcars$mpg, main=var)
}

plot(mtcars$mpg ~ as.factor(mtcars$cyl))

mpg_model_2 <- lm(mpg ~ cyl + disp + hp + wt + qsec + vs, data=mtcars)

plot(mtcars$wt ~ as.factor(mtcars$cyl))

mpg_model_3 <- lm(mpg ~ wt, data=mtcars)

plot(mtcars$mpg, mpg_model_3[['residuals']])

plot(mtcars$wt, mtcars$mpg)
abline(mpg_model_3[['coefficients']])

plot(mtcars$wt, mtcars$mpg, xlim=c(0,6), ylim=c(0,40))
abline(mpg_model_3[['coefficients']])
#not terrible, but I'm looking for a better model

mpg_model_4 <- lm(mpg ~ wt + drat, data=mtcars)
plot(mtcars$mpg, mpg_model_4[['residuals']])
abline(h=0)
abline(v=25)

mpg_model_5 <- lm(mpg ~ PC1, data=mtcars_pca)

mpg_model_6 <- lm(mpg ~ PC1 + PC2, data=mtcars_pca)

library(utils)

history(max.show=Inf)
