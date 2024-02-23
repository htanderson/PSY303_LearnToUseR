##### Paper 2 Table 2: ANOVA #####

# This script covers how to
# create an ANOVA results table

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
list.of.packages <- c("car", "heplots")
new.packages <-
  list.of.packages[!(list.of.packages %in% 
                       installed.packages()[, "Package"])]
if (length(new.packages)) {
  install.packages(new.packages, 
                   repos = "http://cran.us.r-project.org")}
lapply(list.of.packages, library, character.only = TRUE)
##########

##### GENERAL LINEAR MODEL #####

# Both ANOVA and Regression are covered
# by the General Linear Model

# This is the overall formula:
# dependent variable predicted by independent
# "lm" means "linear model"
# "~" means "predicted by"
# lm(dependent ~ independent1)

# "+" = add a predictor variable
# "*" = interaction between the 2 variables (automatically computes "add")

# 2 variables without interaction
# lm(dependent ~ independent1 + independent2)
# 2 variables with interaction
# lm(dependent ~ independent1 * independent2)

##### ANOVA TABLE OF YOUR LINEAR MODEL (REGRESSION/ANOVA) #####

# R automatically calculates main effects as well as
# interaction whenever * is used
# so this code shows IDS preference predicted by both
# VARIABLE1 and VARIABLE2 individually, as well as 
# the interaction between VARIABLE1 and VARIABLE2

# Order DOES NOT MATTER
# Substitute your variables for "VARIABLE1" and "VARIABLE2"
model <-
  lm(babyData$IDSPref ~ babyData$VARIABLE1 * babyData$VARIABLE2)

# create an ANOVA table object for your model:
# type = 3 refers to the sums of squares type
# more info (advanced stats):
# https://mcfromnz.wordpress.com/2011/03/02/anova-type-iiiiii-ss-explained/

# CODING: if you put () around an object creation
# it will also display the object created
(modelanova <- Anova(model, type = 3))

# notice that there are a LOT of decimal points
# for easier rounding to 2 decimal points later, use:

(modelanova <- round(modelanova, 3))
# This will round to 3 decimal places.
# You will still need to round to 2 decimal places for most rows,
# but this will make it faster


##### CALCULATING EFFECT SIZE - ETA SQUARED #####

# get eta squared & save as an object
# lets us view it at the same time
(modeleta <- etasq(model))

# Each row gives you the partial eta squared for that effect.

# again, round to 3 decimal places for easier APA formatting:
(modeleta <- round(modeleta, 3))


##### ADDING ETASQ TO ANOVA TABLE #####

# The easiest way to do this is to create a dataframe (like babyData)
# for the anova and the etasq output, then merge those 2 dataframes.
# This joins them so the rows match up.

# now we can make a new dataframe that uses "merge" to bind 
# them together by matching rownames
(anova_table <-
  merge(x = modelanova, 
        y = modeleta, 
        by = 'row.names',
        # keep original order
        # don't sort alphabetically
        sort = FALSE))

# now, write this anova_table to a CSV so you
# can copy/paste it as a table into your paper!
write.csv(x = anova_table, 
          file = "anovaTable.csv",
          row.names = FALSE)
          # the row.names that write.csv uses are NOT
          # the same ones we just used, so we want
          # row.names = FALSE so they don't save

# your ANOVA table will be in your working directory

# You will need to change:
# row names
# column names
# remove leading zeros on partial eta squared & p-values
# round all to 2 decimal places, except p-values that are <.05

