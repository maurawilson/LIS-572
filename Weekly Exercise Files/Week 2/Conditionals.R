# Conditionals Practice

# Let's build a conditional that will report whether the temperature in an office needs to be adjusted.

# This program will measure the temperature of an office and then report whether the temperature is “too hot”, “too cold,” or “ideal.”

# Decide on an ideal temperature for an office. Then come up with a temperature for the imaginary office that we’re testing. Assign these values to the following variables.

office_temperature <- 75
ideal_temperature <- 71


# Write a conditional that will report whether office_temperature is “too hot,” “too cold,” or “ideal”
if (office_temperature > ideal_temperature) {
  print("too hot")
} else if (office_temperature < ideal_temperature) {
  print("too cold")
} else {
  print("ideal")
}

# Now change the value of the office_temperature, and test the conditional again to make sure it works
