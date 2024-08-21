# You made a guest appearance in a Canadian TV show, and you got paid 250 Canadian dollars!

# Sweet! Wait, is that a lot?

# Let's create a function called cnd_to_usd() that converts currency from Canadian dollars to US dollars

# Save this variable
my_canadian_payout <- 250

# Exchange rate: 1 Canadian dollar = 0.74 United States dollars
# You simply need to multiply the Canadian dollar amount by .74

# 1: DEFINE A FUNCTION
# Fill in the necessary code below to finish the function

cnd_to_usd <- function(cnd_amount) {
  us_value <- .74 * cnd_amount

  return(us_value)
}


# 2: USE AND TEST THE FUNCTION

# Test the function
cnd_to_usd(my_canadian_payout)

# Now run the function again and save the value in this variable
usd_payout <- cnd_to_usd(my_canadian_payout)

# Print out the value
print(usd_payout)
