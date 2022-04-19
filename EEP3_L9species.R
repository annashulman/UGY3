# R Based Species Discrimination Practical
# Ecology and Evolution of Plants 3 UGY3S2
# 15 Feb 2022

# LIBRARIES ----
library(datasets)
library(tidyverse)
# LOAD AND PREVIEW DATA ----
data("iris")
# the dataframe iris contains a collection of measurements for 
# sepal length and width, and petal length adn width, for the three spp of iris

head(iris, 10)  # shows first 10 rows of the data table
# four numerical variables
# one categorical variable -- the species

View(iris)
# contains 150 rows

summary(iris)
# 50 entries for each spp

# use this information to see how we can use morphological features -- sepal and petal here --
# to discriminate the three spp


# DATA MANIPULATION ----
irisSet <- subset(iris, Species == "setosa")
irisVer <- subset(iris, Species == "versicolor")
irisVir <- subset(iris, Species == "virginica")


# DATA VISUALISATION ----
# compare the distribution of the three species
par(mfrow = c(3,1))
hist(irisSet$Petal.Length, xlim = c(0,8), breaks = 10, xlab = "setosa", 
     main = "Petal Length", col = "#00688B") # setosa petal length
hist(irisVer$Petal.Length, xlim = c(0,8), breaks = 10, xlab = "versicolor", 
     main = "", col = "#00B2EE")             # versicolor petal length
hist(irisVir$Petal.Length, xlim = c(0,8), breaks = 10, xlab = "virginica", 
     main = "", col = "#8EE5EE")             # virginica petal length

par(mfrow = c(1,1))
boxplot(iris$Petal.Length ~ iris$Species, xlab = "Species", ylab = "Petal Length")


# the hollow circles shows outliers

iris_table <- iris %>%
  group_by(Species) %>%
  summarise(mean_length = mean(Petal.Length),
            stdev = sd(Petal.Length),
            se_length = sd(Petal.Length) / sqrt(length(Petal.Length))) %>%
  ungroup()

(iris_plot_petal <- ggplot(iris) + 
    geom_point(aes(Petal.Length, Petal.Width, shape = Species), col = "black", 
               size = 2) +
    labs(x = "\nSpecies",
         y = "Petal Length\n",
         shape = "Species") +
    theme_bw() +
    scale_shape_manual(values = c(1, 2, 3)) +
    theme(panel.grid = element_blank(),                                    # Removing the grey grid lines
          plot.margin = unit(c(1, 1, 1, 1), units = "cm")))                # Putting a 1 cm margin around the plot

  
plot(iris$Petal.Length, iris$Petal.Width, pch = as.numeric(iris$Species))
legend("topleft", pch = c(1,2,3), legend = c("setosa", "versicolor", "virginica"))

(iris_plot_sepal <- ggplot(iris) + 
    geom_point(aes(Sepal.Length, Sepal.Width, shape = Species), col = "black", 
               size = 2) +
    labs(x = "\nSepal Length",
         y = "Sepal Width\n",
         shape = "Species") +
    theme_bw() +
    scale_shape_manual(values = c(1, 2, 3)) +
    theme(panel.grid = element_blank(),                                    # Removing the grey grid lines
          plot.margin = unit(c(1, 1, 1, 1), units = "cm")))                # Putting a 1 cm margin around the plot

# DATA ANALYSIS ----

# Is petal length a good diagnostic character for spp identification

# null hyp = ptal length has no effect on spp, not stat diff
# alternative hyp = petal length has some effect on spp


# Student t-test to determine if there is a sig dif bw the means of two groups
# ?t.test

# t.test(x, y = NULL, alternative = c("two.sided", "less", "greater"),
#       mu = 0, paired = FALSE, var.equal = FALSE,
#       conf.level = 0.95, ...)

t.test(irisVer$Petal.Length, irisVir$Petal.Length, alternative = "two.sided", var.equal = FALSE)
# shows clearly that the two means are different bw virginica and versicolor
# p val smaller than 0.01 is highly significant
# we can reject null hypothesis and confirm the alternative hypothesis that the two samples have different means
# so they come from different populations

# we used petal length as diagnostic factor for spp id nad t test showed it can be used to differentiate spp
# but there is some overlap, so one char may not be enough
# more than one char is required for plant id

# petal length is a good one though, for differentiating the two spp

# In stats we can define the corresponding null hypothesis (H0) as folllows:
# H0: ma = mb (mean of a = mean of b), this is a two tailed test, so would ma does not equal mb
# >, < or >= and <= are one tailed

t.test(irisVer$Petal.Length, irisVir$Petal.Length, alternative = "greater", var.equal = FALSE)
# the mean of x is definitely smaller than the mean of y

