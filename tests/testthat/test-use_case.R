test_that("use case works with client data", {
  data <- readxl::read_excel(
    system.file("nyc_squirrels_client_file_to_be_used_as_reference.xlsx", package = "squirrels")
  )


  filtered_data <- filter_squirrels_data_based_on_integrity(data)


  output_dir <- tempfile()
  dir.create(output_dir)

  save_as_csv(
    df = filtered_data$df_valid_data,
    path = file.path(output_dir, "valid_data.csv")
  )

  save_as_csv(
    df = filtered_data$df_invalid_data,
    path = file.path(output_dir, "invalid_data.csv")
  )

  save_as_csv(
    df = filtered_data$df_missing_data,
    path = file.path(output_dir, "missing_data.csv")
  )


  expect_true(file.exists(file.path(output_dir, "valid_data.csv")))
  expect_true(file.exists(file.path(output_dir, "invalid_data.csv")))
  expect_true(file.exists(file.path(output_dir, "missing_data.csv")))

  valid_data <- read.csv2(file.path(output_dir, "valid_data.csv"))

  expect_equal(
    nrow(valid_data),
    354
  )

  invalid_data <- read.csv2(file.path(output_dir, "invalid_data.csv"))
  expect_equal(
    nrow(invalid_data),
    6
  )

  missing_data <- read.csv2(file.path(output_dir, "missing_data.csv"))
  expect_equal(
    nrow(missing_data),
    12
  )
  unlink(output_dir, recursive = TRUE)
})
