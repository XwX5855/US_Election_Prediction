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
library(rstanarm)

#### Read data ####
analysis_data <- read_csv("data/02-analysis_data/analysis_data.csv")

### Model ####
# Mutate datatype to fit the model
analysis_data <-
  analysis_data |>
  mutate(vote_numeric = case_when(
    vote == "Kamala Harris" ~ 0,
    vote == "Other" ~ 0.5,
    vote == "Donald Trump" ~ 1)
  )

# Fit the model
model <-
  stan_glm(
    formula = vote_numeric ~ age + gender + race + employ + education + state,
    data = analysis_data,
    family = binomial,
    prior = normal(0, 2.5),
    prior_intercept = normal(0, 5),
    seed = 24
  )


#### Save model ####
saveRDS(model, file = "models/model.rds")
