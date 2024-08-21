# SPL Data Part II

# Load the Seattle Public Library Data
# https://github.com/melaniewalsh/Neat-Datasets/raw/main/SPL-Checkouts-2018-2023-atleast15checkouts.csv
spl_data <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/raw/main/SPL-Checkouts-2018-2023-atleast15checkouts.csv", stringsAsFactors = FALSE)

# Load the dplyr library
#Load the stringr library
# install.packages("stringr")
library("stringr")
library("dplyr")
library("stringr")

############ Publication Years
# Exercise 1
# What are the most common publication dates for items in the SPL data?

# To answer this question, you can either calculate the number of records for *each publication date* or the total number of checkouts for *each publication date*

# Save your new dataframe as a variable called publication_years
publication_years<-spl_data %>% 
  count(PublicationYear)

# Rhetorical Q: What do you notice about the publication year data? What steps should we take next? Should we clean these values?


########### Publishers
# Bonus Exercise 2
# What are all the distinct publishers in the SPL data — e.g., Random House, Scholastic, etc.? 
# Save as a variable distinct_publishers
distinct_publishers<-spl_data %>% 
  distinct(Publisher)

############ Creators
# Bonus Exercise 3
# Filter the dataframe for a specific author/creator but try to capture different existing representations of their name
# Save as creator_df
creater_df<-spl_data %>% 
  filter(str_detect(Creator, "Grisham"))


############ Most Checked Out Items
# Bonus Exercise 4
# What are the most checked out items in this SPL data?
# To answer this question, you need to make a dataframe that shows how many times each individual item has been checked out
# Save your new dataframe as a variable called most_checked_out
most_checked_out<- spl_data %>% 
  group_by(Title) %>% 
  summarize(checkouts=sum(Checkouts))

