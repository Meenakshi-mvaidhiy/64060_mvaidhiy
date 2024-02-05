##installing packages into R
install.packages("dplyr")
library(dplyr)
library(ggplot2)

##importing the dataset into R
housingData <- read.csv("./housing.csv")
## Using the head function to display a few rows and columns of the dataset housingData in R
head(housingData) 

## Descriptive statistics for quantitative variables
beds<-table(housingData$bedrooms) 
head(beds)                      
bath<-table(housingData$bathrooms)
head(bath)
stories<-table(housingData$stories)
head(stories)
mean(housingData$price)
median(housingData$price)
highestarea<-housingData$area[order(housingData$area,decreasing = TRUE)]
highestarea[1]
highestAreaTable <-housingData[order(housingData$area,decreasing = TRUE),]
highAreaInfo<-head(highestAreaTable,1) 
lowAreaInfo<-tail(highestAreaTable,1)
highAreaInfo
lowAreaInfo
park<-table(housingData$parking)
park 

## Descriptive statistics for categorical variables
num_ac<-table(housingData$airconditioning)
num_ac
num_furnishing<-table(housingData$furnishingstatus)
num_furnishing
num_hotwaterheating<-table(housingData$hotwaterheating)
num_hotwaterheating
num_mainroad<-table(housingData$mainroad)
num_mainroad
print(filter(housingData,(housingData$airconditioning== 'yes' & housingData$hotwaterheating=='yes')))

##transform of thr variable "price" by expressing the price value of the house per hundred thousand
priceperhunk<-housingData$price/100000

##plotting quantitative variable 
hist(housingData$bedrooms, main ="Number of houses with bedrooms", col= "purple", xlab = "bedrooms")
hist(housingData$parking, main ="Number of houses with parking", col = "yellow", xlab="parking")

##plotting a scatter plot
plot(housingData$price/100000,housingData$bedrooms, main="Scatter plot of price vs bedrooms", col="blue", xlab="Price", ylab="Bedrooms")
plot(housingData$area,housingData$parking, main = "Scatter plot of Area vs Parking", col="orange", xlab = "Area", ylab = "Parking")
ggplot(housingData, aes(x=hotwaterheating)) + geom_bar()


