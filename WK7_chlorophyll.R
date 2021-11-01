# Plant Physiology Y3S1 WK7 Ecological Measurement
# Anna Shulman, University of Edinburgh, Ecological and Environmental Sciences
# ashulman19@gmail.com
# 31 October 2021

# LIBRARIES ---- 
library(tidyverse)
library(readxl)
library(gridExtra)

# DATA IMPORT ----
# the chlorophyll fluorescence dataset collected during the WK0 field course
chlorophyll <- read_excel("~/OneDrive - University of Edinburgh/EM Y3S1/Chlorophyll Fluorescence 2021.xlsx")
# explore data
str(chlorophyll)                     # tells what type of variable the columns are
length(unique(chlorophyll$Species))  # how many different species
names(chlorophyll)                   # col names

# FUNCTIONS ----
# this is just a plot aesthetic, saved here bc it's a lot of code
theme.chloro <- function(){
  theme_bw() +  # black and white theme
    theme(plot.title = element_text(size = 15, hjust = 0.5, vjust = 2),  # specifies title size and location
          axis.text.x = element_text(size = 10),           # x axis text size                     
          axis.text.y = element_text(size = 10),           # y axis text size
          axis.title.x = element_text(size = 12),          # x axis title text size
          axis.title.y = element_text(size = 12),          # y axis title text size
          panel.grid = element_blank(),                    # removes the grid on the plot             
          plot.margin = unit(c(1,1,1,1), units = , "cm"),  # adds 1cm margin around plot
          legend.position = "none")                        # removes legend
}

# DATA MANIPULATION ----
chlorophyll$Species <- as.factor(chlorophyll$Species)  # turns Species into a factor
chlorophyll <- chlorophyll %>%
  rename("PAR" = "PAR (µmol photons/m2s)",
         "ETR" = "ETR (µmol electrons/ m2s)") %>%  # renames the columns so they're easier to type
  slice_head(n = 240)  # removes the final 6 colunns bc they're weird

unique(chlorophyll$Species)

# create new dataframes for each spp in the chlorophyll dataset
betula <- filter(chlorophyll, Species == "Betula") 
bramble <- filter(chlorophyll, Species == "Bramble")
himalayan_balsam <- filter(chlorophyll, Species == "Himalyan Balsam")
hogweed <- filter(chlorophyll, Species == "Hogweed")
quercus <- filter(chlorophyll, Species == "Quercus")
rhododendron <- filter(chlorophyll, Species == "Rhodadendrum")
sambucus <- filter(chlorophyll, Species == "Sambucus")

# this code doesn't necessarily work
# it attempts to average the ETR based on PAR value (with the mean function) and also add the standard deviation
# it runs but idk how to fix it, bc it doesn't show up in the dataframe right
betula <- aggregate(betula$ETR, list(betula$PAR), 
                    FUN = function(ETR) c(mean, sd))
bramble <- aggregate(bramble$ETR, list(bramble$PAR), 
                     FUN = function(ETR) c(mean, sd))
himalayan_balsam <- aggregate(himalayan_balsam$ETR, list(himalayan_balsam$PAR), 
                              FUN = function(ETR) c(mean, sd))
hogweed <-aggregate(hogweed$ETR, list(hogweed$PAR), 
                    FUN = function(ETR) c(mean, sd))
