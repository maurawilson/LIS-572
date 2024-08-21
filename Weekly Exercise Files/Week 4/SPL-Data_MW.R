# SPL Data — Queering the Catalog

# Load the Seattle Public Library Data
# https://github.com/melaniewalsh/Neat-Datasets/raw/main/SPL-Checkouts-2018-2023-atleast15checkouts.csv
spl_data <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/raw/main/SPL-Checkouts-2018-2023-atleast15checkouts.csv", stringsAsFactors = FALSE)

# Load the dplyr library
# Load the tidyverse library
library("dplyr")
library("tidyverse")
# Load the stringr library
# install.packages("stringr")
library("stringr")

# Exercise 1: First, filter for all of the Lord of the Rings books and save to a variable.
lor_titles <- spl_data %>%
  filter(str_detect(Title, "Lord of the Rings"))

# Now search for a title or a series that you are interested in!

filtered_titles <- spl_data %>%
  filter(str_detect(Title, "City of Brass"))

##### Subject Headings

# How has the Seattle Public Library handled changes in LOC Subject Headings?

# Exercise 2: Filter for all books that include a certain term (e.g. "aliens") in the Subject Heading
term1_subjects <- spl_data %>%
  filter(str_detect(Subjects, "LGBTQ"))

# Exercise 3: Filter for all books that include another term that you want to compare to term 1 (e.g. "noncitizens") in the Subject Heading
term2_subjects <- spl_data %>%
  filter(str_detect(Subjects, "Queer"))

# How often does each subject heading show up in the most checked out SPL items from 2018-2023?

# Exercise 4: To answer this question, we will group the term1_subjects and term2_subjects by checkout year, and then count how many total records contained the term each year

# Most of the code is filled in for you. You just need to plug in the correct column heading

term1_subjects_df <- term1_subjects %>%
  # Group by year
  group_by(CheckoutYear) %>%
  # Count total records per year
  summarize(num_records = n())

term2_subjects_df <- term2_subjects %>%
  # Group by year
  group_by(CheckoutYear) %>%
  # Count total records per year
  summarize(num_records = n())

# For fun, let's plot the number of records with the terms over time with the built-in plot() function

plot( # x axis
  x = term1_subjects_df$CheckoutYear,
  # y axis
  y = term1_subjects_df$num_records,
  # Define type of plot - b is both line and scatter
  type = "b",
  # main title
  main = "SPL Subject Headings with the Term X",
  # x and y labels
  xlab = "Year", ylab = "Records"
)


# What additional work might we need to do to analyze Subject Headings?

# Bonus Material

# Reformat the SPL data so that you can plot the total number of checkouts for any title(s) over time

# Group the Lord of the Rings titles by year, then calculate the sum total of the checkouts per year (and save as a column called "lor_checkouts")

lor_checkouts <- lor_titles %>%
  group_by(CheckoutYear) %>%
  summarize(total_checkouts = sum(Checkouts))

# Once you've done this correctly, you should be able to run the code to make a plot of checkouts over time

# Make a plot
plot(
  x = lor_checkouts$CheckoutYear,
  y = lor_checkouts$total_checkouts,
  type = "b"
)

# To plot the number of checkouts for a different set of titles over time, filter the SPL data for a different title

filtered_checkouts <- filtered_titles %>%
  group_by(CheckoutYear) %>%
  summarize(total_checkouts = sum(Checkouts))


# Make a plot
plot(
  x = filtered_checkouts$CheckoutYear,
  y = filtered_checkouts$total_checkouts,
  type = "b"
)

# You can use a tidyverse function separate_rows() to split a column with multiple items into individual rows with each item. Check it out!
spl_data_subjects <- spl_data %>% separate_rows(Subjects, sep = ",")
