## code to prepare `data_squirrels` dataset goes here

library(readr)
library(dplyr)

data_squirrels <- read_csv(file = "data-raw/nyc_squirrels_sample.csv") |>
  slice_sample(n = 15)


usethis::use_data(data_squirrels, overwrite = TRUE)

checkhelper::use_data_doc("data_squirrels", prefix = "doc_")
