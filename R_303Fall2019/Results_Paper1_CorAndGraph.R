

# This script covers how to
# 1) Create the IDS Preference variable (IDSPref)
# 2) Run a correlation analysis
# 3) Create a scatterplot

#####

# Anywhere you see VARIABLE
# subtitute for YOUR VARIABLE

##### IMPORT DATA #####

# get our data into R
# this code creates a dataframe named babyData
# from the file ManyBabiesData.csv
babyData <- read.csv(file = "ManyBabiesData.csv",
                     na.strings = c("", NA))

##### CREATE IDS PREFERENCE #####

# before we can run any tests on Infant-Directed Speech Preference
# we need to create that variable by subtracting ADS from IDS

babyData$IDSPref <-
  babyData$looking_time_IDS - babyData$looking_time_ADS

# Need Mean and SD of IDS preference
mean(babyData$IDSPref)
sd(babyData$IDSPref)


##### BASIC CORRELATION #####

# to correlate one continuous variable with another:

# Run the function cor.test
cor.test(
  # YOUR COVARIATE as x-variable
  x = babyData$VARIABLE,
  # IDS preference as y-variable
  y = babyData$IDSPref,
  # using a two-sided test, unless you can justify
  # using a directed test like - "greater" or "less"
  alternative = "two.sided",
  # using a pearson correlation (aka, basic correlation)
  method = "pearson")

# the output of running this will show in the console
# (bottom left quadrant)
# this is ALL the info needed for the results
# use Interpret R Correlation Output.jpg
# to find where the values you need are

# Refer to HW3 instructions and Purdue website
# for APA formatting of results

##########
# RUN BELOW, BUT WILL NOT EXPLAIN
# If interested in coding, feel free to ask!
# Install and load ggplot2
list.of.packages <- c("ggplot2")
new.packages <-
  list.of.packages[!(list.of.packages %in% installed.packages()[, "Package"])]
if (length(new.packages))
  install.packages(new.packages, repos = "http://cran.us.r-project.org")
lapply(list.of.packages, library, character.only = TRUE)
##########

##### INTRO TO PACKAGES #####

# Packages are groups of functions that do a similar thing
# Ggplot is a powerful, flexible graphing package.

##### INTRO TO GGPLOT #####

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

##### BASIC SCATTERPLOT #####

# create plot object
paper1Plot <-
  # dataset
  ggplot(data = babyData,
         # aesthetics (aes) = the columns 
         # within the dataset you want to use
         # specify your x and y variables
         aes(x = VARIABLE, y = IDSPref)) +
  # add a scatterplot to show the data
  geom_point()

# view the plot
paper1Plot

# This has unprofessional labels, though, so let's change that
paper1Plot <-
  # take the plot object we already made
  paper1Plot +
  # add x-label
  xlab("YOUR VARIABLE") +
  # add y-label
  ylab("IDS Preference")

# view the plot
paper1Plot

# And add a plot title
paper1Plot <-
  # take the plot object
  paper1Plot +
  # add plot title
  ggtitle("IDS Preference and YOUR VARIABLE")

# view the plot
paper1Plot

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
paper1Plot

# much nicer!

# just for fun - color!
paper1Plot <-
  # take the plot object
  paper1Plot +
  # change the color of the points
  # any color name, all lower case
  geom_point(color = "pick a color") 

# view the plot
paper1Plot

# SAVING YOUR PLOT:
ggsave(plot = paper1Plot, 
       filename = "paper1plot.png",
       height = 3, 
       width = 4, 
       units = "in")

# plot will be in the folder THIS SCRIPT is in 
# (probably your Downloads folder)
# copy/paste or drag/drop plot into Paper 1 
# AFTER References section (APA style!)
