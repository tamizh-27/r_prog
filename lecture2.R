setwd("D:/r_pgm")
Data = read.csv("dataset/customers-1000.csv")
dim(Data)
summary(Data)
head(Data)
head(Data,3)       # display first 3 values
str(Data)         # display internal structure of the data
colnames(Data)

# change column names
colnames(Data)[1] = "S.No"
colnames(Data)[2:4] = c("CustId","Fname","Lname")
colnames(Data)

# data cleaning
x = c(0,NA,2,3,4,-0.5,-0.2)
x
x > 2   # NA is displayed

is.na(NA)
!is.na(NA)

is.na(x)  # if NA is present, it returns true

x > 2 & !is.na(x)  # NA is excluded

x == 0 | x == 2    # return true if it is 0 or 2
(x == 0 | x == 2) & !is.na(x)  # exclude NA 

is.nan(0/0)   # NAN - Not A Number

is.infinite(1/0)   # TRUE
is.infinite(0/0)  # FALSE

head(Data)
Data1 = Data   # copy of the data

# assigning some data to NA
Data1[100,5]
Data1[100,5] = NA
Data1[300,2]
Data1[300,2] = NA
Data1[400,3]
Data1[400,3] = NA

sum(is.na(Data))   # 0

sum(is.na(Data1))  # 3

all(!is.na(Data1)) # checks if all data is not NA - FALSE (means NA is present)

# replacing NA with 0
Data1[is.na(Data1)]
Data1[is.na(Data1)] = 0
sum(is.na(Data1))  # No NA is present


# data cleaning in dataframe
df = data.frame(col1=c(NA,1,2), col2=c("One",NA,"Three"))
df

# display data without NA for each column
subset(df,!is.na(col1))  # size - 2x2
subset(df,!is.na(col2))  # size - 2x2

# remove NA from dataframe
subset(df,complete.cases(df))    # method - 1
na.omit(df)                     # method - 2


# using package "car"
library(car)
colnames(Freedman)
dim(Freedman)
head(Freedman)
summary(Freedman)

median(Freedman$density)   # Output - NA
median(Freedman$density, na.rm = T)   # ignore NA

mean(Freedman$density)   # Output - NA
mean(Freedman$density, na.rm = T)   # ignore NA

# to remove NA from "Freedman" by creating a copy "Freedman.good"
Freedman.good = na.omit(Freedman)
summary(Freedman.good)

# Freedman_not_a_variable (comma should be included)
Freedman_notav = Freedman[!complete.cases(Freedman),] 
Freedman_notav  # population and density column contains NA


# using library "UsingR"
library(UsingR)

# Database - babies, Column - dwt (dad's weight)
x = babies$dwt
summary(x)   # 999 - indicates outlier
x[x==999] = NA   # replacing 999 with NA
range(x)
summary(x)
range(x,na.rm=T)


# Remove Non-unique values using "Data"
head(Data)
Data2 = Data
dim(Data)

# Adding rows 1 to 500 data from "Data2" to "Data3"
Data3 = rbind.data.frame(Data2,Data2[1:500, ])
dim(Data3)

# to remove non-unique values from "Data3"
Data4 = unique(Data3)
dim(Data4)   # dimension will be equal to dimension of "Data"


# handling rows and columns in dataframe using "iris" dataset
head(iris)
iris[,3]   # 3rd column
head(iris[,3])

head(iris[,c(3,5)])  # columns 3 and 5
head(iris[,c(3:5)])  # columns 3 to 5  (col3, col4, col5)          

head(iris[c(4:10),c(3:5)])  # rows 4 to 10 from columns 3 to 5

# Adding new columns
iris$Petal.Ratio = iris$Petal.Length/iris$Petal.Width
iris$Sepal.Ratio = iris$Sepal.Length/iris$Sepal.Width
head(iris)

# Extracting observations
iris[iris$Petal.Width>0.5 & iris$Species=="setosa",]   # method - 1
subset(iris, Petal.Width > 0.5 & Species == "setosa")  # method - 2

