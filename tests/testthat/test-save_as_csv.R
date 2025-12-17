test_that("save_as_csv works", {
  dossier_temp <- tempfile(pattern = "saveascsv")
  dir.create(dossier_temp)

  save_as_csv(df = data_demo_squirrels,
              path = file.path(dossier_temp, "monfichier.csv"))

  expect_true(file.exists(file.path(dossier_temp, "monfichier.csv")))

  # Vérifier que le fichier est taille >0
  # Lire fichier et vérifier que le contenu correspond bien à data_demo_suirrels

  unlink(dossier_temp, recursive = TRUE)

})


test_that("save_as_csv - gestion des erreurs ", {
  expect_error(
    object = save_as_csv(df = data_demo_squirrels, path = "monfichier.xlsx"),
    regexp = "File must be a csv"
  )


  expect_error(object = save_as_csv(df = "coucou", path = "monfichier.xlsx"),
               regexp = "df must be a dataframe")

  expect_error(object = save_as_csv(
    df = data_demo_squirrels,
    path = file.path("fakedir", "monfichier.csv")
  ),
  regexp = "path does not exist")

})
