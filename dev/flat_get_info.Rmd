---
title: "flat_first.Rmd empty"
output: html_document
editor_options: 
  chunk_output_type: console
---

```{r development, include=FALSE}
library(testthat)
library(glue)
```

<!--
 You need to run the 'description' chunk in the '0-dev_history.Rmd' file before continuing your code there.
-->

```{r development-load}
# Load already included functions if relevant
pkgload::load_all(export_all = FALSE)
```


# Get a message with a number of rows

You can get a message with the number of rows in a data frame of interest with `get_df_nrows()`.


```{r development}

data <- mtcars

message(glue("The dataset id composed of {nrow(data)} rows"))

```

    
```{r function-get_df_nrows}
#' To get a message with the number of rows in a data frame of interest with `get_df_nrows()`.
#' 
#' @param data dataframe The dataset to be used
#' 
#' @importFrom glue glue
#' 
#' @return numeric (the number of rows)  and a message 
#' @export
get_df_nrows <- function(data){
  
  if (isFALSE(inherits(data, "data.frame"))) {
    stop("data must be a data.frame")
  }
  
  
  nrow_data <- nrow(data)
  
  message(glue("The dataset is composed of {nrow_data} rows"))

  return(nrow_data)
}
```
  
```{r example-get_df_nrows}
get_df_nrows(data = iris)
get_df_nrows(data = mtcars)
```
  
```{r tests-get_df_nrows}

test_that("get_df_nrows works", {
  
  mymtcars <- structure(list(mpg = c(21, 21, 22.8, 21.4, 18.7, 18.1), cyl = c(6, 
6, 4, 6, 8, 6), disp = c(160, 160, 108, 258, 360, 225), hp = c(110, 
110, 93, 110, 175, 105), drat = c(3.9, 3.9, 3.85, 3.08, 3.15, 
2.76), wt = c(2.62, 2.875, 2.32, 3.215, 3.44, 3.46), qsec = c(16.46, 
17.02, 18.61, 19.44, 17.02, 20.22), vs = c(0, 0, 1, 1, 0, 1), 
    am = c(1, 1, 1, 0, 0, 0), gear = c(4, 4, 4, 3, 3, 3), carb = c(4, 
    4, 1, 1, 2, 1)), row.names = c("Mazda RX4", "Mazda RX4 Wag", 
"Datsun 710", "Hornet 4 Drive", "Hornet Sportabout", "Valiant"
), class = "data.frame")
  
  
  
  expect_message(
    object = get_df_nrows(data = mymtcars),
    regexp = "The dataset is composed of 6 rows"
  )
  
  
  expect_message(
    object = get_df_nrows(data = mtcars),
    regexp = "The dataset is composed of 32 rows"
  )
  
  
  expect_equal(object = get_df_nrows(data = mymtcars), expected = 6)
  expect_equal(object = get_df_nrows(data = mtcars), expected = 32)
  
  expect_error(object =  get_df_nrows(data = "mymtcars"), regexp = "data must be a data.frame")
})

```
  



```{r development-inflate, eval=FALSE}
# Run but keep eval=FALSE to avoid infinite loop
# Execute in the console directly
fusen::inflate(flat_file = "dev/flat_get_info.Rmd", 
               vignette_name = "Get info about the dataset", 
               overwrite = TRUE, 
               open_vignette = FALSE)
```
