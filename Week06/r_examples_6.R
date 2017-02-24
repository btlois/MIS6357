library(glmnet)
library(corrplot)

X <- read.csv('/Users/lvi819/Documents/MIS6357/Week06/sample_data.csv')
y <- read.csv('/Users/lvi819/Documents/MIS6357/Week06/sample_response.csv')
colnames(y) <- 'y'
Xy <- cbind(X,y)


logistic_model <- glm(y ~ ., data=Xy, family=binomial())
summary(logistic_model)

corrplot(cor(Xy))

Xy <- Xy[ , !(colnames(Xy) %in% c('X3', 'X4', 'X6', 'X12', 'X13', 'X14', 'X16'))]

logistic_model <- glm(y ~ ., data=Xy, family=binomial())
summary(logistic_model)



library(e1071)
X <- read.csv('/Users/lvi819/Documents/MIS6357/Week06/sample_data_2.csv')
y <- read.csv('/Users/lvi819/Documents/MIS6357/Week06/sample_response_2.csv')

svm_model <- svm(X, as.factor(y[,1]), kernel = 'linear')




