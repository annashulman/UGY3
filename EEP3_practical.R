# working directory is set to UGY3

# LIBRARIES ----
library(readxl)
library(tidyverse)
library(gridExtra)

# LOAD DATASETS ----
g_11 <- read_excel("EEP3_1.1_g.xlsx")
g_11_copy <- g_11
hr_11 <- read_excel("EEP3_1.1_h_r.xlsx")
hr_11_copy <- hr_11
g_13 <- read_excel("EEP3_1.3_g.xlsx")
g_13_copy <- g_13
hr_13 <- read_excel("EEP3_1.3_h_r.xlsx")
hr_13_copy <-hr_13
g_15 <- read_excel("EEP3_1.5_g.xlsx")
hr_15 <- read_excel("EEP3_1.5_h_r.xlsx")
hr_15_copy <- hr_15

p2 <- read_excel("EEP3_2.xlsx")
p2_copy <- p2


# DATA MANIPULATION ----

g_11 <- g_11 %>%
  group_by(n_cress) %>%
  summarise(mean_g = mean(germinated),
            stdev_g = sd(germinated),
            se_g = sd(germinated) / sqrt(length(n_cress))) %>%
  ungroup()

hr_11 <- hr_11 %>%
  group_by(h_r, n_cress) %>%
  summarise(mean_length = mean(length_mm),
            stdev_length = sd(length_mm),
            se_length = sd(length_mm) / sqrt(length(n_cress))) %>%
  ungroup() %>%
  mutate(h_r = recode_factor(h_r, hypocotyl = "Hypocotyl",
                             root = "Root"),
         p_se = se_length / mean_length)

h_11_copy <- hr_11_copy %>%
  filter(h_r == "hypocotyl")

r_11_copy <- hr_11_copy %>%
  filter(h_r == "root")

g_13 <- g_13 %>%
  group_by(treatment) %>%
  summarise(mean_g = mean(n_germinated),
            stdev_g = sd(n_germinated),
            se_g = sd(n_germinated) / sqrt(length(treatment))) %>%
  ungroup()

hr_13 <- hr_13 %>%
  group_by(h_r, treatment) %>%
  summarise(mean_length = mean(length_mm),
            stdev_length = sd(length_mm),
            se_length = sd(length_mm) / sqrt(length(treatment))) %>%
  ungroup()

h_13_copy <- hr_13_copy %>%
  filter(h_r == "hypocotyl") 

r_13_copy <- hr_13_copy %>%
  filter(h_r == "root")

h_13 <- hr_13 %>%
  filter(h_r == "hypocotyl") 

r_13 <- hr_13 %>%
  filter(h_r == "root")

g_15 <- g_15 %>%
  group_by(e_zone) %>%
  summarise(mean_g = mean(n_germinated),
            stdev_g = sd(n_germinated),
            se_g = sd(n_germinated) / sqrt(length(e_zone))) %>%
  ungroup()

hr_15 <- hr_15 %>%
  group_by(h_r, e_zone) %>%
  summarise(mean_length = mean(length_mm),
            stdev_length = sd(length_mm),
            se_length = sd(length_mm) / sqrt(length(e_zone))) %>%
  ungroup()

h_15 <- hr_15 %>%
  filter(h_r == "hypocotyl")

r_15 <- hr_15 %>%
  filter(h_r == "root")

h_15_copy <- hr_15_copy %>%
  filter(h_r == "hypocotyl")

r_15_copy <- hr_15_copy %>%
  filter(h_r == "root")

# project 2
p2 <- read_excel("EEP3_2.xlsx")

p2 <- p2 %>%
  filter(drying_time != "empty_bkr") %>%
  na.omit() %>%
  mutate(drying_time = as.numeric(drying_time),
         p_w_loss = p_w_loss * 100,
         species = recode_factor(species, damp_paper = "Damp Paper", 
                                 i_kalanchoe = "Intact Kalanchoe",
                                 ivy = "Ivy",
                                 lettuce = "Lettuce",
                                 moss = "Moss",
                                 s_kalanchoe = "Stripped Kalanchoe")) %>%
  group_by(species, drying_time) %>%
  summarise(mean_loss = mean(p_w_loss),
            stdev_loss = sd(p_w_loss),
            se_loss = sd(p_w_loss) / sqrt(length(species))) %>%
  ungroup() %>%
  mutate(p_se = se_loss / mean_loss)

