library(mlbench)
library(corrplot)
library(caret)

data(Glass)
glass_cor <- cor(Glass[,1:9])
corrplot(glass_cor)

data(Soybean)


data(BloodBrain)
