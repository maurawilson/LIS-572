# NP Data Groupby — Part 2

# Load the data
np_data <- read.csv("https://raw.githubusercontent.com/melaniewalsh/responsible-datasets-in-context/main/datasets/national-parks/US-National-Parks_RecreationVisits_1979-2023.csv", stringsAsFactors = FALSE)

# Load dplyr library
library("dplyr")

# Exercise 1: How many rows and columns are in the NP dataset?
num_rows <- np_data %>%
  summarize(rows = n())
num_cols <- np_data %>%
  summarize(columns = ncol(np_data))

# Exercise 2: How has the total number of visits to National Parks changed over time (from 1979-2023)?

# Make a dataframe of total visits per year and name the new column "total_visits"
# Save the dataframe as visits_per_year

visits_per_year <- np_data %>%
  group_by(Year) %>%
  summarize(total_visits = sum(RecreationVisits))

# For fun, let's plot total NP visits over time

# Turn off scientific notation
options(scipen = 999)

# This plot code has been filled in for you
plot( # x axis
  x = visits_per_year$Year,
  # y axis
  y = visits_per_year$total_visits,
  # Define type of plot - b is both line and scatter
  type = "b",
  # main title
  main = "NP Visits",
  # x and y labels
  xlab = "Year", ylab = "Visits"
)

# Exercise 3: What is the National Park(s) with the MOST visits in a single year?
# Save as a dataframe max_visits
# Hint: You will want to filter for the row(s) with the max number of visits
max_visits <- np_data %>%
  filter(RecreationVisits == max(RecreationVisits))

# Exercise 4: What is the National Park(s) with the LEAST visits in a single year?
# Save as a dataframe min_visits
# Hint: You will want to filter for the row with the min number of visits
min_visits <- np_data %>%
  filter(RecreationVisits == min(RecreationVisits))
