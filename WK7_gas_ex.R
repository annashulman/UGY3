# Plant Physiology Y3S1 WK7 Ecological Measurement
# Anna Shulman, University of Edinburgh, Ecological and Environmental Sciences
# ashulman19@gmail.com, s1963732@ed.ac.uk
# 31 October 2021

# LIBRARIES ---- 
library(tidyverse)
library(readxl)
library(gridExtra)

# DATA IMPORT ----
# the gas exchange dataset collected during the WK0 field course
gas_ex <- read_excel("~/OneDrive - University of Edinburgh/EM Y3S1/gas_exchange_data.xlsx")
# explore data
str(gas_ex)  # tells what type of variable the columns are


# FUNCTIONS ----
# this is just a plot aesthetic, saved here bc it's a lot of code
theme.gas <- function(){
  theme_bw() +  # black and white theme
    theme(plot.title = element_text(size = 15, hjust = 0.5, vjust = 2),  # specifies title size and location
          axis.text.x = element_text(size = 10),           # x axis text size                     
          axis.text.y = element_text(size = 10),           # y axis text size
          axis.title.x = element_text(size = 12),          # x axis title text size
          axis.title.y = element_text(size = 12),          # y axis title text size
          panel.grid = element_blank(),                    # removes the grid on the plot             
          plot.margin = unit(c(1,1,1,1), units = , "cm"))  # adds 1cm margin around plot
}

# DATA MANIPULATION ----
gas_ex <- gas_ex %>%
  rename("PAR" = "PAR (µmol m-2 s-1)", 
         "NP" = "NP (µmol m-2 s-1)",
         "common_name" = "common name") %>%
  mutate(common_name = as.factor(common_name))

unique(gas_ex$common_name)

# bramble <- filter(gas_ex, common_name == "Bramble")
# hogweed <- filter(gas_ex, common_name == "Giant hogweed")
# rhododendron <- filter(gas_ex, common_name == "Rhododendron")
# oak <- filter(gas_ex, common_name == "Oak") 
# elder <- filter(gas_ex, common_name == "Elder")
# hawthorn <- filter(gas_ex, common_name == "Hawthorn")
# birch <- filter(gas_ex, common_name == "Birch")

(plot_all <- ggplot(gas_ex, aes(x = PAR, y = NP, colour = common_name)) +        # creates the x, y plot
     geom_point(size = 2) +                                                     # adds points to the plot, specifies colour and size
     geom_errorbar(aes(ymin = NP - sd(NP), ymax = NP + sd(NP))) +                # adds errorbars, +/- sd; specifies colour
     labs(x = "\nPAR (µmol m-2 s-1)", y = "NP (µmol m-2 s-1)\n") +              # title, x, y axis labels
     theme.gas()                                                              # function defined above
)







