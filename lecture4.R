library(PortfolioAnalytics)
library(tidyverse)
library(patchwork)

setwd("D:/r_pgm/")
Data = read.csv("dataset/plant_growth_data.csv")
head(Data)

glimpse(Data)

# geom_point - scatter plot, geom_smooth - linear regression, lm (linear method)
p1 = ggplot(Data, aes(x=Temperature,y=Humidity)) + 
  geom_point(col="red") + geom_smooth(col="blue",method="lm") + 
  labs(title="Humidity vs Temperature", x="Temperature", y="Humidity")

p2 = ggplot(Data, aes(x=Temperature,y=Sunlight_Hours)) + 
  geom_point(col="red") + geom_smooth(col="blue",method="lm") + 
  labs(title="Temperature vs Sunlight Hours", x="Temperature", y="Sunlight Hours")

p3 = ggplot(Data, aes(x=Humidity,y=Sunlight_Hours)) + 
  geom_point(col="red") + geom_smooth(col="blue",method="lm") + 
  labs(title="Humidity vs Sunlight Hours", x="Humidity", y="Sunlight Hours")


# by patchwork library, plotting column wise
p1 + p2 + p3

# plotting row wise
p1/p2/p3


# data visualization : density plots
# using built-in dataset "construction"
# we see only one graph because only one year is present
p1 = ggplot(construction,aes(x=Northeast,color=factor(Year),fill=factor(Year))) + 
  geom_density(linewidth=1, alpha=0.5) + 
  labs(title="Northeast from 'construction'",x="",y="",col="Year",fill="Year")

p2 = ggplot(construction,aes(x=Midwest,color=factor(Year),fill=factor(Year))) + 
  geom_density(linewidth=1, alpha=0.5) + 
  labs(title="Midwest from 'construction'",x="",y="",col="Year",fill="Year")

p3 = ggplot(construction,aes(x=South,color=factor(Year),fill=factor(Year))) + 
  geom_density(linewidth=1, alpha=0.5) + 
  labs(title="South from 'construction'",x="",y="",col="Year",fill="Year")

p4 = ggplot(construction,aes(x=West,color=factor(Year),fill=factor(Year))) + 
  geom_density(linewidth=1, alpha=0.5) + 
  labs(title="West from 'construction'",x="",y="",col="Year",fill="Year")

# column-wise plot
p1 + p2 + p3 + p4 + 
  plot_annotation(title="Density Plot Yearwise",
  theme= theme(plot.title = element_text(hjust=0.5,
                                         size=20,face="bold")))

# plot time series of Microsoft_stock.csv
Data3 = read.csv("dataset/Electric_Production.csv")
head(Data3)

# to retrieve only the year
#Data2$Year = format(as.Date(Data2$DATE, format = "%m/%d/%Y"),"%Y")
#head(Data2)

ggplot(Data3, aes(x=index(DATE), y=IPG2211A2N)) +
  geom_line(col="blue") + 
  labs(title="Time series of Money", x="Date", y="")


# time series for Microsoft_Stock.csv
Data2 = read.csv("dataset/Microsoft_Stock.csv")
head(Data2)

p1 = ggplot(Data2,aes(x=index(Data2),y=Open)) +
  geom_line(col="blue") + 
  labs(title="Time series for Open", x="Open",y="")

p2 = ggplot(Data2,aes(x=index(Data2),y=High)) +
  geom_line(col="green") + 
  labs(title="Time series for High", x="High",y="")

p3 = ggplot(Data2,aes(x=index(Data2),y=Low)) +
  geom_line(col="red") + 
  labs(title="Time series for Low", x="Low",y="")

p4 = ggplot(Data2,aes(x=index(Data2),y=Close)) +
  geom_line(col="black") + 
  labs(title="Time series for Close", x="Close",y="")

p1 + p2 + p3 + p4


# data visualization using box plot
# extracting year from the date
dat = format(as.Date("1/1/1985", format="%m/%d/%Y"),"%Y")
dat

# adding year column
Data2$Year = format(as.Date(Data2$Date, format="%m/%d/%Y"),"%Y")
head(Data2)

p1 = ggplot(Data2, aes(y=Open, fill=factor(Year))) + 
  geom_boxplot() + labs(title="Boxplot for Open", fill="Year",y="")

p2 = ggplot(Data2, aes(y=High, fill=factor(Year))) + 
  geom_boxplot() + labs(title="Boxplot for High", fill="Year",y="")

p3 = ggplot(Data2, aes(y=Low, fill=factor(Year))) + 
  geom_boxplot() + labs(title="Boxplot for Low", fill="Year",y="")

p4 = ggplot(Data2, aes(y=Close, fill=factor(Year))) + 
  geom_boxplot() + labs(title="Boxplot for Close", fill="Year",y="")

p1 + p2 + p3 + p4