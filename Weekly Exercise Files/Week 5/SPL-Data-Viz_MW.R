# SPL Data Viz

# Visualizing the SPL's circulation data with ggplot

# Load the data
# "https://github.com/melaniewalsh/Neat-Datasets/raw/main/SPL-Checkouts-2018-2023-atleast15checkouts.csv"

spl_df <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/raw/main/SPL-Checkouts-2018-2023-atleast15checkouts.csv", stringsAsFactors = FALSE)

# Exercise 1: Calculate the total number of SPL checkouts per year with dplyr functions
# Hint: the category that you need to group by is often preceded by the word "each" or "per" 
# Save as checkouts_per_year
checkouts_per_year <- spl_df %>%
  group_by(CheckoutYear) %>%
  summarize(total_checkouts = sum(Checkouts))

# Plot with default R function
plot(checkouts_per_year, type = 'b')

# Load ggplot2 library
# install.packages("ggplot2")
library("ggplot2")

# Exercise 2: Plot "checkouts_per_year" with ggplot functions
# Make a purple line plot of checkouts (or another color)
ggplot(data = checkouts_per_year) +
  geom_line(mapping = aes(x = CheckoutYear, y = total_checkouts), color = "purple")


# Exercise 3: Calculate the total number of SPL checkouts per year per "material type"
# Hint: you'll need to group by multiple columns!
# Save as checkouts_per_year_type
checkouts_per_year_type<-spl_df %>% 
  group_by(MaterialType, CheckoutYear) %>% 
  summarize(total_checkouts=sum(Checkouts))

# Filter for only specific values (code already filled in for you)
checkouts_per_year_type <- checkouts_per_year_type %>% filter(MaterialType %in% c("AUDIOBOOK", "BOOK", "EBOOK"))

# Turn off scientific notation for y axis
options(scipen=999)

# Exercise 4: Plot checkouts_per_year_type as a line plot with ggplot and make the color of each line correspond to its material type
ggplot(data = checkouts_per_year_type) +
  geom_line(aes(x = CheckoutYear, 
                y = total_checkouts, 
                color = MaterialType)) +
  geom_point(aes(x = CheckoutYear, 
                y = total_checkouts, 
                color = MaterialType))

# Exercise 5: Add a title, subtitle, and custom x,y axis labels to this plot
# Add a caption that explains the most salient pattern(s) in the plot
ggplot(data = checkouts_per_year_type) +
  geom_line(aes(
    x = CheckoutYear,
    y = total_checkouts,
    color = MaterialType
  )) +
  geom_point(aes(
    x = CheckoutYear,
    y = total_checkouts,
    color = MaterialType
  )) +
  labs(
    title = "Checkouts for Select Materials at Seattle Public Library",
    subtitle = "2018-2023",
    caption = "Major decrease in print materials due to Covid-19 in 2020",
    x = "Year",
    y = "Number of Checkouts"
  )

# Exercise 6: Change the color scheme of this plot
# Choose one of the color schemes featured in the website below:
# https://r-graph-gallery.com/38-rcolorbrewers-palettes.html
ggplot(data = checkouts_per_year_type) +
  geom_line(aes(
    x = CheckoutYear,
    y = total_checkouts,
    color = MaterialType
  )) +
  geom_point(aes(
    x = CheckoutYear,
    y = total_checkouts,
    color = MaterialType
  )) +
  labs(
    title = "Checkouts for Select Materials at Seattle Public Library",
    subtitle = "2018-2023",
    caption = "Major decrease in print materials due to Covid-19 in 2020",
    x = "Year",
    y = "Number of Checkouts"
  ) +
  scale_color_brewer(palette = "Accent")


# EXTRA CREDIT: How did SPL checkouts fluctuate over time for a particular author, title, or titles of your choice?

# First, find the total number of SPL checkouts per year for an author or title of your choice
# Then visualize it as a line plot with a custom title, x/y axis labels, and a brief caption
# Craft the title and caption so that it communicates what's going on clearly and in an attention-grabbing way
# When you're finished, post the image on Discord in #spl-extra-credit and submit to Canvas 
rf_kuang_per_year <- spl_df %>%
  filter(Creator == "R. F. Kuang") %>%
  group_by(CheckoutYear) %>%
  summarize(total_checkouts = sum(Checkouts))

ggplot(data = rf_kuang_per_year) +
  geom_line(aes(
    x = CheckoutYear,
    y = total_checkouts,
  ), color = "pink") +
  geom_point(aes(
    x = CheckoutYear,
    y = total_checkouts
  ), color = "purple") +
  labs(
    title = "Total Checkouts for Items by R.F. Kuang",
    x = "Checkouts",
    y = "Year",
    caption = "People are coming to their senses about how great an author R.F. Kuang is!", 
  )

