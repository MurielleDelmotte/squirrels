library(readr)

test_that("check_presence_of_required_columns - gestion des erreurs", {

  expect_error(object = check_presence_of_required_columns(mtcars), regexp = "The dataset does not contain the required columns")

})

test_that("check_presence_of_required_columns - OK", {

  path_file <- system.file("nyc_squirrels_sample.csv", package = "squirrels")
  data_to_test <- read_csv(file = path_file)
  expect_true(object = check_presence_of_required_columns(df = data_to_test))

})
