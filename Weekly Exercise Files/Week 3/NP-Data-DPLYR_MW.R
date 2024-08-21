# Exploring National Park data with a new tool, "dplyr"

# Load National Park Visitation data
np_data <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/1979-2020-National-Park-Visits-By-State.csv", stringsAsFactors = FALSE)

# View the np_data dataframe by clicking on the spreadsheet icon in the Global Environment

# Install tidyverse
install.packages("tidyverse")

# Load dplyr library
library(dplyr)


# Exercise 1
# Select 2 columns from the data using a DPLYR function
# Save this 2-column dataframe to the variable smaller_df
# Make sure to use the pipe %>% operator!
smaller_df <- np_data %>% select(ParkName, RecreationVisits)

# Question 1: How have the total number of visits to National Parks changed from 1979 to 2020? Were there more total visits in 2020 than 1979? What do you think?

# Exercise 2
# To find out, first filter the dataframe for only values from the year 1979, and then calculate the sum total visits for that year
# Save this to a variable called visits_1979
# You will need to use the pipe %>% operator and multiple dplyr functions!
visits_1979 <- np_data %>%
  filter(Year == 1979) %>%
  summarize(sum(RecreationVisits))

# Exercise 3
# Next, filter the dataframe for only values from the year 2020, and then calculate the sum total visits for that year
# Save to a variable called visits_2020
# You will need to use the pipe %>% operator and multiple dplyr functions!
visits_2020 <- np_data %>%
  filter(Year == 2020) %>%
  summarize(sum(RecreationVisits))

# Exercise 4
# Now subtract visits_1979 from visits_2020
visits_diff <- visits_2020 - visits_1979

# Question 2: How have the total number of National *Parks* changed from 1979 to 2020? Are there more parks or fewer parks in 2020?

# Exercise 5
# First, filter the dataframe for only values from the year 1979, and then calculate the number of distinct parks for that year
# Save to a variable called parks_1979
# You will need to use the pipe %>% operator and multiple dplyr functions!
parks_1979 <- np_data %>%
  filter(Year == 1979) %>%
  summarize(n_distinct(ParkName))

# Exercise 6
# First, filter the dataframe for only values from the year 2020, and then calculate the number of distinct parks for that year
# Save to a variable called parks_2020
# You will need to use the pipe %>% operator and multiple dplyr functions!
parks_2020 <- np_data %>%
  filter(Year == 2020) %>%
  summarize(n_distinct(ParkName))

# Exercise 7
# Now subtract parks_1979 from parks_2020
parks_diff <- parks_2020 - parks_1979

# Bonus: Exercise 8
# See if you can filter the dataframe to find the national parks with the minimum number of visits in the entire dataset
# Save to a variable called min_parks
# Explore min_parks
# Why do you think these parks have these values?
min_parks <- np_data %>% filter(RecreationVisits == min(RecreationVisits))
