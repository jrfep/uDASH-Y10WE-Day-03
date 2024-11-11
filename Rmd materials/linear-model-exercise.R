
# Cars dataset ----

?cars # this will show information about the dataset in the "help" tab
cars # this will display the data in the console output
View(cars) # this will show a spreadsheet-style view of the data
head(cars) # display the first 6 observations

# You can access one column of your dataset using the `$` symbol, like this:
cars$speed # shows the `speed` column
cars$dist # shows the `dist` column


# Graphical Analysis ----

## Scatterplot
# replace the `...` with the columns you want to plot
scatter.smooth(x=..., y=..., main="Dist ~ Speed") # scatterplot

## Boxplot to check for outliers
par(mfrow=c(1, 2)) # divide graph area in 2 columns 
# replace the `...` with the columns you want to plot
boxplot(..., 
        main="Speed", 
        sub=paste("Outlier rows: ", boxplot.stats(...)$out)) 
boxplot(..., 
        main="Distance", 
        sub=paste("Outlier rows: ", boxplot.stats(...)$out))

## Density plot for 'normality'

# install package if needed with:
## install.packages(e1071)
library(e1071) # for skewness function 

par(mfrow=c(1, 2)) # divide graph area in 2 columns 

# replace the `...` with the columns you want to plot

plot(density(...), 
     main="Density Plot: Speed", 
     ylab="Frequency", 
     sub=paste("Skewness:", round(e1071::skewness(...),3)))
polygon(density(...), col="red") 

plot(density(...), 
     main="Density Plot: Distance", 
     ylab="Frequency", 
     sub=paste("Skewness:", round(e1071::skewness(...),3)))
polygon(density(...), col="red")

# Correlation analysis ----
cor(..., ...) # calculate correlation between speed and distance

# Linear regression model ----

# here you need to replace `...` with a formula of the form:
# yvariable ~ xvariable 
# yvariable is the 'response' variable (usually in the y axis)
# and xvariable is one (or more) 'explanatory' variables. 

lm(..., data=cars)

# assing your model output to an object like this 
linearMod <- lm(..., data=cars)

# now you can use several functions to explore the model, for example:
summary(linearMod)
