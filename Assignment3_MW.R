##############################################################################
## Assignment 3: Books in Translation

## This assignment draws from the Publisher's Weekly Translation Database, which includes "all works of fiction, poetry, children’s books, and nonfiction translated into English and published in the U.S. after January 2008." The data includes information about the book's original language, country, publisher, author, translator, author gender, translator gender, price, and more.

## https://www.publishersweekly.com/pw/translation/home/index.html

## FAQs https://www.publishersweekly.com/pw/corp/translation-database-FAQ.html

## Note: You will make 1 line plot and 2 bar plots in this assignment, which you will need to export as PNG image files and submit with your assignment to Gradescope

##############################################################################

# Name: Maura Wilson

## 1. Load the Publisher's Weekly Translation dataset from the URL below and save it to a variable called `pw_df` (2 points)
# https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/PW-Translation-2022-11-01.csv
# Make sure you use the special argument that ensures text columns will be interpreted correctly

pw_df <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/PW-Translation-2022-11-01.csv", stringsAsFactors = FALSE)


## 2. Load DPLYR and ggplot2 (1 point)
library(dplyr)
library(ggplot2)
library(plotly)

## 3. How many rows are in this dataset?
# Use a built-in R function to find the number of rows, save it to the variable `num_rows`, then print `num_rows` (1 point)
num_rows <- nrow(pw_df)
print(num_rows)

## 4. How many columns are in this dataset?
# Use a built-in R function to find the number of columns, save it to the variable `num_cols`, then print `num_cols` (1 point)
num_cols <- ncol(pw_df)
print(num_cols)

## 5. How many books from *each language* have been translated into English and published since 2008? 
# Calculate how many books from *each language* are in the dataset (3 points)
# Hint: there is one row, or record, for each book in the dataset, so you will want to count the number of records/rows for each language...
## Save a dataframe as total_languages
total_languages <- pw_df %>% 
  group_by(language) %>% 
  summarize(total_translation = n())

## 6. Use a function to slice the top 7 languages with the most number of books translated into English
## Save as top_languages
top_languages <- total_languages %>% 
  slice_max(n = 7, order_by = total_translation)
  
# Next, we want to make a line plot that charts the number of books translated into English for these top 7 languages between 2008 and 2022.

# To do so, we will first need to calculate the number of books translated into English *per language* *per year* for all languages (Q7).
# After this manipulation, we will then need to filter the resulting dataframe for just the top 7 languages (Q8).

## 7. How many books from *each language* were published *per year*? (3 points)
## Hint: You might need to group by multiple columns...
## Save as total_languages_per_year
total_languages_per_year <- pw_df %>% 
  group_by(pubdate.yr, language) %>% 
  summarize(total_published = n())

## 8. Next, we need to filter this dataframe for only the top 7 languages (2 points)
# We can't use our slicing tool for this task because it would only give us the top languages published in a given year, not the top languages overall
# So we will need to use the work that we did in Question 6, where we found the top 7 languages overall with our slicing tool

# Pro tip: You can extract any column from a dataframe and turn it into a vector by using dollar sign $ notation like so
top_languages_vector <- top_languages$language

# Now, we have a vector that we can use to filter the dataframe total_languages_per_year for only the top 7 languages
# Hint: You may need to use %in% syntax to filter for only the languages that are "in" the top_languages_vector ...
## Save as top_languages_per_year 
## (This one's a freebie!)
top_languages_per_year <- total_languages_per_year %>%
  filter(language %in% top_languages_vector)

## 9. Finally, make a line plot of the top 7 languages and how many books have been translated into English from those languages from 2008-2022
# 9a. Choose your own color palette
# 9b. Add a meaningful title, x/y axis labels, and a legend title 
# (10 points)
ggplot(data = top_languages_per_year) +
  geom_line(aes(
    x = pubdate.yr,
    y = total_published, 
    color = language
  )) +
  scale_color_manual(
    values = c("pink4", "limegreen", "orange1", "palegreen4", "deepskyblue1", "magenta4", "red"
  )) +
  labs(
    title = "After a Decade on Top, Books Translated from 
    French to English Are Now Second Most Translated",
    x = "Publication Year",
    y = "Total Books Translated",
    color = "Original Language"
  )

