## code to prepare `data_demo_squirrels` dataset goes here
library(readr)
library(dplyr)

squirrels_raw <- read_csv("data-raw/nyc_squirrels_reduced.csv")

data_demo_squirrels <- squirrels_raw |>
  sample_n(size = 25)

usethis::use_data(data_demo_squirrels, overwrite = TRUE)

checkhelper::use_data_doc("data_demo_squirrels", prefix = "doc_")
attachment::att_amend_desc()