quercus <-aggregate(quercus$ETR, list(quercus$PAR), 
                    FUN = function(ETR) c(mean, sd)
rhododendron <-aggregate(rhododendron$ETR, list(rhododendron$PAR), 
                         FUN = function(ETR) c(mn = mean, sd = sd))
sambucus <-aggregate(sambucus$ETR, list(sambucus$PAR), 
                     FUN = function(ETR) c(mn = mean, sd = sd))

# I haven't reformatted this yet (it was originally a pipe)
# just renames the columns from the aggregate function to ETR and PAR

rename(betula, "PAR" = "Group.1", "ETR" = "x")
rename(bramble, "PAR" = "Group.1", "ETR" = "x") 
rename(himalayan_balsam, "PAR" = "Group.1", "ETR" = "x")
rename(hogweed, "PAR" = "Group.1", "ETR" = "x") 
rename(quercus, "PAR" = "Group.1", "ETR" = "x") 
rename(rhododendron, "PAR" = "Group.1", "ETR" = "x") 
rename(sambucus, "PAR" = "Group.1", "ETR" = "x") 
                      
# DATA VISUALISATION ----
                    
(betula_plot <- ggplot(betula, aes(x = PAR, y = ETR)) +                     # creates the x, y plot
   geom_point(size = 2, col = "#8B2252") +                                  # adds points to the plot, specifies colour and size
   geom_errorbar(aes(ymin = ETR - sd, ymax = ETR + sd), col = "#8B2252") +  # adds errorbars, +/- sd; specifies colour
   labs(title = "Betula", x = "\nPAR (µmol photons/m2s)",                   # title, x, y axis labels
        y = "ETR (µmol electrons/ m2s)\n") +   
   theme.chloro()                                                           # function defined above
)
                    
(bramble_plot <- ggplot(bramble, aes(x = PAR, y = ETR)) +   
   geom_point(size = 2, col = "#CD3278") +
   geom_errorbar(aes(ymin = ETR - sd, ymax = ETR + sd), col = "#CD3278") + 
   labs(title = "Bramble", x = "\nPAR (µmol photons/m2s)", 
        y = "ETR (µmol electrons/ m2s)\n") +   
   theme.chloro()
)
                    
(himalayan_balsam_plot <- ggplot(himalayan_balsam, aes(x = PAR, y = ETR)) +   
   geom_point(size = 2, col = "#EE3A8C") +
   geom_errorbar(aes(ymin = ETR - sd, ymax = ETR + sd), col = "#EE3A8C") + 
   labs(title = "Himalayan Balsam", x = "\nPAR (µmol photons/m2s)", 
        y = "ETR (µmol electrons/ m2s)\n") +   
   theme.chloro()
)
                    
(hogweed_plot <- ggplot(hogweed, aes(x = PAR, y = ETR)) +   
   geom_point(size = 2, col = "#FF3E96") +
   geom_errorbar(aes(ymin = ETR - sd, ymax = ETR + sd), col = "#FF3E96") + 
   labs(title = "Betula", x = "\nPAR (µmol photons/m2s)", 
        y = "ETR (µmol electrons/ m2s)\n") +   
   theme.chloro()
)
                    
(quercus_plot <- ggplot(quercus, aes(x = PAR, y = ETR)) +   
   geom_point(size = 2, col = "#FF6EB4") +
   geom_errorbar(aes(ymin = ETR - sd, ymax = ETR + sd), col = "#FF6EB4") + 
   labs(title = "Quercus", x = "\nPAR (µmol photons/m2s)", 
        y = "ETR (µmol electrons/ m2s)\n") +   
   theme.chloro()
)
                    
(rhododendron_plot <- ggplot(rhododendron, aes(x = PAR, y = ETR)) +   
   geom_point(size = 2, col = "#FF82AB") +
   geom_errorbar(aes(ymin = ETR - sd, ymax = ETR + sd), col = "#FF82AB") + 
   labs(title = "Rhododendron", x = "\nPAR (µmol photons/m2s)", 
        y = "ETR (µmol electrons/ m2s)\n") +   
   theme.chloro()
)
                    
(sambucus_plot <- ggplot(sambucus, aes(x = PAR, y = ETR)) +   
   geom_point(size = 2, col = "#FFB5C5") +
   geom_errorbar(aes(ymin = ETR - sd, ymax = ETR + sd), col = "#FFB5C5") + 
   labs(title = "Sambucus", x = "\nPAR (µmol photons/m2s)", 
        y = "ETR (µmol electrons/ m2s)\n") +   
   theme.chloro()
)
                    
all <- grid.arrange(betula_plot, bramble_plot, himalayan_balsam_plot, 
   hogweed_plot, quercus_plot, rhododendron_plot, 
   sambucus_plot, ncol = 3)
all
                    
                    
                    
                    
                    