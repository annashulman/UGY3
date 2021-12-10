# LIBRARIES ----
library(readxl)
library(tidyverse)
library(gridExtra)


# LOAD DATA ----
PCE_sphagnum <- read_excel("~/Documents/DataSciEES_CC/UGY3/PCE_sphagnum.xlsx")
PCE_sphagnum_diversity <- read_excel("~/Documents/DataSciEES_CC/UGY3/PCE_sphagnum_diversity.xlsx")

# DATA MANIPULATION ----

# subsetting PCE_sphagnum into two datasets based on mesocosm
s_M1 <- PCE_sphagnum %>%
  filter(microhab %in% c("M1W", "M1SE", "M1SP"))
# M1W = mesocosm 1, water microhabitat
# M1SE = sediment microhabitat
# M1SP = sphagnum habitat, foliage

s_M2 <- PCE_sphagnum %>%
  filter(microhab %in% c("M2W", "M2SE", "M2SP"))
# M2 = mesocosm 2
     
# DATA VISUALISATION ----
(M1_rac <- ggplot(s_M1, aes(x = rank, y = log_abundance, 
                                      col = microhab, shape = microhab)) +
  geom_point(size = 2) +
  geom_line() +
  theme_classic() +
  scale_colour_manual(values = c("#00008B", "#1C86EE", "#87CEFF")) +
  scale_shape_manual(values = c(15, 16, 17)) +
  labs(x = "\nSpecies Rank",
       y = expression(paste("lo", g[10], "  Abundance")),
       col = "Microhabitat",
       shape = "Microhabitat") +
   theme(legend.position = c(0.8, 0.8)))

(M2_rac <- ggplot(s_M2, aes(x = rank, y = log_abundance, 
                            col = microhab, shape = microhab)) +
    geom_point(size = 2) +
    geom_line() +
    theme_classic() +
    scale_colour_manual(values = c("#006400", "#66CD00", "#B3EE3A")) +
    scale_shape_manual(values = c(15, 16, 17)) +
    labs(x = "\nSpecies Rank",
         y = expression(paste("lo", g[10], "  Abundance")),
         col = "Microhabitat",
         shape = "Microhabitat") +
    theme(legend.position = c(0.8, 0.8)))

M1_M2_rac <- grid.arrange(M1_rac, M2_rac, ncol = 2)  # grid.arrange() requires gridExtra package

# c("#8B2252", "#CD3278", "#FF6EB4")
# c("#228B22", "#66CD00", "#B3EE3A")
# c("#006400", "#00CD00", "#98FB98")


