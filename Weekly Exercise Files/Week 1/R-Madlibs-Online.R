# R Madlibs

# This programming exercise is designed like a game of Madlibs, and it will help reinforce variables, data types, and functions. 

# This exercise can be completed individually, but ideally it would be completed with a partner. So, if you feel comfortable, this could be a good opportunity to post in our Discord channel #study-partners and find someone to work on this assignment with.

# Please answer the following questions, or ask your partner the following questions:
# What is your hometown?
# What is your favorite food?
# What is your age?
# Do you like rain — yes or no? 

# 1. Based on these answers, assign the appropriate values to each of the following variable names
# Make sure to use the data type listed in the comments (e.g., character, logical)
# Make sure to run each line to save the variable in your Global Environment
hometown <- "Royal Oak"              #character
food  <-"Mac and Cheese"                  #character
age   <- 28                   #numeric
likes_rain  <- TRUE            #logical
  
# 2. Calculate your or your partner's likely birth year by only using the age variable and a basic math operation
birth_year  <- 2024 - age           #numeric


# 3. Use a built-in R function to merge together each statement and variable, and then print the message to the Console

# Here's an example
paste("My partner's hometown is", hometown)
      
# Please format the rest of these statements in the same way so you can print them to the console
paste("My favorite food is", food)
paste("My was probably born in", birth_year)
paste("The statement 'I like rain' is", likes_rain)

# 4. Use a built-in R function to print the data type of each variable to the console

# Here's an example
typeof(hometown)

# Please format the rest of these statements in the same way so you can print the data type to the console
typeof(food)
typeof(age)
typeof(likes_rain)
