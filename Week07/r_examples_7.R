library(kernlab)
library(caret)

X <- read.csv('/Users/lvi819/Documents/MIS6357/Week06/sample_data_2.csv')
y <- read.csv('/Users/lvi819/Documents/MIS6357/Week06/sample_response_2.csv')

#Can play wih kernel c('vanilladot', 'polydot', 'rbfdot') and 
# kpar c('', 'degree, scale, offset', 'sigma') list

svm_model <- ksvm(as.matrix(X[,c(8, 9)]), as.factor(y[,1]), 
                  type = 'C-svc', kernel = 'polydot',
                  kpar = list(3, 30, 0))

predict(svm_model, X[1:5, c(8, 9)])
y[1:10, ]
plot(svm_model)

########### KNN ##################
### Show example from book if you forgot #####
library(class)
train_indices <- createDataPartition(y[,1], p = .8, list = FALSE)
X_train <- X[train_indices, ]
X_test <- X[-(train_indices), ]
y_train <- y[train_indices, ]
y_test <-  y[-(train_indices), ]

knn_obj <- knn(X_train, X_test, y_train, k = 5, l = 0, prob = TRUE, use.all = TRUE)



