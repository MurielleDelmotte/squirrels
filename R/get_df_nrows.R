#' Get a message with a number of rows in a data frame of interest
#'
#' @param df Dataframe. The dataset to analyze !!!
#' @importFrom glue glue
#' @returns The number of rows and a message in the console
#' @export
#'
#' @examples
#' get_df_nrows(df = iris)
#' get_df_nrows(df = mtcars)
get_df_nrows <- function(df) {
  nrow_df <- nrow(df)

  message(glue("The dataset is composed of {nrow_df} observations"))

  return(nrow_df)
}
