#' Filter the data based on the quality of the primary fur color and the coordinates
#'
#' @param df_squirrels Data frame. A dataset with squirrels data.
#' @importFrom dplyr mutate case_when filter
#' @return A list with 3 elements (df_valid_data, df_invalid_data, df_missing_data) based on their integrity (color and coordinates)
#' @export
#'
#' @examples
filter_squirrels_data_based_on_integrity <- function(df_squirrels) {
  # Check if the required columns are present
  columns_are_present <- check_presence_of_required_columns(df_squirrels)

  # Check if the colors are ok
  colors_are_ok <- check_plus_in_primary_fur_color(df_squirrels$primary_fur_color)

  colors_are_ok[is.na(df_squirrels$primary_fur_color)] <- NA

  # Check if the coordinates are ok
  coordinates_are_ok <- check_coordinates(df_squirrels$lat, df_squirrels$long)

  df_squirrels_with_type <- df_squirrels |>
    mutate(type = case_when(
      is.na(colors_are_ok) | is.na(coordinates_are_ok) ~ "missing",
      colors_are_ok & coordinates_are_ok ~ "valid",
      !colors_are_ok | !coordinates_are_ok ~ "invalid"
    ))

  valid_data <- df_squirrels_with_type |>
    filter(type == "valid")
  invalid_data <- df_squirrels_with_type |>
    filter(type == "invalid")
  missing_data <- df_squirrels_with_type |>
    filter(type == "missing")


  return(
    list(
      df_valid_data = valid_data,
      df_invalid_data = invalid_data,
      df_missing_data = missing_data
    )
  )
}
