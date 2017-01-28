library(AppliedPredictiveModeling)
library(caret)
library(plyr)

x <- as.data.frame(array(c('red','red','blue', 'red', 'blue', 'blue','small','large','med', 'med', 'med', 'large'), dim = c(6,2)))
colnames(x) <- c('color', 'size')

for (col in colnames(x)){
  for (level in levels(x[[col]])){
    col_name <- paste(col, level, 'dummy', sep = '_')
    x[[col_name]] <- x[[col]] == level
  }
}

#or
for (level in levels(x$color)){
  col_name <- paste('color', level, sep = '_')
  x[[col_name]] <- ifelse(x$color == level, 1, 0)
}

#encode small, med, large as 1,2,3
levels(x$size)
map <- c(3, 2, 1)
x[['size_int']] <- map[x$size]



#Data splitting
data(twoClassData)

head(predictors)
table(classes)
n <- length(classes)

ggplot(data=predictors) + geom_point(mapping=aes(x=PredictorA, y=PredictorB))
pc <- prcomp(predictors)


training_indices <- createDataPartition(classes, p = .8, list = FALSE)
ggplot(data=as.data.frame(pc$x)) + geom_point(mapping=aes(x=PC1, y=PC2))

scaled_stdev <- as.data.frame(cbind(pc$sdev / sum(pc$sdev), 1:length(pc$sdev)))
colnames(scaled_stdev) <- c('frac_variance', 'num_pcs')
ggplot(data=scaled_stdev) + geom_point(mapping=aes(x=num_pcs, y=frac_variance))

# Be careful  predictors[training_indices]
train_predictors <- predictors[training_indices,]
train_classes <- classes[training_indices]

test_predictors <- predictors[-training_indices,]
test_classes <- classes[-training_indices]

createFolds(classes, k = 10, list = FALSE)
createFolds(classes, k = 10, list = TRUE)
createFolds(classes, k = 10, list = TRUE, returnTrain = TRUE)

repeated_k_fold = list()
for (i in 1:5){
  repeated_k_fold[[i]] <- createFolds(classes, k = 10, list = TRUE)
}


bootstrap <- createResample(classes, times = 2)
classes[bootstrap$Resample1]

classes[-bootstrap$Resample1]
#OR
in_sample <- 1:n %in% bootstrap$Resample1
not_in_sample <- !(in_sample)
indices_not_in_sample <- seq(n)[not_in_sample]





