# WARNING - Generated by {fusen} from dev/flat_check_data.Rmd: do not edit by hand # nolint: line_length_linter.

library(readr)
library(dplyr)

test_that("check_presence_of_required_columns works", {
  expect_true(inherits(check_presence_of_required_columns, "function")) 
  
  data_squirrels <- read_csv(file = system.file("nyc_squirrels_sample.csv", package = "squirrels"))
  
  expect_true(object = check_presence_of_required_columns(df = data_squirrels))
  
  data_squirrels_with_no_lat <- data_squirrels |> 
    select(-lat)
  
  expect_error(object = check_presence_of_required_columns(df = data_squirrels_with_no_lat), 
               regexp = "The dataset does not contain the required columns")
  
})
