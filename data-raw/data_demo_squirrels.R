## code to prepare `data_demo_squirrels` dataset goes here
library(readr)

squirrels_raw <- read_csv("data-raw/nyc_squirrels_reduced.csv")

data_demo_squirrels <- dplyr::sample_n(squirrels_raw, size = 25)

usethis::use_data(data_demo_squirrels, overwrite = TRUE)

# documentation
checkhelper::use_data_doc("data_demo_squirrels")
