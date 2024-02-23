##### Paper 2 Figure #####

# This script covers how to
# Create a grouped plot

##### IMPORT DATA #####

# get our data into R
# this code creates a dataframe named babyData
# from the file ManyBabiesData.csv
babyData <- 
  read.csv(file = "ManyBabiesData.csv", 
           na.strings = c("", NA))

# re-create IDSPref variable (may not be necessary for you)
babyData$IDSPref <- 
  babyData$looking_time_IDS - babyData$looking_time_ADS

##########
# RUN BELOW, BUT WILL NOT EXPLAIN
# If interested in coding, feel free to ask!
# Install and load ggplot
list.of.packages <- c("ggplot2")
new.packages <-
  list.of.packages[!(list.of.packages %in% installed.packages()[, "Package"])]
if (length(new.packages)) {
  install.packages(new.packages, repos = "http://cran.us.r-project.org")
  }
lapply(list.of.packages, library, character.only = TRUE)
##########

##### INTRO TO GGPLOT #####

# same as Paper 1 Scatterplot info

# ggplot means Grammar of Graphics Plotting
# It uses a universal language across all graphs.
# To use ggplot, you need
# 1) a dataset: Eg, babyData
# 2) aesthetics: the colums within the dataset you want to use
#     How many aesthetics you need depends upon what you are plotting.
#     examples:
#     Histogram - just 1 (eg, IDSPref)
#     Scatterplot, boxplot, line plot - 2 
#         (an X and a Y variable, eg IDSPref & Age)
#     X-Y plot with a grouping variable - at least 3 
#         (X, Y, group, eg IDSPref, Age, Gender)
# 3) Geom: The shape you want to show the data in
#     Eg, geom_boxplot, geom_point, geom_smooth (a type of line)

# These are the minimum information needed to create a graph

##### 2 CATEGORICAL PREDICTORS #####

# make sure to keep variable1
# and variable2 straight below!

# same overall format as your correlation plots
paper2Plot <- 
   ggplot(data = babyData, 
         aes(x = VARIABLE1, y = IDSPref, 
             # "color" means outline, while "fill" means center
             fill = VARIABLE2)) +
    # using geom_boxplot instead of the geom_point we used for correlations
    geom_boxplot() +
    # Change your labels and title accordingly
    xlab("VARIABLE1") +
    ylab("IDS Preference") +
    ggtitle("YOUR PLOT TITLE") +
    guides(fill = 
             guide_legend(
               # SHORT title for variable 2!
               title = "VARIABLE2"))

# view the plot
paper2Plot

# that background is unprofessional
# and the formatting is not APA

# tell R we want our plot
# to look nice
theme_set(
  # use theme_classic
  # clean, APA-style
  theme_classic() +
    # additionally, center the title
    theme(plot.title =
            element_text(hjust = 0.5)))

# view the plot
paper2Plot

##### 1 CATEGORICAL & 1 CONTINUOUS PREDICTOR #####

# same overall format as your correlation plots
paper2Plot <- 
  ggplot(data = babyData, 
         aes(x = CONT_VARIABLE, y = IDSPref, 
             # "color" means outline, while "fill" means center
             color = CAT_VARIABLE)) +
  # using geom_smooth AND geom_point
  geom_point(
    # default point size is too large
    size = 1) +
  geom_smooth(
    # method = linear model (regression)
    method = "lm",
    # don't show standard error margins
    se = FALSE,
    # default line size is too small
    size = 1.3) +
  # Change your labels and title accordingly
  xlab("CONT_VARIABLE") +
  ylab("IDS Preference") +
  ggtitle("YOUR PLOT TITLE") +
  guides(color = 
           guide_legend(
             # SHORT title for CAT_VARIABLE!
             title = "CAT_VARIABLE"))

# view the plot
paper2Plot

# that background is unprofessional
# and the formatting is not APA

# tell R we want our plot
# to look nice
theme_set(
  # use theme_classic
  # clean, APA-style
  theme_classic() +
    # additionally, center the title
    theme(plot.title =
            element_text(hjust = 0.5)))

# view the plot
paper2Plot

##### SAVE YOUR PLOT #####

ggsave(plot = paper2Plot, 
       filename = "paper2plot.png",
       height = 3, 
       width = 5, 
       units = "in")


# plot will be in the folder THIS SCRIPT is in 
# (probably your Downloads folder)
# copy/paste or drag/drop plot into Paper 1 
# AFTER References section (APA style!)
