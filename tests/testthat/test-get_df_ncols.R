test_that("get_df_ncols works", {
  expect_message(
    object = get_df_ncols(df = iris),
    regexp = "The dataset is composed of 5 columns"
  )
})
