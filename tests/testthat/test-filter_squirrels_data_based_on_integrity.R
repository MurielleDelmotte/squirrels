test_that("filter_squirrels_data_based_on_integrity - test d'usage data reference", {

  data_ref <- readxl::read_xlsx(path = system.file("nyc_squirrels_client_file_to_be_used_as_reference.xlsx", package = "squirrels"))

  data_integrity <- filter_squirrels_data_based_on_integrity(df_squirrels = data_ref)

  expect_equal(object = nrow(data_integrity$df_valid_data),
               expected = 354)

  expect_equal(object = nrow(data_integrity$df_invalid_data),
               expected = 6)

  expect_equal(object = nrow(data_integrity$df_missing_data),
               expected = 12)
})
