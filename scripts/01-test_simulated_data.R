#### Preamble ####
# Purpose: Tests the simulated dataset of the US election survey.
# Author: Yanzun Jiang
# Date: 2 November 2024
# Contact: yanzun.jiang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None.
# Any other information needed? None.


#### Workspace setup ####
library(tidyverse)

simulated_data <- read_csv("data/00-simulated_data/simulated_data.csv")

# Test if the data was successfully loaded
if (exists("simulated_data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}


#### Test data ####

# Check if the dataset has 500 rows
if (nrow(simulated_data) == 500) {
  message("Test Passed: The dataset has 500 rows.")
} else {
  stop("Test Failed: The dataset does not have 500 rows.")
}

# Check if the dataset has 7 columns
if (ncol(simulated_data) == 7) {
  message("Test Passed: The dataset has 7 columns.")
} else {
  stop("Test Failed: The dataset does not have 7 columns.")
}

# Check if the 'age' column contains only people above 18
if (all(simulated_data$age >= 18)) {
  message("Test Passed: The 'age' column contains only people above 18.")
} else {
  stop("Test Failed: The 'age' column contains people under 18.")
}

# Check if the 'gender' column has at least 3 unique values
if (n_distinct(simulated_data$gender) >= 3) {
  message("Test Passed: The 'gender' column contains at least 3 unique values.")
} else {
  stop("Test Failed: The 'gender' column contains less than 3 unique values.")
}

# Check if the 'race' column has at least 5 unique values
if (n_distinct(simulated_data$race) >= 5) {
  message("Test Passed: The 'race' column contains at least 5 unique values.")
} else {
  stop("Test Failed: The 'race' column contains less than 5 unique values.")
}

# Check if the 'employ' column has at least 4 unique values
if (n_distinct(simulated_data$employ) >= 4) {
  message("Test Passed: The 'employ' column contains at least 4 unique values.")
} else {
  stop("Test Failed: The 'employ' column contains less than 4 unique values.")
}

# Check if the 'education' column has at least 6 unique values
if (n_distinct(simulated_data$education) >= 6) {
  message("Test Passed: The 'education' column contains at least 6 unique values.")
} else {
  stop("Test Failed: The 'education' column contains less than 6 unique values.")
}

# Check if the 'state' column contains only valid US state names
valid_states <- c(
  "Alabama",
  "Alaska",
  "Arizona",
  "Arkansas",
  "California",
  "Colorado",
  "Connecticut",
  "Delaware",
  "Florida",
  "Georgia",
  "Hawaii",
  "Idaho",
  "Illinois",
  "Indiana",
  "Iowa",
  "Kansas",
  "Kentucky",
  "Louisiana",
  "Maine",
  "Maryland",
  "Massachusetts",
  "Michigan",
  "Minnesota",
  "Mississippi",
  "Missouri",
  "Montana",
  "Nebraska",
  "Nevada",
  "New Hampshire",
  "New Jersey",
  "New Mexico",
  "New York",
  "North Carolina",
  "North Dakota",
  "Ohio",
  "Oklahoma",
  "Oregon",
  "Pennsylvania",
  "Rhode Island",
  "South Carolina",
  "South Dakota",
  "Tennessee",
  "Texas",
  "Utah",
  "Vermont",
  "Virginia",
  "Washington",
  "West Virginia",
  "Wisconsin",
  "Wyoming"
)

if (all(simulated_data$state %in% valid_states)) {
  message("Test Passed: The 'state' column contains only valid US state names.")
} else {
  stop("Test Failed: The 'state' column contains invalid state names.")
}

# Check if there are any missing values in the dataset
if (all(!is.na(simulated_data))) {
  message("Test Passed: The dataset contains no missing values.")
} else {
  stop("Test Failed: The dataset contains missing values.")
}

# Check if the 'vote' column has at least 2 unique values
if (n_distinct(simulated_data$vote) >= 2) {
  message("Test Passed: The 'vote' column contains at least 2 unique values.")
} else {
  stop("Test Failed: The 'vote' column contains less than 2 unique values.")
}
