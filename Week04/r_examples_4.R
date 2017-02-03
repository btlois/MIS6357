library(AppliedPredictiveModeling)
library(ggplot2)
library(randomForest)
library(caret)

train <- quadBoundaryFunc(500)
test <- quadBoundaryFunc(100)
test$y <- ifelse(test$class == 'Class1', 1, 0)
head(train)

ggplot(data = train) + geom_point(mapping = aes(x = X1, y = X2, color = class))

rfModel <- randomForest(class ~ X1 + X2,
                        data = train,
                        ntree = 200)

?predict.randomForest

test_prob_preds <- predict(rfModel, test, type = 'prob')
head(test_prob_preds)

test_class_preds <- predict(rfModel, test, type = 'class')

test$prob_pred <- test_prob_preds[ ,'Class1']
test$class_pred <- test_class_preds

sensitivity(data = test$class_pred,
            reference = test$class,
            positive = 'Class1')

# specifity, posPredValue, negPredValue

#another option
library(ModelMetrics)
tpr(test$class, test$p_preds, cutoff = .5)
tnr(test$y, test$p_preds, cutoff = .5)

#confusion matrix
conf_mat <- table(test$class, test$class_pred)


caret::confusionMatrix(data = test$class_pred,
                reference = test$class,
                positive = 'Class1')

#ROC curve
library(pROC)

rocCurve <- roc(response = test$class,
                predictor = test$p_preds)
rocCurve_2 <- roc(response = test$class,
                  predictor = test$prob)

auc(rocCurve)
auc(rocCurve_2)

plot(rocCurve)
plot(rocCurve, legacy.axes = TRUE)
lines(rocCurve_2, col='red')

#lift curve
lift_curve <- lift(class ~ p_preds + prob, data = test)
plot(lift_curve)
