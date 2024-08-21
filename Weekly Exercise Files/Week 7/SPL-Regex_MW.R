# SPL Data + Regular Expressions in Action

# SPL Publication Dates
# 2005 —publication date
# c. 2005 – copyright symbol
# [2005] – Printing date
# p. 2005 – phonogram copyright symbol
# 2004, c. 2005 – publication and copyright date
# 2005-2007 – intervening years
# [2005?] – Approximate date

# Load SPL data
spl_df <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/raw/main/SPL-Checkouts-2018-2023-atleast15checkouts.csv", stringsAsFactors = FALSE)

# Load dplyr and stringr
library("stringr")
library("dplyr")


# Exercise 1: Add a new column to the SPL dataframe called "clean_year"
# that includes any 4-digit year from the "PublicationYear" column

spl_df <- spl_df %>% 
  mutate(clean_year=str_extract(PublicationYear, "[0-9]{4}"))

# Exercise 2: Let's find out how many items from *each publication year* have been checked out
# Group by clean publication year, and then add up all the checkouts for each publication year

total_pub_years <- spl_df %>% 
  group_by(clean_year) %>% 
  summarize(total_checkouts=sum(Checkouts))

# Exercise 3: Add a new column to the SPL dataframe called "clean_year2"
# but only include *true* publication years from the "PublicationYear" column
# This one's hard: You may need to reference the solutions!

spl_df <- spl_df %>% 
  mutate(clean_year2 = str_extract(PublicationYear, "^[0-9]{4}$"))

# Exercise 4: Add a new column to the SPL dataframe called "clean_pub_year"
# but only include *true* publication years from the "PublicationYear" column
# This one's hard: You may need to reference the solutions!

total_pub_years2 <- spl_df %>% 
  group_by(clean_year2) %>% 
  summarize(clean_pub_year=sum(Checkouts))

# How do these results compare to one another?
#clean_year has 86 different years that it compiles for, whereas clean_year2 has 66. clean_year has only 207,269 items that do not have a *true* pub year whereas clean_year2 has a much larger 3,657,668.
