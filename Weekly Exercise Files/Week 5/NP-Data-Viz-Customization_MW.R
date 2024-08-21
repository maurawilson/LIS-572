# National Park Data Viz — Customization Practice

# More practice visualizing National Park visitation data with ggplot

# Load the data
np_data <- read.csv("https://raw.githubusercontent.com/melaniewalsh/responsible-datasets-in-context/main/datasets/national-parks/US-National-Parks_RecreationVisits_1979-2023.csv", stringsAsFactors = FALSE)

# Load libraries
library("dplyr")
library("stringr")
library("ggplot2")
library("scales")

# How have visits to a particular National Park changed over time?
# What are the most interesting periods of change?
# What are the most interesting moments?
# Where are potential flaws or problems with the data?

# Exercise 1: First, filter the dataframe for a park of your choice
# Pick a National Park that you haven't worked with yet

my_parks_df <- np_data %>%
  filter(ParkName == "Yellowstone NP")

# Exercise 2: Now, make a line plot that shows the number of visits per year to that park from 1979 to 2023
# 2a. Choose a color for the line
# 2b. Give the plot a title that also functions as a kind of "headline" for the most interesting story of the plot
# 2c. Change the x-axis ticks so that they increase 5 years at a time
# 2d. Change the y-axis tick labels so that they abbreviate millions to M and thousands to K

# When you're finished, drop this plot into the Discord server in the channel #np-data-viz!

ggplot(data = my_parks_df) +
  geom_line(aes(
    x = Year,
    y = RecreationVisits,
  ), color = "chocolate3") +
  geom_point(aes(
    x = Year,
    y = RecreationVisits,
  ), color = "chocolate4") +
  labs(
    title = "First National Park Continues to Grow in Visitors"
  ) +
  scale_x_continuous(
    breaks = seq(1975, 2020, by = 5)
    ) +
  scale_y_continuous(
    labels = label_number(scale_cut = cut_si(NULL))
    )


# Exercise 3: Now, create a plot that zooms in on the most interesting time period for this particular National Park
# 3a. Change the x-axis limits so that it only shows the most interesting years (with maybe a buffer of a few years so it's easier to see)
# 3b. Come up with a new title that describes this period of interest

# When you're finished, drop this plot into the Discord server in the channel #np-data-viz!

ggplot(data = my_parks_df) +
  geom_line(aes(
    x = Year,
    y = RecreationVisits,
  ), color = "palegreen3") +
  geom_point(aes(
    x = Year,
    y = RecreationVisits,
  ), color = "palegreen4") +
  labs(
    title = "Why Did Visits to Yellowstone Drop In 1988?"
  ) +
  scale_x_continuous(
    limits = c(1985, 1990), 
    breaks = seq(1985, 1990, by = 1)
  ) +
  scale_y_continuous(
    labels = label_number(scale_cut = cut_si(NULL)), 
    limits = c(2000000, 3000000),
    breaks = seq(2000000, 3000000, by = 100000)
  )

# EXTRA CREDIT: What is the story behind this period of interest in the National Park visitation data?

# Like the stories included in the U.S. National Park Visitation data essay (https://melaniewalsh.github.io/responsible-datasets-in-context/posts/np-data/with-tabs.html),
# your job is do some research and find out what might have caused the period of change or interest that you've identified.
# In at least 100 words and referencing at least one outside source, write about what you believe caused the fluctuation that you identified (weather, human error, political conflict, etc.).
# Please post this story and your plot in #np-data-stories and submit to Canvas for extra credit
Your code here



