
# Getting info we need for the method - participants section

# total N, male/female frequencies, ethnic background 
# frequencies, mean and SD for age, parent education, 
# number of siblings, caregiver genders, multiple languages in home

##### Get Data Into RStudio #####

# this code creates a dataframe named babyData
# from the file ManyBabiesData.csv
babyData <- read.csv(file = "ManyBabiesData.csv", 
                     na.strings = c("", NA))

# a "function" is a command that does an action
# kindof like a verb

##### Number of Participants ##### 
# run the function "nrow" on the dataframe "babyData"
# how many rows (observations/participants) are in babyData?
nrow(babyData)

##### Child Genders #####

# to find a column in any dataframe, the format is
# dataframe$column
# You can use the TAB key to search
# for column names
# so the information about child gender is:
babyData$gender

# this is just a list of the data - not super useful

# How many babies of each gender do we have?
# run the function "table" on the column gender
# within the dataframe babyData
table(babyData$gender)

##### Child Ages #####

# mean and sd for age in days
mean(babyData$age_days)
sd(babyData$age_days)

##### Child Race/Ethnicity #####

# racial/ethnic background
table(babyData$race_ethn_simple)

# if you want proportions:
table(babyData$race_ethn_simple)/nrow(babyData)

##### Parent Years of Education #####

# mean & sd years of education of primary caregiver
mean(babyData$yearsEd, 
     # mean and sd will produce NA if any data is missing
     # 1 family did not fill out the demographic questionnaire
     # so we need to tell R to remove NAs:
     na.rm = TRUE)

# sd - all in 1 line, same format
sd(babyData$yearsEd, na.rm = TRUE)

##### Number of Siblings #####

# mean & sd number siblings
mean(babyData$nSibs, 
     na.rm = TRUE)

sd(babyData$nSibs, na.rm = TRUE)


##### Multiple Languages spoken in the home? #####

table(babyData$moreLang)

##### Caregiver Gender #####

table(babyData$careGender)

##### Method Section Instructions #####

# input all of the above information into the Participants
# section of your Method
# round all numbers to 2 decimal places for
# APA formatting

