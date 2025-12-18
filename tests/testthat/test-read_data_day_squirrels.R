test_that("read_data_day_squirrels - Gestion des erreurs", {

  expect_error(object = read_data_day_squirrels(path = "fake_path"),
               regexp = "Path does not exist")

  tmp_dir <- tempfile(pattern = "readdata_empty")
  dir.create(tmp_dir)

  expect_error(object = read_data_day_squirrels(path = tmp_dir),
               regexp = "There is no files corresponding to raw squirrels data in this folder")

  unlink(tmp_dir)
})


test_that("read_data_day_squirrels - Cas normaux", {

  res_import <- read_data_day_squirrels(path = system.file(package = "squirrels"))

  expect_equal(object = length(res_import), expected = 4)

  expect_equal(object = names(res_import), expected = c("17", "18", "19", "20") )

  expect_null(object = res_import[["18"]])

})
