setwd("D:/r_pgm")
# assignment operator
a = 5
a

b <- 6
b

8 -> c
c

# arithmetic operators
1+2
3-2
4*5
6/2
2^4

# logarithm
log(5)   # default - natural log
log(25,5)
log10(100)

# relational operators
2 == 2
3 != 6/2

a <- T
a

F -> b
b

# logical operators
a = TRUE
b = F
a & b
a | b
!b

# vector creation
v1 = c(1,2,3,4,5)
v1

v2 = 1:10
v2

head(v1)
head(v2)
tail(v2)

v3 = 3.5:10.3
v3

seq(3,10,by=0.4)

seq(0,1,length=10)

# vector manipulation
v1 = c(1,2,3,4,5)
v2 = c(3,5,2,4,1)
v1+v2
v1-v2
v1*v2

# vector element recycling
v1 = c(1,2,3,4,5,6)
v2 = c(3,5)
v2 + v1   # c(1,2,3,4,5,6) + c(3,5,3,5,3,5)

v3 = c(1,2,3,4,5,6,7)
# WARNING - perform operation only if 
# longer vector length is a multiple of shorter vector length
v3 + v2  

# vector sorting
v4 = c(41,4,24,2,65,-46,31)
sort(v4)
sort(v4,decreasing = T)

color = c("Red","blue","violet","Green")
sort(color)

# vector indexing
v5 = c(27,4,20,36,43,11,29)
v5[3]             # starting index from 1
v5[3:6]          # includes first and last index
v5[c(1,3,5)]    # display values by list of indices
v5[-2]         # display values except the specified index
v5[-c(4,6)]   # exclude values by list of indices

# data types
x = 5
class(x)  # numeric

y = c("1","2")
class(y)   # character

a = 1
b = 2
c = a > b
class(c)   # logical

st = c("Hello","world","this","is","python")
class(st)   # character
summary(st)
nchar(st)   # length of each word

v = c("M","F","M","M","F","F","M")
fac = as.factor(v)   # factor variable - to categorize values
fac
class(fac)
summary(fac)

# built-in functions
x = c(14,53,46,35,65,23,78)
mean(x)
sum(x)
length(x)
sum(x)/length(x)

# user defined function
myMean = function(y){sum(y)/length(y)}
myMean(x)

# if else
gender = c("Male","Female","Male","Male","Female","Male","Female","Female")
ifelse(gender=="Male","Yes","No")

# for loop
length(gender)
for (i in 1:length(gender)){
  ifelse(gender[i]=="Male",print("Yes"),print("No"))
}