p2_copy <- p2_copy %>%
  filter(drying_time != "empty_bkr") %>%
  na.omit() %>%
  mutate(drying_time = as.numeric(drying_time),
         p_w_loss = p_w_loss * 100)

# 1.1 DV ----

# project 1.1 germination plot
(g_11_plot <- ggplot(g_11, aes(x = n_cress, y = mean_g)) +   # creates the initial ggplot, requires ggplot2 package                
   geom_point(size = 3, colour = "#8B3626") +  # adds points to plot, increases the point size, adds colour; colour found using colourpicker package
   geom_line(colour = "#8B3626") +             # adds line connecting data points, adds colour; colour found using colourpicker package
   geom_errorbar(data = g_11,                  # adds error bar
                 aes(x = n_cress,
                     ymin = (mean_g - se_g),
                     ymax = (mean_g + se_g)),
                 colour = "#8B3626", width = 0.2) +     # defines colour and width of error bars
  theme_bw() +                                           # removes grey background
  labs(title = NULL,                                     # removes title, adds x axis and y axis labels
       x = "\n No. of Cress Seeds", 
       y = "No. of Germinated Amaranthus Seeds\n") +     # \n adds a line of separation bw the axis and axis title
  scale_x_continuous(breaks = seq(0, 12, 3)) +
  scale_y_continuous(limits = c(7, 9.5)) +
  theme(axis.text.x = element_text(size = 10),           # axis.text and axis.title lines change font sizes of axis text and axis labels, respectively
        axis.text.y = element_text(size = 10),
        axis.title.x = element_text(size = 12),
        axis.title.y = element_text(size = 12),
        panel.grid = element_blank(),                    # removes the background grid                     
        plot.margin = unit(c(1,1,1,1), units = , "cm"),  # adds 1 cm margin around the figure
        legend.position = "none"))                       # removes the legend

lm_g_11 <- lm(germinated~n_cress, data = g_11_copy)
summary(lm_g_11)

plot(g_11$germinated~g_11$n_cress, pch = 16, col = "blue")
abline(lm_g_11)
# project 1.1 hypocotyl and root length plot

(hr_11_plot <- ggplot(hr_11, aes(x = n_cress, y = mean_length, 
                                 colour = h_r, shape = h_r)) +    # creates the initial ggplot, requires ggplot2 package                
    geom_point(size = 3) +                                   # adds points to plot, increases the point size
    geom_line() +                                            # adds line connecting data points
    geom_errorbar(data = hr_11,                              # adds error bar
                  aes(x = n_cress,
                      ymin = (mean_length - se_length),
                      ymax = (mean_length + se_length)),
                  width = 0.2) +                             # defines width of error bars
    scale_colour_manual(values = c("#CD950C", "#00868B")) +  # specifies colours for points/lines
    scale_shape_manual(values = c(15, 17)) +
    theme_bw() +                                             # removes grey background
    labs(title = NULL,                                       # removes title, adds x axis, y axis and legend labels
         x = "\n No. of Cress Seeds",
         y = "Length (mm)\n",
         col = "Amaranthus Organ",
         shape = "Amaranthus Organ") +                       # \n adds a line of separation bw the axis and axis title
    scale_x_continuous(breaks = seq(0, 12, 3)) +
    scale_y_continuous(limits = c(12, 30)) +
    theme(axis.text.x = element_text(size = 10),             # axis.text and axis.title lines change font sizes of axis text and axis labels, respectively
          axis.text.y = element_text(size = 10),
          axis.title.x = element_text(size = 12),
          axis.title.y = element_text(size = 12),
          panel.grid = element_blank(),                      # removes the background grid
          plot.margin = unit(c(1,1,1,1), units = , "cm")))   # adds 1 cm border around plot

