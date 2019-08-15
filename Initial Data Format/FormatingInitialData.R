library(class)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(rlang)

train <- read.csv("train.csv")

#Remove ID

train_noID <- train[,-1]
#----------------------------------------------CLEANINGDATA--------------------------------------------------------

#changing na value in garage year built to 0 in order to match integer datatype on sql import
train_noID$GarageYrBlt[is.na(train_noID$GarageYrBlt)] <- 0



#remove lotfromtage collumn since it contains mostly NA values with no indication to what this means

trainnoNA <- train_noID[,-3]

#----------------------------------------------------Clearing Outliers-----------------------------------------------

#---------------------------------------------------Lot Area---------------------------------------------------------

#view the data on a scatterplot
scatter.smooth(x=trainnoNA$LotArea, y=trainnoNA$SalePrice, main="SalePrice ~ LotArea")
boxplot(trainnoNA$LotArea)

#identify outliers and store them as a value
outliers <- boxplot(trainnoNA$LotArea, plot = FALSE)$out


trainnoNA[which(trainnoNA$LotArea %in% outliers),]
#remove these outlier rows
trainnoNA <- trainnoNA[-which(trainnoNA$LotArea %in% outliers),]


boxplot(trainnoNA$LotArea)

#----------------------------------------------------saleprice---------------------------------------------------------


scatter.smooth(x=trainnoNA$LotArea, y=trainnoNA$SalePrice, main="SalePrice ~ LotArea")

outliers <- boxplot(trainnoNA$SalePrice)$out


trainnoNA[which(trainnoNA$SalePrice %in% outliers),]

trainnoNA <- trainnoNA[-which(trainnoNA$SalePrice %in% outliers),]


boxplot(trainnoNA$house)

#------------------------------------------------------totroomsnobathrooms---------------------------------------------------------

scatter.smooth(x=trainnoNA$TotRmsAbvGrd, y=trainnoNA$SalePrice, main="SalePrice ~ LotArea")

outliers <- boxplot(trainnoNA$TotRmsAbvGrd)$out
trainnoNA[which(trainnoNA$TotalBsmtSF %in% outliers),]
trainnoNA <- trainnoNA[-which(trainnoNA$TotRmsAbvGrd %in% outliers),]

#-------------------------------------------------------garagecars-----------------------------------------------
scatter.smooth(x=trainnoNA$GarageCars, y=trainnoNA$SalePrice, main="SalePrice ~ LotArea")

outliers <- boxplot(trainnoNA$GarageCars)$out
trainnoNA[which(trainnoNA$GarageCars %in% outliers),]
trainnoNA <- trainnoNA[-which(trainnoNA$GarageCars %in% outliers),]

#-------------------------------------------------------totalbsmtsf-----------------------------------------------
scatter.smooth(x=trainnoNA$TotalBsmtSF, y=trainnoNA$SalePrice, main="SalePrice ~ LotArea")
outliers <- boxplot(trainnoNA$TotalBsmtSF)$out
trainnoNA[which(trainnoNA$TotalBsmtSF %in% outliers),]
trainnoNA <- trainnoNA[-which(trainnoNA$TotalBsmtSF %in% outliers),]

#-------------------------------------------------------------yrbuilt
scatter.smooth(x=trainnoNA$GrLivArea, y=trainnoNA$SalePrice, main="SalePrice ~ LotArea")
outliers <- boxplot(trainnoNA$YearBuilt)$out
trainnoNA[which(trainnoNA$YearBuilt %in% outliers),]
trainnoNA <- trainnoNA[-which(trainnoNA$YearBuilt %in% outliers),]

#---------------------------------------------------year remodled----------------------------------------------
#crating a new collumn of data based on the amount of time since the house has been remodeled

trainnoNA$YearsSinceRemodel <- trainnoNA$YrSold - trainnoNA$YearRemodAdd #New variable for years since last remodled

#------------------------------------------------create total bathrooms-----------------------------------------------------------------------
#since the number of toilets and bathrooms are split amongst these 4 columns, i decided it be best to combine the data, 
#all of these fields share a commonality that is they include a toilet as seen in the data guide


trainnoNA$toilets <- trainnoNA$FullBath + trainnoNA$HalfBath + trainnoNA$BsmtFullBath + trainnoNA$HalfBath

scatter.smooth(x=trainnoNA$toilets, y=trainnoNA$SalePrice, main="SalePrice ~ LotArea")



#------------------------------------------------test-Linear Regression ---------------------------------------------------------------------

#splitting data into train, test and actual

train <- trainnoNA[1:824,]
test <- trainnoNA[825:1252,-79]
test_price <- unlist(trainnoNA[825:1252,79])

model <- lm(formula = SalePrice ~ GrLivArea * TotalBsmtSF + Neighborhood + LotArea + OverallQual + toilets + TotRmsAbvGrd + GarageCars + YearsSinceRemodel , data=trainnoNA)

summary(model, raw=TRUE)

predictions <- predict(model, test, se.fit=TRUE)

#viewing how these prices  compare to actual on a simple plot

plot(density(test_price))
lines(density(predictions$fit), col = "Red")


rmse <- function(predicted,test_price){
  error = predicted - test_price
  return(sqrt(mean(error*error)))
}

rmse <- rmse(predictions$fit, test_price)

mean(test_price)
mean(predictions$fit)

rmse

write.csv(trainnoNA, file = "iowadata.csv")

