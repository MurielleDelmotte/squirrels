# WARNING - Generated by {fusen} from dev/flat_export_results.Rmd: do not edit by hand # nolint: line_length_linter.

test_that("save_as_csv works", {
  expect_true(inherits(save_as_csv, "function")) 
  
  mon_dossier_temp <- tempfile(pattern = "savecsv")
  dir.create(mon_dossier_temp)

  save_as_csv(df = iris, path = file.path(mon_dossier_temp, "output.csv"))

  expect_true(object = file.exists(file.path(mon_dossier_temp, "output.csv")))
  
  unlink(mon_dossier_temp, recursive = TRUE)
  
  
})

test_that("save_as_csv produces error", {
  
  expect_error(object = save_as_csv(df = "toto", path = "fakedir/fakefile.csv"), regexp = "df is not a dataframe")
  
  expect_error(object = save_as_csv(df = iris, path = "fakedir/fakefile.csv"), regexp = "path does not exist")
  
  expect_error(object = save_as_csv(df = iris, path = "fakedir/fakefile.txt"), regexp = "path does not have extension csv")
  
  
})