# Export the line plot as a PNG file, and be sure to submit it with your R script

## 10. What do you make of the pattern represented in the line plot above? Does the fluctuation of languages over time surprise you? Why or why not? Answer in at least 2-3 sentences (2 points)
# I think it is interesting that there was such a steep jump for French translations in 2011 and to a lesser extent German in the same year, then a drop again around 2016. It makes me wonder what might have been going on in publishing to account for the rise and fall. The rest of the languages have a more expected fluctuation for what I anticipated, including Spanish being a more popular translation than languages such as Swedish or Italian.

## 11. Calculate the total number of books *per author gender* across the entire dataset
# Hint: Remember that each book is a row or record
## Save as author_gender (3 points)
author_gender <- pw_df %>% 
  group_by(auth.gender) %>% 
  summarize(total_books = n())

## 12. Make a bar plot of author_gender, and add a meaningful title  (3 points)
ggplot(data = author_gender) +
  geom_col(aes(
    x = auth.gender,
    y = total_books,
    fill = auth.gender
  )) +
  labs(
    title = "Number of Translated Works Per Gender of Author",
    x = "Gender",
    y = "Total Books Translated"
  )

# Export the bar plot as a PNG file, and be sure to submit it with your R script

## 13. Calculate the total number of books *per translator gender* across the entire dataset (3 points)
## Save as translator_gender 
translator_gender <- pw_df %>% 
  group_by(trnsl.gend) %>% 
  summarize(total_translated = n())

## 14. Make a bar plot of translator_gender, and add a meaningful title (3 points)
ggplot(data = translator_gender) +
  geom_col(aes(
    x = trnsl.gend,
    y = total_translated,
    fill = trnsl.gend
  )) +
  labs(
    title = "Number of Translated Works Per Gender of Translator",
    x = "Gender of Translator",
    y = "Total Translations"
  )

# Export the bar plot as a PNG file, and be sure to submit it with your R script

## 15. What do you make of the differences between author gender and translator gender? What do you think explains the similarity or difference? Answer in at least 2-3 sentences (2 points)
#Both plots showed that a translated book is more likely to be written by a man and more likley to be translated by a man, which is not very surprising to me. If I think of authors more likley to be regarded as "classics" most are men, and "women's literature" is still thought down on by many. Publishing and translation of materials are not fields that have escaped the power imbalances of society and so I am not surprised to see that reflected here. I am also not surprised that the gap between works translated by men and works translaed by women is much smaller than the gap in who authored the books. Overall, I am realizing I am not very informed on sexism within publishing and it makes me want to learn more about it to be better able to dissect these findings.

## 16. Now, it's your turn! Ask your own question about the PW Translation data, and then answer it with code. If you add an interactive plot to your code, you can earn 1 bonus point (4 points, 1 bonus point)

## First, write down your question in English language words here:
# I would like to know which genre is most translated for the top 7 languages

# Then answer it with code below
total_genre <- pw_df %>% 
  group_by(genre, language) %>% 
  summarize(total_translated = n())

top_genres_per_language <- total_genre %>%
  filter(language %in% top_languages_vector)

top_genres_plot <- ggplot(data = top_genres_per_language) +
  geom_col(aes(
    x = language,
    y = total_translated,
    fill = genre,
    text = paste("Genre:", genre, "
Number of Translations:", total_translated)
  )) 

ggplotly(top_genres_plot, tooltip = c("text"))

## 17. Were you able to answer your question? What do the patterns or results mean? Why does this question matter? Answer in at least 2-3 sentences (2 points)
#I was able to answer my question. For each of the top 7 languages, fiction is the most translated genre. For each of the languages, the second highest genre is likely to be either children's or poetry.
