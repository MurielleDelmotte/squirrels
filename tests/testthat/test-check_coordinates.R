test_that("check_coordinates works", {
  both_valid_latitude <- c(40.766, 40.799)
  both_valid_longitude <- c(-73.96, -73.95)
  both_invalid_latitude <- c(30, 32)
  both_invalid_longitude <- c(-100, -99)
  one_invalid_latitude <- c(40.766, 50)
  one_invalid_longitude <- c(-73.95, -100)

  expect_equal(
    object =
      check_coordinates(latitude = both_valid_latitude, longitude = both_valid_longitude),
    expected =
      c(TRUE, TRUE)
  )

  expect_equal(
    object =
      check_coordinates(latitude = both_invalid_latitude, longitude = both_invalid_longitude),
    expected =
      c(FALSE, FALSE)
  )

  expect_equal(
    object =
      check_coordinates(latitude = one_invalid_latitude, longitude = one_invalid_longitude),
    expected =
      c(TRUE, FALSE)
  )
})
