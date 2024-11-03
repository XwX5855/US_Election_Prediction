#### Preamble ####
# Purpose: Tests the dataset recorded by America's Political Pulse.
# Author: Yanzun Jiang
# Date: 2 November 2024
# Contact: yanzun.jiang@mail.utoronto.ca
# License: MIT
# Pre-requisites: Should have cleaned the dataset.
# Any other information needed? None.


#### Workspace setup ####
library(tidyverse)
library(arrow)

analysis_data <- read_parquet("data/02-analysis_data/analysis_data.parquet")

# Test if the data was successfully loaded
if (exists("analysis_data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}


#### Test data ####
# Check if the dataset has 1000 rows
if (nrow(analysis_data) == 1000) {
  message("Test Passed: The dataset has 1000 rows.")
} else {
  stop("Test Failed: The dataset does not have 1000 rows.")
}

# Check if the dataset has 7 columns
if (ncol(analysis_data) == 7) {
  message("Test Passed: The dataset has 7 columns.")
} else {
  stop("Test Failed: The dataset does not have 7 columns.")
}

# Check if the 'age' column contains only people above 18
if (all(analysis_data$age >= 18)) {
  message("Test Passed: The 'age' column contains only people above 18.")
} else {
  stop("Test Failed: The 'age' column contains people under 18.")
}

# Check if the 'gender' column has at least 2 unique values
if (n_distinct(analysis_data$gender) >= 2) {
  message("Test Passed: The 'gender' column contains at least 2 unique values.")
} else {
  stop("Test Failed: The 'gender' column contains less than 2 unique values.")
}

# Check if the 'race' column has at least 5 unique values
if (n_distinct(analysis_data$race) >= 5) {
  message("Test Passed: The 'race' column contains at least 5 unique values.")
} else {
  stop("Test Failed: The 'race' column contains less than 5 unique values.")
}

# Check if the 'employ' column has at least 4 unique values
if (n_distinct(analysis_data$employ) >= 4) {
  message("Test Passed: The 'employ' column contains at least 4 unique values.")
} else {
  stop("Test Failed: The 'employ' column contains less than 4 unique values.")
}

# Check if the 'education' column has at least 5 unique values
if (n_distinct(analysis_data$education) >= 5) {
  message("Test Passed: The 'education' column contains at least 5 unique values.")
} else {
  stop("Test Failed: The 'education' column contains less than 5 unique values.")
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
  "District of Columbia",
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

if (all(analysis_data$state %in% valid_states)) {
  message("Test Passed: The 'state' column contains only valid US state names.")
} else {
  stop("Test Failed: The 'state' column contains invalid state names.")
}

# Check if the 'vote' column has at least 3 unique values
if (n_distinct(analysis_data$vote) >= 3) {
  message("Test Passed: The 'vote' column contains at least 3 unique values.")
} else {
  stop("Test Failed: The 'vote' column contains less than 3 unique values.")
}

# Check if there are any missing values in the dataset
if (all(!is.na(analysis_data))) {
  message("Test Passed: The dataset contains no missing values.")
} else {
  stop("Test Failed: The dataset contains missing values.")
}
