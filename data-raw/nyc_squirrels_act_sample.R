## code to prepare `DATASET` dataset goes here

data <- readr::read_csv("data-raw/nyc_squirrels_act_sample.csv")

nyc_squirrels_act <- data |>
  head()

usethis::use_data(nyc_squirrels_act, overwrite = TRUE)

checkhelper::use_data_doc("nyc_squirrels_act")
rstudioapi::navigateToFile("R/doc_nyc_squirrels_act.R")
attachment::att_amend_desc()