lm_h_11 <- lm(length_mm ~ n_cress, data = h_11_copy)
summary(lm_h_11)

plot(h_11_copy$length_mm ~ h_11_copy$n_cress, pch = 16, col = "blue")
abline(lm_h_11)

lm_r_11 <- lm(length_mm ~ n_cress, data = r_11_copy)
summary(lm_r_11)

plot(h_11_copy$length_mm ~ h_11_copy$n_cress, pch = 16, col = "blue")
abline(lm_h_11)


(figure_11 <- grid.arrange(g_11_plot, hr_11_plot, ncol = 2))


# 1.3 DV ----

# project 1.3 germination bar plot
(g_13_plot <- ggplot(g_13, aes(x = treatment, y = mean_g)) +   # creates the initial ggplot, requires ggplot2 package                
   geom_bar(stat = "identity", fill = "#8B3626", colour = "black") +   # adds points to plot, increases the point size, adds colour; colour found using colourpicker package
   geom_errorbar(data = g_13,                             # adds error bar
                 aes(x = treatment,
                     ymin = (mean_g - se_g),
                     ymax = (mean_g + se_g)),
                 colour = "black", width = 0.2) +         # defines colour and width of error bars
   theme_bw() +                                           # removes grey background
   labs(title = NULL,                                     # removes title, adds x axis and y axis labels
        x = "\nTreatment",
        y = "No. of Germinated Amaranthus Seeds\n") +     # \n adds a line of separation bw the axis and axis title
   scale_y_continuous(limits = c(0, 10)) +
   theme(axis.text.x = element_text(size = 10),           # axis.text and axis.title lines change font sizes of axis text and axis labels, respectively
         axis.text.y = element_text(size = 10),
         axis.title.x = element_text(size = 12),
         axis.title.y = element_text(size = 12),
         panel.grid = element_blank(),                    # removes the background grid
         plot.margin = unit(c(1,1,1,1), units = , "cm"),  # adds 1 cm margin around the figure
         legend.position = "none"))                       # removes the legend

# project 1.3 germination anova
g_13_aov <- aov(n_germinated ~ treatment, data = g_13_copy)
anova(g_13_aov)
TukeyHSD(g_13_aov)  # the only significant difference is d-a, with p = 0.04748

# project 1.3 hypocotyl length plot
(h_13_plot <- ggplot(data = h_13, aes(x = treatment, y = mean_length)) +   # creates the initial ggplot, requires ggplot2 package                
    geom_bar(stat = "identity", fill = "#CD950C", colour = "black") +   # adds bars to plot, adds colour; colour found using colourpicker package
    geom_errorbar(data = h_13,                             # adds error bar
                  aes(x = treatment,
                      ymin = (mean_length - se_length),
                      ymax = (mean_length + se_length)),
                  colour = "black", width = 0.2) +         # defines colour and width of error bars
    theme_bw() +                                           # removes grey background
    labs(title = NULL,                                     # removes title, adds x axis and y axis labels
         x = "\nTreatment",
         y = "Hypocotyl Length (mm)\n") +     # \n adds a line of separation bw the axis and axis title
    scale_y_continuous(limits = c(0, 30)) +
    theme(axis.text.x = element_text(size = 10),           # axis.text and axis.title lines change font sizes of axis text and axis labels, respectively
          axis.text.y = element_text(size = 10),
          axis.title.x = element_text(size = 12),
          axis.title.y = element_text(size = 12),
          panel.grid = element_blank(),                    # removes the background grid
          plot.margin = unit(c(1,1,1,1), units = , "cm"),  # adds 1 cm margin around the figure
          legend.position = "none"))                       # removes the legend

# project 1.3 hypocotyl anova
h_13_aov <- aov(length_mm ~ treatment, data = h_13_copy)
anova(h_13_aov)
TukeyHSD(h_13_aov)  


