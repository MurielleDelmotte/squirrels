## code to prepare `nyc_squirrels_reduced` dataset goes here

data_demo_squirrels <- readr::read_csv("data-raw/nyc_squirrels_reduced.csv")

data_demo_squirrels <- data_demo_squirrels |>
  dplyr::sample_n(size = 25)

usethis::use_data(data_demo_squirrels, overwrite = TRUE)

checkhelper::use_data_doc("data_demo_squirrels")
rstudioapi::navigateToFile("R/doc_data_demo_squirrels.R")
attachment::att_amend_desc()
