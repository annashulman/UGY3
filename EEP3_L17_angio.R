# learn how to create functions in R
# use some data from the Asteraceae study to apply this function
# 22 March 2022

# LIBRARIES ----
library(tidyverse)
# FUNCTIONS ---- 
squared <- function(x){  # working with one variable, so just x in the brackets
  y = x^2                # indicates that we want to square the variable given to the function
  return(y)              # returns the squared value
}


squared(2)  # returns 4
squared(5)  # returns 25 --> essentially just sub whatever number you want for x

sepal.area <- function(L, y){
  A = pi * (L/2) * (y/2)
  return(A)
}

sepal.area(5.1, 3.5)

# LOAD DATA ----
data("iris")
head(iris)

# say you wanted to use sepal length and width information and you wanted to be 
# able to combine the two
# basically have a single parameter taking both into account

# what type of logical thinking do you need to make the two parameters one parameter?
# the area

# think of the petals as ellipses -- the area has a major axis (x1) and a minor axis (x2)
# this is the bigger width and smaller radius of the ellipse, respectively
# area = pi * x1 * x2

# DATA MANIPULATION IRIS ----
iris2 <- iris %>%
  mutate(sepalArea = pi * (Sepal.Width/2) * (Sepal.Length/2))  # this is an alternate to the function
# you can also use the mapply function
sepal_area <- mapply(sepal.area, iris$Sepal.Length, iris$Sepal.Width)
sepal_area

iris3 <- data.frame(iris, sepal_area)  # a way in base R to add the sepal_area stuff to the og dataset

# ASTERACEAE FUNCTIONS ----
# achene -- seed at the base
# pappus -- hair like the top of a dandelion
# we want to consider the volume of both (Va and Vp -- called a and p in the function)
# the bigger Va is, the heavier the fruit is
# the larger Vp, the longer it will stay in the air
# to combine these two variables: disper --> the ratio of Vp/Va

disper <- function(p, a){
  r = p/a
  return(r)
}

disper(2400,2)

# aim to produce a table, use the function with the data and incorporate that variable into a new table
species <- c("hypoM", "hypoI", "lacM", "lacI", "senM", "senI")  # M stands for mainland and I stands for island
Va <- c(1.17, 1.46, 0.79, 0.74, 0.35, 0.39)
Vp <- c(4331, 2847, 1245, 902, 906, 939)

asteraceae <- data.frame(species, Va, Vp)

asteraceae <- asteraceae %>%
  mutate(dispersal = disper(Vp, Va))