# project 1.3 root length plot
(r_13_plot <- ggplot(data = r_13, aes(x = treatment, y = mean_length)) +   # creates the initial ggplot, requires ggplot2 package                
    geom_bar(stat = "identity", fill = "#00868B", colour = "black") +   # adds bars to plot, adds colour; colour found using colourpicker package
    geom_errorbar(data = r_13,                             # adds error bar
                  aes(x = treatment,
                      ymin = (mean_length - se_length),
                      ymax = (mean_length + se_length)),
                  colour = "black", width = 0.2) +         # defines colour and width of error bars
    theme_bw() +                                           # removes grey background
    labs(title = NULL,                                     # removes title, adds x axis and y axis labels
         x = "\nTreatment",
         y = "Root Length (mm)\n") +     # \n adds a line of separation bw the axis and axis title
    scale_y_continuous(limits = c(0, 30)) +
    theme(axis.text.x = element_text(size = 10),           # axis.text and axis.title lines change font sizes of axis text and axis labels, respectively
          axis.text.y = element_text(size = 10),
          axis.title.x = element_text(size = 12),
          axis.title.y = element_text(size = 12),
          panel.grid = element_blank(),                    # removes the background grid
          plot.margin = unit(c(1,1,1,1), units = , "cm"),  # adds 1 cm margin around the figure
          legend.position = "none"))                       # removes the legend

# project 1.3 root anova
r_13_aov <- aov(length_mm ~ treatment, data = r_13_copy)
anova(r_13_aov)
TukeyHSD(r_13_aov)

(figure_13 <- grid.arrange(g_13_plot, h_13_plot, r_13_plot, ncol = 3))

# 1.5 DV ----
# project 1.5 germination plot
(g_15_plot <- ggplot(g_15, aes(x = e_zone, y = mean_g)) +   # creates the initial ggplot, requires ggplot2 package                
   geom_bar(stat = "identity", fill = "#8B3626", colour = "black") +   # adds bars to plot, adds colour; colour found using colourpicker package
   geom_errorbar(data = g_15,                             # adds error bar
                 aes(x = e_zone,
                     ymin = (mean_g - se_g),
                     ymax = (mean_g + se_g)), 
                 colour = "black", width = 0.2) +         # defines colour and width of error bars
   theme_bw() +                                           # removes grey background
   labs(title = NULL,                                      # removes title, adds x axis and y axis labels
        x = "\nElectrophoresis Zone",
        y = "No. of Germinated Amaranthus Seeds\n") +     # \n adds a line of separation bw the axis and axis title
   scale_y_continuous(limits = c(0, 10)) +
   scale_x_continuous(breaks = seq(0, 10, 1)) +
   theme(axis.text.x = element_text(size = 10),           # axis.text and axis.title lines change font sizes of axis text and axis labels, respectively
         axis.text.y = element_text(size = 10),
         axis.title.x = element_text(size = 12),
         axis.title.y = element_text(size = 12),
         panel.grid = element_blank(),                    # removes the background grid
         plot.margin = unit(c(1,1,1,1), units = , "cm"),  # adds 1 cm margin around the figure
         legend.position = "none"))                       # removes the legend

# project 1.5 hypocotyl length plot
(h_15_plot <- ggplot(h_15, aes(x = e_zone, y = mean_length)) +   # creates the initial ggplot, requires ggplot2 package                
    geom_bar(stat = "identity", fill = "#CD950C", colour = "black") +   # adds bars to plot, adds colour; colour found using colourpicker package
    geom_errorbar(data = h_15,                             # adds error bar
                  aes(x = e_zone,
                      ymin = (mean_length - se_length),
                      ymax = (mean_length + se_length)), 
                  colour = "black", width = 0.2) +         # defines colour and width of error bars
    theme_bw() +                                           # removes grey background
    labs(title = NULL,                                      # removes title, adds x axis and y axis labels
         x = "\nElectrophoresis Zone",
         y = "Hypocotyl Length (mm)\n") +     # \n adds a line of separation bw the axis and axis title
    scale_y_continuous(limits = c(0, 32)) +
    scale_x_continuous(breaks = seq(0, 10, 1)) +
    theme(axis.text.x = element_text(size = 10),           # axis.text and axis.title lines change font sizes of axis text and axis labels, respectively
          axis.text.y = element_text(size = 10),
          axis.title.x = element_text(size = 12),
          axis.title.y = element_text(size = 12),
          panel.grid = element_blank(),                    # removes the background grid
          plot.margin = unit(c(1,1,1,1), units = , "cm"),  # adds 1 cm margin around the figure
          legend.position = "none"))                       # removes the legend

