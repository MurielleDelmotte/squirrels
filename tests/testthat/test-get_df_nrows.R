test_that("get_df_nrows returns message", {

  expect_message(
    object = get_df_nrows(df = mtcars),
    regexp = "The dataset is composed of 32 observations"
  )

})

test_that("get_df_nrows returns value", {

  expect_equal(
    object = get_df_nrows(df = mtcars),
    expected = 32
  )

  expect_equal(object = get_df_nrows(df = iris),
               expected = 150)

})
