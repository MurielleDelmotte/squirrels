# test_that("check_plus_in_primary_fur_color - gestion des erreurs", {
#
#   expect_error(object = check_plus_in_primary_fur_color(primary_fur_color = c(1,2,3)),
#                regexp = "primary_fur_color should be a character" )
#
# })


test_that("check_plus_in_primary_fur_color - cas normal", {

  expect_equal(object = check_plus_in_primary_fur_color(primary_fur_color = c("Black", "Black+Cinnamon", "Cinnamon")),
               expected = c(TRUE, FALSE, TRUE))

  expect_equal(object = check_plus_in_primary_fur_color(primary_fur_color = c("Black", "Black", "Cinnamon")),
               expected = c(TRUE, TRUE, TRUE))

})
