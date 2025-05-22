test_that("filter_squirrels_data_based_on_integrity works", {
  # real data
  my_data_squirrels <- readr::read_csv(
    system.file("nyc_squirrels_sample.csv", package = "squirrels")
  )
  data_integrity <- filter_squirrels_data_based_on_integrity(my_data_squirrels)

  expect_equal(
    nrow(data_integrity$df_valid_data),
    381
  )

  expect_equal(
    nrow(data_integrity$df_invalid_data),
    6
  )

  expect_equal(
    nrow(data_integrity$df_missing_data),
    13
  )
})

