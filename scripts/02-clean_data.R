#### Preamble ####
# Purpose: Cleans the raw survey data recorded by America's Political Pulse.
# Author: Yanzun Jiang
# Date: 2 November 2024
# Contact: yanzun.jiang@mail.utoronto.ca
# License: MIT
# Pre-requisites: Should have downloaded the dataset.
# Any other information needed? None.

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("data/01-raw_data/raw_data.csv")

cleaned_data <-
  raw_data |>
  select(birthyr, gender, race, employ, educ, inputstate, matchup2024) |>
  rename(education = educ, state = inputstate, vote = matchup2024) |> 
  mutate(age = 2024 - birthyr) |>
  mutate(race = if_else(race == "Native American" | race == "Middle Eastern" |
                          race == "Two or more races", "Other", race)) |>
  mutate(employ = if_else(employ == "Homemaker" | employ == "Student" |
                            employ == "Other" |
                            employ == "Permanently disabled" |
                            employ == "Temporarily laid off",
                          "Unemployed", employ)) |>
  mutate(education = case_when(
    education == "High school graduate" ~ "High School",
    education == "Some college" ~ "College",
    education == "2-year" | education == "4-year" ~ "Bachelor",
    education == "Post-grad" ~ "Master or PhD",
    education == "No HS" ~ "Other")) |>
  mutate(vote = if_else(vote == "Not sure" |
                          vote == "Not going to vote/wouldn't vote if those were the choices" |
                          vote == "Another candidate", "Other", vote)) |>
  select(-birthyr) |>
  tidyr::drop_na()

#### Save data ####
write_csv(cleaned_data, "data/02-analysis_data/analysis_data.csv")
