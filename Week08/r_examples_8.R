library(e1071)

X <- read.csv('/Users/lvi819/Documents/MIS6357/Week06/sample_data_2.csv')
y <- read.csv('/Users/lvi819/Documents/MIS6357/Week06/sample_response_2.csv')
colnames(y) <- 'y'
y$yf <- as.factor(y$y)

train_data <- cbind(X, y)[1:80, ]
test_data <- cbind(X, y)[81:100,]

nb <- naiveBayes(yf ~ ., data = train_data)
preds <- predict(nb, test_data)

















library(neuralnet)


input_features = colnames(X)
input_features_string = paste(input_features, collapse = ' + ')
formula_string = paste('y ~', input_features_string)
formula = as.formula(formula_string)

nn <- neuralnet(formula = formula, data = train_data, hidden = c(3,5))
plot(nn)
nn_compute <- compute(nn, test_data[ , input_features])
preds <- nn_compute$net.result
table(round(preds), test_data$yf)
