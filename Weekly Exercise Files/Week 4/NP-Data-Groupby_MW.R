# NP Data Groupby

# Load the data
np_data <- read.csv("https://raw.githubusercontent.com/melaniewalsh/responsible-datasets-in-context/main/datasets/national-parks/US-National-Parks_RecreationVisits_1979-2023.csv", stringsAsFactors = FALSE)

# Load dplyr library
library("dplyr")

# Exercise 1: What is the average number of visits for *each state*?
# Save as avg_state_visits and then view and sort the resulting dataframe to find the answer
avg_state_visits <- np_data %>%
  group_by(State) %>%
  summarize(avg_visit = round(mean(RecreationVisits), digits = 0))

# Play around with this dataframe and consider the following questions.
# Note: these questions are rhetorical — that is, you don't need to actually write down answers, but you can if you want to,
# and you can also write about these questions in your weekly reflection.

# Rhetorical Q: What state has the most and least average visits?
most_visits_state <- avg_state_visits %>% filter(avg_visit == max(avg_visit))
least_visits_state <- avg_state_visits %>% filter(avg_visit == min(avg_visit))
# Rhetorical Q: What patterns or surpfilter()# Rhetorical Q: What patterns or surprises do you notice?

# Exercise 2:  What is the average number of visits for *each National Park*?
# Save as avg_park_visits and then view the resulting dataframe
avg_parks_visits <- np_data %>%
  group_by(ParkName) %>%
  summarize(avg_visit = round(mean(RecreationVisits), digits = 0))

# Rhetorical Q: Which National Park has the most and least average visits?
# Rhetorical Q: What patterns or surprises do you notice?
most_visits_park <- avg_parks_visits %>% filter(avg_visit==max(avg_visit))
least_visits_park <- avg_parks_visits %>% filter(avg_visit==min(avg_visit))

# Exercise 3: How many National Parks are there in *each state*?
# Save as distinct_parks
distinct_parks <- np_data %>%
  group_by(State) %>%
  summarize(Parks = n_distinct(ParkName))

# Rhetorical Q: Which state has the most national parks?
most_parks <- distinct_parks %>% filter(Parks == max(Parks))
# Rhetorical Q: What patterns or surprises do you notice?
