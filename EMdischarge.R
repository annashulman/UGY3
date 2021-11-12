# Stream Discharge Project, Ecological Measurement Y3S1
# Anna Shulman, EES University of Edinburgh
# 08 November 2021

# LIBRARIES ----
library(readxl)
library(tidyverse)
library(viridis)

# IMPORT DATASET ----
streamteam <- read_excel("EMdischarge.xlsx")
View(streamteam)

# DATA MANIPULATION ----
streamteam <- mutate(streamteam, Method = factor(Method, levels = c('dg', 'efm', 'sfm'), 
                                                 labels = c('DG', 'EFM', 'SFM')))
streamteam_table <- streamteam %>%
  group_by(Method) %>%
  summarise(mean_dis = mean(discharge),
            stdev = sd(discharge),
            se_dis = sd(discharge) / sqrt(length(discharge))) %>%
  ungroup()


# DATA VISUALISATION ----
# create a histogram showing the distribution of discharge values measured
(dis_hist <- ggplot(streamteam, aes(x = discharge)) +                
   geom_histogram(binwidth = 0.02, colour = "black", 
                  fill = "#DEDEDE") +                                      # Changing the binwidth and colours
   geom_vline(aes(xintercept = mean(discharge)),                           # Adding a line for mean
              colour = "black", linetype = "dashed", size = 1) +           # Changing the look of the linec("#FFFFFF", "#FFFFFF", "#FFFFFF")
   geom_vline(aes(xintercept = mean(discharge) + 0.00857),                           # Adding a line for mean
              colour = "black", linetype = "dotted", size = 1) +
   geom_vline(aes(xintercept = mean(discharge) - 0.00857),                           # Adding a line for mean
              colour = "black", linetype = "dotted", size = 1) +
   theme_bw() +                                                            # Changing the theme to get rid of the grey background
   ylab("Frequency\n") +                                                       # Changing the text of the y axis label
   xlab(expression(paste("\nDischarge (", m^3, s^-1, ")"))) +              # \n adds a blank line between axis and text
   scale_x_continuous(breaks = seq(0.01, 0.19, 0.02)) +
   theme(axis.text = element_text(size = 12),                              # Changing font size of axis labels and title
         axis.title = element_text(size = 14, face = "plain"),             # face = "plain" is the default, you can change it to italic, bold, etc. 
         panel.grid = element_blank(),                                     # Removing the grey grid lines
         plot.margin = unit(c(1,1,1,1), units = "cm")))                    # Putting a 1 cm margin around the plot

# main plot for discharge v method

(dis_plot_test <- ggplot(streamteam) + 
    geom_jitter(aes(Method, discharge, shape = Method), col = "black", size = 2) +
    geom_point(data = streamteam, aes(Method, discharge), col = "black",
               stat = "summary", fun = "mean", size = 4) + 
    geom_errorbar (data = streamteam_table, 
                   aes(x = Method,
                       ymin = (mean_dis - se_dis),
                       ymax = (mean_dis + se_dis)), col = "black", width = 0.2) +
    geom_hline(aes(yintercept = mean(discharge)),                           
               colour = "black", linetype = "dashed", size = 1) + 
    labs(x = "\nMethod of Measuring Discharge",
         y = expression(paste("\nDischarge (", m^3, s^-1, ")"))) +
    theme_bw() +
    scale_shape_manual(values = c(22, 23, 24)) +
    theme(panel.grid = element_blank(),                                    # Removing the grey grid lines
          plot.margin = unit(c(1, 1, 1, 1), units = "cm")))                # Putting a 1 cm margin around the plot
 
#geom_jitter(data = streamteam, aes(method, discharge)) +
#  guides(shape = guide_legend("Method")))

# fill values for viridis colour pallette:
# fill = c("#FDE725", "#A0DA39", "#4AC16D", "#1fa187", 
#          "#277f8e", "#365c8d", "#46327e", "#440154")

# STATS ----
shapiro.test(streamteam$discharge)
# p = 0.03607

kruskal.test(discharge ~ Method, data = streamteam)

PT = pairwise.wilcox.test(streamteam$discharge, streamteam$Method, p.adjust.method = "none")
PT




