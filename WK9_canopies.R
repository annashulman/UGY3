# libraries ----
library(readxl)
library(tidyverse)

# import ----
canopies <- read_excel("~/Documents/DataSciEES_CC/UGY3/EMcanopies.xlsx")
View(canopies)
# data manip ----
canopies <- canopies %>%
  rename(
    "method" = "Method (LAI-2000 or PI)",
    "LAI_value" = "LAI-Value")

# data visualisation ----
(LAIveg <- ggplot(canopies) + 
   geom_jitter(aes(Site, LAI_value, col = method), size = 2, width = 0.25) +
   geom_point(data = canopies, aes(Site, LAI_value), col = "black",
              stat = "summary", fun = "mean", size = 4) + 
   geom_hline(aes(yintercept = mean(LAI_value)),                           
              colour = "black", linetype = "dashed", size = 1) + 
   labs(x = "\nVegetation Type",
        y = "LAI Value") +
   theme_bw()) 
 