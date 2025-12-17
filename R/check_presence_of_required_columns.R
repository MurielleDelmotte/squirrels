#' Verify if the required columns are present in the dataset
#'
#' long, lat and primary_fur_color are required
#'
#' @param df Data frame. A dataset with squirrels data.
#' @return a boolean
#'
#' @export
#' @examples
#' data("data_demo_squirrels")
#' check_presence_of_required_columns(data_demo_squirrels)

check_presence_of_required_columns <- function(df) {
  required_columns_are_present <- all(
    c("primary_fur_color", "long", "lat") %in% names(df)
  )

  if (isFALSE(required_columns_are_present)) {
    stop("The dataset does not contain the required columns")
  }

  return(required_columns_are_present)

  }