# project 1.5 hypocotyl anova
h_15_aov <- aov(length_mm ~ as.factor(e_zone), data = h_15_copy)  
anova(h_15_aov)
TukeyHSD(h_15_aov)  # the tukeys test requires e_zone to be a factor, not numb

# project 1.5 root length plot
(r_15_plot <- ggplot(r_15, aes(x = e_zone, y = mean_length)) +   # creates the initial ggplot, requires ggplot2 package                
    geom_bar(stat = "identity", fill = "#00868B", colour = "black") +   # adds bars to plot, adds colour; colour found using colourpicker package
    geom_errorbar(data = r_15,                             # adds error bar
                  aes(x = e_zone,
                      ymin = (mean_length - se_length),
                      ymax = (mean_length + se_length)), 
                  colour = "black", width = 0.2) +         # defines colour and width of error bars
    theme_bw() +                                           # removes grey background
    labs(title = NULL,                                      # removes title, adds x axis and y axis labels
         x = "\nElectrophoresis Zone",
         y = "Root Length (mm)\n") +     # \n adds a line of separation bw the axis and axis title
    scale_y_continuous(limits = c(0, 32)) +
    scale_x_continuous(breaks = seq(0, 10, 1)) +
    theme(axis.text.x = element_text(size = 10),           # axis.text and axis.title lines change font sizes of axis text and axis labels, respectively
          axis.text.y = element_text(size = 10),
          axis.title.x = element_text(size = 12),
          axis.title.y = element_text(size = 12),
          panel.grid = element_blank(),                    # removes the background grid
          plot.margin = unit(c(1,1,1,1), units = , "cm"),  # adds 1 cm margin around the figure
          legend.position = "none"))                       # removes the legend

# project 1.5 root anova
r_15_aov <- aov(length_mm ~ as.factor(e_zone), data = r_15_copy)  
anova(r_15_aov)
TukeyHSD(r_15_aov)  # the tukeys test requires e_zone to be a factor, not numb

(figure_15 <- grid.arrange(g_15_plot, h_15_plot, r_15_plot, ncol = 3))

# 2 DV ----

(p2_plot <- ggplot(p2, aes(x = drying_time, y = mean_loss, 
                                 colour = species, shape = species)) +    # creates the initial ggplot, requires ggplot2 package                
   geom_point(size = 3) +                                   # adds points to plot, increases the point size
   geom_line() +                                            # adds line connecting data points
   geom_errorbar(data = p2,                                 # adds error bar
                 aes(x = drying_time,
                     ymin = (mean_loss - se_loss),
                     ymax = (mean_loss + se_loss)),
                 width = 0.2) +                             # defines width of error bars
   scale_colour_manual(values = c("#8B3626","#CD4F39", "#CD6600", "#CD950C", 
                                  "#009ACD", "#00868B")) +  # specifies colours for points/lines
   scale_shape_manual(values = c(15, 16, 17, 18, 19, 20)) +
   scale_x_continuous(breaks = seq(0, 14, 1)) +
   theme_bw() +                                             # removes grey background
   labs(title = NULL,                                       # removes title, adds x axis, y axis and legend labels
        x = "\n Drying Time (days)",
        y = "Percent Water Loss",
        col = "Species",
        shape = "Species") +                       
   theme(axis.text.x = element_text(size = 10),             # axis.text and axis.title lines change font sizes of axis text and axis labels, respectively
         axis.text.y = element_text(size = 10),
         axis.title.x = element_text(size = 12),
         axis.title.y = element_text(size = 12),
         panel.grid = element_blank(),                      # removes the background grid
         plot.margin = unit(c(1,1,1,1), units = , "cm")))   # adds 1 cm border around plot

