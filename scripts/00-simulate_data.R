#### Preamble ####
# Purpose: Simulates a dataset of the US election survey.
# Author: Yanzun Jiang
# Date: 2 November 2024
# Contact: yanzun.jiang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None.
# Any other information needed? None.


#### Workspace setup ####
library(tidyverse)
set.seed(24)


#### Simulate data ####
# State names
states <- c(
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

# Create a dataset
n <- 500

simulated_data <- tibble(
  age = round(runif(n, 18, 80)),
  gender = sample(c("Male", "Female", "Non-binary"),
                  size = n, replace = TRUE, prob = c(0.4, 0.4, 0.1)),
  race = sample(c("White", "Black", "Hispanic", "Asian", "Other"),
                size = n, replace = TRUE, prob = c(0.3, 0.3, 0.2, 0.1, 0.1)),
  employ = sample(c("Full-time", "Part-time", "Unemployed", "Retired"),
                  size = n, replace = TRUE, prob = c(0.5, 0.2, 0.1, 0.2)),
  education = sample(c("High School", "College", "Bachelor",
                       "Master or PhD", "Other"),
                     size = n, replace = TRUE,
                     prob = c(0.4, 0.2, 0.2, 0.1, 0.1)),
  state = sample(states, size = n, replace = TRUE),
  vote = sample(c("Donald Trump", "Kamala Harris", "Other"),
                size = n, replace = TRUE, prob = c(0.45, 0.45, 0.1))
)


#### Save data ####
write_csv(simulated_data, "data/00-simulated_data/simulated_data.csv")