# Summarize observations
summary(iris)
str(iris)      # structure
brief(iris)

# summarize by creating variables
library(dplyr)
summarize(iris,
          Petal.Length.mean=mean(Petal.Length),
          Sepal.Length.mean=mean(Sepal.Length),
          Petal.Length.sd=sd(Petal.Length),
          Sepal.Length.sd=sd(Sepal.Length),
          )


# Working with dataframes
library(car)
dim(Davis)
head(Davis)

output = data.frame(matrix(nrow = dim(Davis)[1],ncol = dim(Davis)[2]))
dim(output)

head(output)

colnames(output)[1:5] = c("Gender","Wt","Ht","Repwt","Repht")
head(output)

output$Gender=Davis$sex
output$Wt=Davis$weight
output$Ht=Davis$height
output$Repwt=Davis$repwt
output$Repht=Davis$repht

head(output)
head(Davis)


# Working with factor variables
library(UsingR)
head(Cars93)

d = Cars93[1:3, 1:4]  # sample dataframe rows (1 to 3) and cols (1 to 4)
d
str(d)
summary(d)

# assigning NA values
d[3,4] = NA
d[1,1] = NA
d

# assigning values for col-2 and col-4 in row-3 
d[3, c(2,4)] = list("A3", 40)  
d  # col-2 does not change
class(d$Model)

# to rectify, we add the new value in the levels (unique values)
levels(d$Model)  # levels in "d$Model"
d$Model = droplevels(d$Model)  # drop unused levels of "d$Model"
d$Model
# add levels
levels(d$Model)
levels(d$Model) = c(levels(d$Model),"A3","A4","A5")  # default + 3 levels
levels(d$Model) # 3 extra levels are added

# assign the values again
d[3,c(2,4)] = list("A3",40)
d  # it works without showing <NA>

# adding new row
d[4,] = list("Audi","A4","Midsize",35)  # method - 1
d

d = rbind(d,list("Audi","A4","Midsize",35))  # method - 2
d

# adding new column
d[,5] = d$Min.Price*1.5   # method - 1
d
colnames(d)[5] = "modprice"
d

d$modprice = d$Min.Price*1.3   # method - 2
d

d = within(d,{modprice=Min.Price*1.2})  # method - 3
d


# long and wide dataframes
Speed.1 = c(100:105)
Speed.2 = c(200:205)
Speed.3 = c(300:305)
Speed.4 = c(400:405)
Speed.5 = c(500:505)
id = c(1:6)
Run = c("A","B","C","D","E","F")
Speed = cbind.data.frame(id,Run,Speed.1,Speed.2,Speed.3,Speed.4,Speed.5)
Speed

library(reshape2)
long = melt(Speed, id.vars = names(Speed)[1:2], variable.name = "Speed")
head(long)
head(long,10)

wide = dcast(long, id+Run ~Speed)
wide


# Merging dataframes
v1 = c("Dark Knight","Interstellar","Inception","Tenet","Dunkirk")
v2 = c(716847123,12413214,678456435,568568345,254362345)
domestic = cbind.data.frame(v1,v2)
domestic
colnames(domestic) = c("Name","Domestic")
domestic

v3 = c("Dark Knight","Insomnia","Inception","Tenet","Memento")
v4 = c(716847123,12413214,678456435,568568345,254362345)
foreign = cbind.data.frame(v3,v4)
foreign
colnames(foreign) = c("name","foreign")
foreign

Final = merge(domestic, foreign, by.x = "Name", by.y = "name")
Final

# if I want to use only "by" in "merge" function make the column names same
colnames(foreign) = c("Name","foreign")
foreign

Final = merge(domestic, foreign, by = "Name")
Final

# to display everything while merging
Final = merge(domestic, foreign, by = "Name", all = T)
Final

# to display everything in "domestic" while merging
Final = merge(domestic, foreign, by = "Name", all.x = T)
Final

# to display everything in "foreign" while merging
Final = merge(domestic, foreign, by = "Name", all.y = T)
Final