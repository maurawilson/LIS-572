## Exploring Books in Translation

# Load libraries
library(dplyr)
library(ggplot2)
install.packages(plotly)
library(plotly)

## Exercise 1: Load the Publisher's Weekly Translation dataset from the URL below and save it to a variable called `pw_df`
# https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/PW-Translation-2022-11-01.csv

pw_df <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/PW-Translation-2022-11-01.csv")

## Take a moment to view and inspect the data
## Try to find a book that you are familiar with


## Exercise 2: How many books from each country had works translated into English since 2008?
# Make a dataframe with the total number of books published from each country
# Hint: there is one row, or record, for each book in the dataset, so you will want to count the number of records/rows for each country...
# Save as books_per_country
Your code here

## Exercise 3: 
## Slice the dataframe books_per_country for only the top 10 countries with the most books
# Save as top_10_countries
Your code here


## Exercise 4: Make an *interactive* bar plot of the 10 countries translated into English 
# Bonus: customize the interactive tooltip in some way
Your code here


