setwd("D:/r_pgm/")
Data = read.csv("dataset/Microsoft_Stock.csv")
head(Data)
dim(Data)

# converting the date to date and time format
Data$Date <- as.POSIXct(Data$Date, format="%m/%d/%Y %H:%M:%S")
head(Data)

# line plot
plot(Data$Date, Data$Close, type="l", col="red", lwd=2, 
     main="Time-Series",xlab="Date",ylab="Close Price")

# "zoo" used for nice plotting
library(zoo)
WGP = zoo(Data$Close, Data$Date)
# plot is in weekly, we are converting to quarterly
WGP1 = aggregate(WGP, as.yearqtr) 

# subplots - 2 rows & 1 column
par(mfrow=c(2,1))
plot(Data$Date, Data$Close, type="l", col="red", lwd=2, 
     main="Time-Series Weekly", xlab="Date", ylab="Close Price")
plot(WGP1, type="l", col="green", lwd=2, 
     main="Time-Series Quarterly", xlab="Date", ylab="Close Price")


# bar plot
par(mfrow=c(1,1))
barplot(WGP1, xlab="Date", ylab="Close Price", col="blue",
        main="Bar Plot", border="red")


# new dataset
Data2 = read.csv("dataset/plant_growth_data.csv")
head(Data2)
dim(Data2)

unique(Data2$Soil_Type)
class(Data2$Soil_Type)
# changing "Soil_Type" from character to factor
Data2$Soil_Type = as.factor(Data2$Soil_Type)
class(Data2$Soil_Type)

levels(Data2$Soil_Type)
head(Data2)

table(Data2$Soil_Type)

# bar plot
barplot(table(Data2$Soil_Type), main="Vertical Bar Plot")
barplot(table(Data2$Soil_Type), main="Horizontal Bar Plot", horiz=T)


# displaying both plots using subplot
par(mfrow=c(1,2))
barplot(table(Data2$Soil_Type), main="Vertical Bar Plot")
barplot(table(Data2$Soil_Type), main="Horizontal Bar Plot", horiz=T)


par(mfrow=c(1,1))
# change colors to bar plot
barplot(table(Data2$Soil_Type), main="Bar Plot", 
        col=rainbow(3), xlab="Soil-Type", ylab="Frequency")
# add legend
legend("topleft", c("Clay","Loam","Sandy"),
       fill=rainbow(3), cex=0.7)


# frequency distribution
Data3 = read.csv("dataset/coffee_sales.csv")
head(Data3)

coff = cbind.data.frame(table(Data3$coffee_name))
coff
colnames(coff)[1] = "Coffee"
# relative frequency
coff$Relative_Freq = coff$Freq/sum(coff$Freq)
coff

# bar plot
barplot(coff$Relative_Freq, names.arg=coff$Coffee,
        col=c(1:8))


# pie chart
lab = paste0(round(coff$Relative_Freq*100), "%") # concat 2 strings

pie(coff$Relative_Freq, labels=lab,
    main="Coffee Names", col=rainbow(8))

legend("topright","",coff$Coffee,fill=rainbow(8),cex=0.8)


# pie chart 3d
library(plotrix)
pie3D(coff$Relative_Freq, labels=lab, col=rainbow(8), main="Pie chart 3D")


# histogram
var = sample(50:100, 10000, replace=T)
summary(var)
hist(var,xlab="Frequency", ylab="Variable", 
     col=rainbow(20), border="green", breaks=100)

# multiple historgram plots
par(mfrow=c(1,3))
hist(var,xlab="Frequency", ylab="Variable", 
     col=rainbow(20), border="green", 
     main="Histogram with 1 break", breaks=1)

hist(var,xlab="Frequency", ylab="Variable", 
     col=rainbow(20), border="green",
     main="Histogram with 10 breaks", breaks=10)

hist(var,xlab="Frequency", ylab="Variable", 
     col=rainbow(20), border="green",
     main="Histogram with 100 breaks", breaks=100)

# labelling histogram
par(mfrow=c(1,1))
h = hist(var,xlab="Frequency", ylab="Variable", 
     col=rainbow(20), border="green",
     main="Histogram with 10 breaks", breaks=10)

text(h$mids, h$counts, labels=h$counts, adj=c(0.5,-0.5))


# displaying 2 different plots in a single plot
par(mar=c(5,4,4,6) + 0.1)   # setting margin parameter

h = hist(var,xlab="Frequency", ylab="Variable", 
         col=rainbow(20), border="green",
         main="Histogram with 10 breaks", breaks=10)

par(new=T)  # new plot
plot(density(var), lwd=4, col="black", xlab="", ylab="",
     axes=F, main="")

axis(4,col="black", col.axis="black")  # adding axis to the right

mtext("Cell density", side=4, col="black",
      line=3) # adding text to the right


# New data
df <- data.frame(
  Quality_Rating = c("Good", "Very Good", "Excellent", "Total"),
  `Rs10 to 19` = c(42, 34, 2, 78),
  `Rs20 to 29` = c(40, 64, 14, 118),
  `Rs30 to 39` = c(2, 46, 28, 76),
  `Rs40 to 49` = c(0, 6, 22, 28),
  Total = c(84, 150, 66, 300)
)
df

# stacked bar plot
barplot(as.matrix(df[c(1:3),c(2:6)]),col=rainbow(3),
        border="white", xlab="Price", ylab="Number of Rest")

legend("topleft",df$Quality_Rating[1:3],
       fill=rainbow(3), cex=1)

# unstacked bar plot
barplot(as.matrix(df[c(1:3),c(2:6)]),col=rainbow(3),
        border="white", xlab="Price", ylab="Number of Rest",
        beside=T, horiz=F)

legend("topleft",df$Quality_Rating[1:3],
       fill=rainbow(3), cex=1)