##############################################################################
## Assignment 4: Text Analysis of Your Favorite Book 
# (From Project Gutenberg)

## In this assignment, you will be calculating the most frequent words in a text of your choice from Project Gutenberg, making a bar plot of top words, and making an argument about what these top words represent or reveal about your text.
# https://www.gutenberg.org/ebooks/search/?sort_order=downloads

## Note: You will make 1 bar plot in this assignment, which you will need to export as PNG image file and submit with your assignment to Gradescope

##############################################################################

# Name: Maura Wilson

## Load the necessary libraries
install.packages("gutenbergr")
install.packages("palatteer")
install.packages("ggthemes")
library(gutenbergr)
library(tidytext)
library(dplyr)
library(ggplot2)
library(paletteer)
library(ggthemes)

# 1. Choose a text from Project Gutenberg, find the text's raw .txt URL, and plug it into the code below (2 points)
# You can find texts here: https://www.gutenberg.org/ebooks/search/?sort_order=downloads
# Click on "Plain Text UTF-8" and copy the URL

# Read in Project Gutenberg Book
# Find plain text URL, plug into readLines (code provided below)
book_lines <- readLines("https://www.gutenberg.org/cache/epub/1342/pg1342.txt")
# loading in pride and prejudice by Jane Austen

# Transform into a dataframe (code provided below)
book_df <- data.frame(line=1:length(book_lines), text=book_lines)

# 2. Before you begin your analysis, answer these questions in 2-4 sentences. (3 points)
# What book did you choose, and why?
#I chose Pride and Prejudice by Jane Austen because that is one of my favorite books from when I was in high school that is available in the public domain.

# What do you think will be some of the most frequent words in your text? Why? 
#My guess is that some of the most frequent words will be names such as Lizzie/Elizabeth, Jane, Bennet, Darcy, etc or words like daughter(s), nerves, husband. This is of course after having removed the stop words.

# What do you think would be an interesting word or words to analyze? Why?
#I think it would be interesting to look at both Pride and Prejudice, since as the title of the book you might expect them to appear often but I do not think that they do.
  
# 3. To do a word frequency analysis, we first need to tokenize the text. (4 points)
# Split the text dataframe into one word per row and save as tidy_book
tidy_book <- book_df %>% 
  unnest_tokens(word, text)

# 4. Now, count how many times each word appears and sort from most to least frequent (4 points)
# Save as word_count
word_count <- tidy_book %>% 
  count(word)

## Next, we need to get rid of stopwords.

# Install stopwords
install.packages("stopwords")
# Load stopwords 
library("stopwords")
# Make a dataframe with default English stopwords
en_stopwords <- data.frame(word = stopwords(language = "en", source = "snowball"))


# Add custom stopwords
# If you wish, you can also add custom stopwords as shown below
en_stopwords <- en_stopwords %>% add_row(word = c("said", "went"))
# If you wish, you can also remove stopwords as shown below
# en_stopwords <- en_stopwords %>% 
    # filter(!word %in% c("me", "myself", "i"))

# 5. Now, remove stopwords from the word_count dataframe (4 points)
# Save as meaningful_words
meaningful_words <- word_count %>% 
  anti_join(en_stopwords) 

# 6. Next, filter the dataframe for only words that appear X number of times (4 points)
# You get to pick the X word frequency threshold
# Save as top_words
top_words <- meaningful_words %>% 
  filter(n > 200)

# 7. Now, plot the top_words as a bar plot with words on the y-axis and frequency on the x-axis (10 points)
# 7a. Re-order the bars from most to least frequent (most frequent at the very top)
# 7b. Change the fill color of the bars
# 7c. add an overall title and meaningful x, y axis titles
# Then export and submit to Gradescope when you're finished
ggplot(data = top_words) +
  geom_col(aes(
    x = reorder(word, +n),
    y = n,
    fill = word
  )) +
  coord_flip() +
  scale_fill_manual(values = c("#33608CFF", "#546393FF", "#6F659AFF", "#8767A0FF", "#9F69A3FF", "#B66B9BFF", "#CC6E94FF", "#E0708DFF", "#EB7F82FF", "#EF9375FF", "#F3A767FF", "#F6BA57FF", "#F4A952FF", "#F2974EFF", "#EF8549FF", "#EB7446FF", "#E46946FF", "#DE5D46FF", "#D75045FF", "#D04444FF", "#C83843FF", "#C02A41FF", "#B81840FF")) +
  labs(
    title = "Words that Appear More than 200 Times In Pride and Prejudice",
    y = "Number of Occurances",
    x = "Word"
  )


# 8. Answer the following questions in 4 or more sentences. (4 points)
# What do you think the top words reveal or represent about your text, if anything?
# I am not sure what the top words reveal about the text, other than the characters are discussed clearly often, with the main love interests being the in position 2 and 3 of the top words. The other top words much, must, one, know, though, well, never, can, think, may, etc all feel like filler words to me, even though I know they are not. In isolation from the rest of the text, it is hard to gain insight from their prominence here.

# Based on your predictions from Q2, do these results surprise you? Why or why not?
# I was surprised by the number of times Mr and Mrs showed up, although upon giving it a second thought, I should have anticipated that. I think if I had read the text more recently I would have remembered that because of the time period, titles were nearly always used.

# What other kinds of data would you like to do text analysis on?
# I would like to look for frequency of words like love, pride, prejudice, etc and also would be interested to look at ngrams for words with the characters.

