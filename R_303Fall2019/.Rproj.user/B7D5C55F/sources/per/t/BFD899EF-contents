##### Paper 2 Table 1: Descriptives #####

# This script covers how to
# Create a grouped descriptives table

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
list.of.packages <- c("plyr", "dplyr")
new.packages <-
  list.of.packages[!(list.of.packages %in% 
                       installed.packages()[, "Package"])]
if (length(new.packages)) {
  install.packages(new.packages, 
                   repos = "http://cran.us.r-project.org")}
lapply(list.of.packages, library, character.only = TRUE)
##########

##### TABLE OF DESCRIPTIVE STATISTICS #####

# Before doing your descriptive statistics, 
# you need to limit your data to only those 
# rows that aren't missing either of your predictors.
# Analyses and ggplot do this automatically, 
# so we don't have to worry about those parts!

# change "VARIABLE1" and "VARIABLE2" to your 2 variables
babyData <- 
  babyData[!is.na(babyData$VARIABLE1) & 
             !is.na(babyData$VARIABLE2), ]

#####

# read if interested in coding!

# CODING LESSON 1: Introduction to Piping

# %>%  = a pipe
# use "control-shift-m" or "command-shift-m"
# it means "take the output of this line, 
# make it the input of the next line"

# this allows us to string together multiple commands
# in a way that is more logical to a human and 
# easier to read (as compared to logical for a computer)

# CODING 2: if you put () around an object creation
# it will also display the object created

#####

##### 2 CATEGORICAL PREDICTORS #####

# Grand Mean, SD, and N for your full dataset

# create an object for descriptives
(allDesc <- 
  # take babyData
  babyData %>% 
    # and create columns for the Mean and SD
    # of IDSPref
    summarise("Mean_IDSP" = mean(IDSPref),
              "SD_IDSP" = sd(IDSPref),
              # and number of participants
              "N" = n(),
              # create a label so we know this row
              # in your table is for ALL of the participants
              # that aren't missing your predictors
              "Group" = "All"))

# GROUPED DESCRIPTIVES #

# These are your column/row N's, means and SDs.

# Variable 1

(group1Desc <- 
  # take babyData
  babyData %>% 
    # group it by VARIABLE1
    group_by(VARIABLE1) %>% 
    # and create columns for the Mean and SD
    # of IDSPref by that grouping
    summarise("Mean_IDSP" = mean(IDSPref),
              "SD_IDSP" = sd(IDSPref),
              "N" = n(),
              "Group" = "VARIABLE1"))

# Variable 2

(group2Desc <- 
    # take babyData
    babyData %>% 
    # group it by VARIABLE2
    group_by(VARIABLE2) %>% 
    # and create columns for the Mean and SD
    # of IDSPref by that grouping
    summarise("Mean_IDSP" = mean(IDSPref),
              "SD_IDSP" = sd(IDSPref),
              "N" = n(),
              "Group" = "VARIABLE2"))

# Both Group Variables Together #

(bothGroupsDesc <- 
   # take babyData
   babyData %>% 
   # group it by VARIABLE1 & VARIABLE2
   group_by(VARIABLE1, VARIABLE2) %>% 
   # and create columns for the Mean and SD
   # of IDSPref, by that grouping
   summarise("Mean_IDSP" = round(mean(IDSPref), 2),
             "SD_IDSP" = round(sd(IDSPref), 2),
             "N" = n(),
             "Group" = "Both"))

# These are your N's, means and SDs of 
# IDSPref split by both groups.

# rbind = join these dataframes together, matching by columns
# rbind.fill = same, but input "NA" whenever the data is missing
(allDescJoin <- 
  rbind.fill(allDesc, group1Desc, group2Desc, bothGroupsDesc))


##### 1 CATEGORICAL & 1 CONTINUOUS PREDICTOR #####

# Grand Mean, SD, and N for your full dataset

# create an object for descriptives
(allDesc <- 
   # take babyData
   babyData %>% 
   # and create columns for the Mean and SD
   summarise(
     # of IDSPref
     "Mean_IDSP" = mean(IDSPref),
     "SD_IDSP" = sd(IDSPref),
     # and your CONTINUOUS VARIABLE
     "Mean_VAR2" = mean(CONT_VARIABLE),
     "SD_VAR2" = sd(CONT_VARIABLE),
     # and number of participants
     "N" = n(),
     # create a label so we know this row
     # in your table is for ALL of the participants
     # that aren't missing your predictors
     "Group" = "All"))

# GROUPED DESCRIPTIVES #

# These are your column/row N's, means and SDs.

(groupDesc <- 
    # take babyData
    babyData %>% 
    # group it by CAT_VARIABLE
    group_by(CAT_VARIABLE) %>% 
    # and create columns for the Mean and SD
    # of IDSPref by that grouping
    summarise("Mean_IDSP" = mean(IDSPref),
              "SD_IDSP" = sd(IDSPref),

              # and of CONT_VARIABLE by that grouping
              "Mean_VAR2" = mean(CONT_VARIABLE),
              "SD_VAR2" = sd(CONT_VARIABLE),
              
              # n per group
              "N" = n(),
              # group name
              "Group" = "CAT_VARIABLE"))


# These are your N's, means and SDs 
# of IDSPref & your Cont variable
# split by the categorical groups.

# rbind = join these dataframes together, matching by columns
# rbind.fill = same, but input "NA" whenever the data is missing
(allDescJoin <- 
    rbind.fill(allDesc, groupDesc))

##### SAVE YOUR TABLE #####

# now, write this Descriptives Table to a CSV so you
# can copy/paste it as a table into your paper!
write.csv(x = allDescJoin, 
          file = "allDescriptives.csv",
          row.names = FALSE)

# copy/paste this to a Table in your paper.

# You will need to:
# 1) change column names
# 2) round all numbers to 2 decimal places
# EXCEPT N!!! N is an integer
# 3) italicize NA anywhere it appears (APA format)
# 4) add a title
