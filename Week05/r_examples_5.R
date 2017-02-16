library(AppliedPredictiveModeling)
library(penalized)
library(glmnet)

data(solubility)


X_train <- solTrainXtrans[1:50,1:10]
X_test <- solTestXtrans[1:50,1:10]

y_train <- solTrainY[1:50]
y_test <- solTestY[1:50]

Xy_train <- X_train
Xy_train$Solubility <- y_train


ols_model <- lm(Solubility ~ ., data = Xy_train)
ols_model
summary(ols_model)
test_preds <- predict(ols_model, X_test)

ridge_model <- penalized(Solubility ~., data = Xy_train, lambda2 = 1, standardize = TRUE)
#or
ridge_model <- penalized(response = y_train, penalized = X_train, lambda2 = 1, standardize = TRUE)
ridge_model
attributes(ridge_model)
ridge_model@residuals
test_preds_ridge <- predict(ridge_model, X_test)

lasso_model <- penalized(Solubility ~., data = Xy_train, lambda1 = 1, standardize = TRUE)
lasso_model
attributes(lasso_model)
lasso_model@residuals
test_preds_lasso <- predict(lasso_model, X_test)


elastic_net_models <- glmnet(as.matrix(X_train), y_train)
print(elastic_net_models)
plot(elastic_net_models) 
coef(elastic_net_models, s=elastic_net_models$lambda[10])


