##############################################################################
## Assignment 1: Intro to R

## Please write your code/responses in the places marked "Your code/response here"

## This assignment draws on real Seattle Public Library circulation data for Emily St. John Mandel's novel Station Eleven in the year 2020.
## You are going to manipulate this real checkout data to explore different trends.
## For context, in March 2020, the WHO declared COVID-19 a pandemic, and this novel is a story about a fictional pandemic.

## To explore the circulation data for yourself, see https://data.seattle.gov/Community/Checkouts-by-Title/tmmm-ytt6/data
##############################################################################

# Name: Maura Wilson

## 1. Assign the words "Station Eleven" to a variable called spl_book (1 point)

spl_book <- "Station Eleven"

## 2. Use a built-in R function to print the data type of the variable spl_book to the Console (1 point)

typeof(spl_book)

## 3. Assign the words "Emily St. John Mandel" to a variable called spl_author (1 point)

spl_author <- "Emily St. John Mandel"

## Imagine that we want to print out a statement that will describe any SPL book and author that we are analyzing, like so: "The SPL book that we are analyzing is [spl_book] by [spl_author]." Let's write some code that will accomplish this task.

## 4. Use a built-in R function to print out the sentence "The SPL book that we are analyzing is Station Eleven by Emily St. John Mandel." without actually typing "Station Eleven" and "Emily St. John Mandel" and instead using the variables spl_book and spl_author. (2 points)

paste("The SPL book that we are analyzing is", spl_book, "by", spl_author)

## 5. The number of SPL checkouts for physical copies of Station Eleven across the 12 months of the year 2020 was as follows: 31, 20, 12, 0, 0, 0, 0, 2, 3, 11, 14, 18
## Make a vector of these values and assign them to a variable called spl_checkouts (2 points)

spl_checkouts <- c(31, 20, 12, 0, 0, 0, 0, 2, 3, 11, 14, 18)

# Bonus: You can plot the checkouts by month using plot()!
plot(spl_checkouts)

## 6. Use a built-in R function to calculate the length of the vector spl_checkouts (1 point)

length(spl_checkouts) # 12

## 7. Use a built-in R function to calculate the maximum value of the vector spl_checkouts (1 point)

max(spl_checkouts) # 31

## 8. Use a built-in R function to calculate the minimum value of the vector spl_checkouts (1 point)

min(spl_checkouts) # 0

## 9. Use a built-in R function to calculate the average (mean) value of the vector spl_checkouts (1 point)

mean(spl_checkouts) # 9.25

## 10. Use a built-in R function to calculate the sum total of the vector spl_checkouts (1 point)

sum(spl_checkouts) # 111

## 11. Make a comment below (1 point), and write 3 or more sentences about the pattern of the physical checkouts for Station Eleven across the 12 months of 2020: 31, 20, 12, 0, 0, 0, 0, 2, 3, 11, 14, 18.

# Does this pattern surprise you? Why or not why not? What other information or data would you want to explore after seeing this information? (3 points)

# What is really interesting to me about the data presented is that even though Covid was not declared a national emergency until March, the highest number of checkouts occurred in January and February, when most people were not even aware of Covid at all. It makes me really curious to know what the checkout history of the book was in the last few months of 2019, to determine if the number went up. This would help determine if there were people in Seattle who had knowledge of the disease before the general public, or if the book was regularly that popular, but then checkouts decreased in April - July because it felt too real. I also would be curious to see general checkout data from those months when the book was not checked out at all to determine if that was because the library was closed or if it was a drop in popularity.
