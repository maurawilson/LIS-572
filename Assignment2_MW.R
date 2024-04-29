##############################################################################
## Assignment 2: SPL Data & DPLYR
## Please write your code/responses in the places marked "Your code/response here"

## This assignment draws on Seattle Public Library circulation data from 2018-2023. The data only includes items that were checked out at least 15 times in a month.

## To explore the circulation data for yourself, see https://data.seattle.gov/Community/Checkouts-by-Title/tmmm-ytt6/data
##############################################################################

# Name: Maura WIlson

## 1. Load the Seattle Public Library circulation dataset from the URL below and save it to a variable called `spl_df` (2 points)
# https://github.com/melaniewalsh/Neat-Datasets/raw/main/SPL-Checkouts-2018-2023-atleast15checkouts.csv

# If you're having trouble loading the data from the URL, you can try to download it as a CSV to your computer and then load it from your local file path
# You can click the download CSV button at the bottom of this page
# https://flatgithub.com/melaniewalsh/Neat-Datasets/blob/main/SPL-Checkouts-2018-2023-atleast15checkouts.csv?filename=SPL-Checkouts-2018-2023-atleast15checkouts.csv

# Make sure you use the special argument that ensures text columns will be interpreted correctly!
spl_dif <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/raw/main/SPL-Checkouts-2018-2023-atleast15checkouts.csv", stringsAsFactors = FALSE)

## 2. Load the DPLYR library (1 point)
library(dplyr)

## 3. How many rows are in this dataset?
# Use a built-in R function to find the number of rows and save to the variable `num_rows` (1 point)
num_rows <- nrow(spl_dif)

## 2. How many columns are in this dataset?
# Use a built-in R function to find the number of columns and save to the variable `num_cols` (1 point)
num_cols <- ncol(spl_dif)

## 3. There are more than just books in this dataset. Use a DPLYR function to identify all of the different, or "distinct," material types
# Save these values to the variable `material_types` (2 points)
material_types <- spl_dif %>% 
  distinct(MaterialType)

## Here's a motivating question to guiden_distinct()## Here's a motivating question to guide the next part of the assignment: How do the total number of checkouts for each material type compare to one another — i.e., number of books checked out vs e-books vs audiobooks, etc.?

# We can answer this question in a few different ways. Let's first try to filter the dataframe.

# 4. Filter the dataframe for only print books and save the books dataframe to the variable `books_df` (2 points)
books_df <- spl_dif %>% 
  filter(MaterialType == "BOOK")

## 5. Now use a DPLYR function to calculate the sum total number of checkouts for books from 2018-2023.
# Save this number to the variable `num_books` (2 points)
# (Your result may be a dataframe, and that's fine)
num_books <- books_df %>% 
  summarize(sum(Checkouts))

# A more efficient way to calculate the number of checkouts for each material type might be to group the material types together and then do a calculation on each group.

# 6. Use a DPLYR function to group by material type, and then calculate the sum total checkouts for each material type.
# Save to a variable `checkouts_per_material_type` (6 points)
checkouts_per_material_type <- spl_dif %>% 
  group_by(MaterialType) %>% 
  summarize(total_checkouts = sum(Checkouts))
  

# View the `checkouts_per_material_type` dataframe and inspect the results

# 7. Make a built-in comment below, and answer the following questions in a few sentences:
# Which material type has the most number of checkouts, and does it surprise you or not?
# What other patterns or observations stand out to you or are interesting to you from the `checkouts_per_material_type` dataframe? (4 points)

#According to my results, Ebooks were the most checked out material type, followed by print books. This is not surprising to me as I think many people use libraries primarily for ebooks and since this data set includes 2020-2022, years where people were much more likely to be using e-resources, it makes perfect sense. If I had never worked at a library before, I would be incredibly surprised at videodiscs, or DVDs, being the fourth most popular material, or at least surprised by the number of checkouts. Having worked at the library, I know the DVDs are a very popular item and are checked out frequently, despite the prevelance of streaming.

# 8. How do the total number of checkouts from the SPL fluctuate over time? 
# Use a DPLYR function to group by year, and then calculate the sum total checkouts for each year
# Save to a variable `checkouts_per_year` (6 points)
checkouts_per_year <- spl_dif %>% 
  group_by(CheckoutYear) %>% 
  summarize(total_checkouts=sum(Checkouts))

# For fun, you can plot these results:
plot(checkouts_per_year, type = 'b')

# How do the total number of checkouts from the SPL fluctuate over time for a specific title or author?

# 9. First, filter the spl_df for a specific title or author of your choice. To do this filtering, you will probably need to use str_detect() from the stringr library.
# Save the filtered dataframe to the variable `query_df` (4 points)
library(stringr)
query_df <- spl_dif %>% 
  filter(str_detect(Title, "City of Brass"))

# 10. Now use a DPLYR function to group by year for that particular author or title, and then calculate the sum total checkouts for each year for that author or title
# Save to a variable `query_checkouts_per_year` (6 points)
query_checkouts_per_year <- query_df %>% 
  group_by(CheckoutYear) %>% 
  summarize(total_checkouts=sum(Checkouts))

# For fun, you can plot these results:
plot(query_checkouts_per_year, type = 'b')

# 11. Lastly, come up with your own question that you want to answer about the SPL data, and then answer it by writing the appropriate code. You should use at least one DPLYR function. (3 points)
# How many unique titles were checked out each year?

#unique titles dataframe
unique_titles<- spl_dif %>% 
  group_by(CheckoutYear) %>% 
  summarize(titles = n_distinct(Title))


