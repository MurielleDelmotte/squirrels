#' Get a message with number of cols of the dataset you will be working with
#'
#' @param df data.frame. The dataset to be used
#' @importFrom glue glue
#' @return Used for side effect. Outputs a message in the console
#' @export
#' @examples
#' get_df_ncols(df = iris)
get_df_ncols <- function(df) {
  ncol_df <- ncol(df)
  message(glue("The dataset is composed of {ncol_df} columns"))
  return(ncol_df)
}
