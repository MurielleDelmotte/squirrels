#' Check the values of primary fur color
#'
#' @param primary_fur_color Character. A vector with the primary fur color.
#' @return a vector of logicals
#' @export
#' @examples
#' check_plus_in_primary_fur_color(primary_fur_color = c("Black", "Black+Cinnamon", "Cinnamon"))
check_plus_in_primary_fur_color <- function(primary_fur_color) {
  if (isFALSE(is.character(primary_fur_color))) {
    stop("primary_fur_color should be a character")
  }

  colors_are_ok <- !grepl(pattern = "\\+", x = primary_fur_color)

  return(colors_are_ok)
}
