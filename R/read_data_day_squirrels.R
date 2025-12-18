#' Read the data of a given day of observation
#'
#' @param path Character. Path to a folder containing files of the form "nyc_squirrels_dd.xlsx"
#'
#' @importFrom stringr str_extract
#' @importFrom purrr possibly map set_names
#' @importFrom readxl read_excel
#' @return A named list. Each element corresponds to the data of a given day. The element is NULL if the file is corrupted.
#' @export
#'
#' @examples
#' read_data_day_squirrels(path = system.file(package = "squirrels"))
read_data_day_squirrels <- function(path) {
  if (isFALSE(dir.exists(path))) {
    stop("Path does not exist")
  }

  files_to_import <- list.files(
    path,
    pattern = "nyc_squirrels_[0-9][0-9].xlsx",
    full.names = TRUE
  )

  if (length(files_to_import) == 0) {
    stop("There is no files corresponding to raw squirrels data in this folder")
  }

  day_to_import <- str_extract(files_to_import, "[0-9][0-9].xlsx") |>
    gsub(pattern = ".xlsx", replacement = "")


  possi_excel <- possibly(read_excel, otherwise = NULL)

  all_files_imported <- map(.x = files_to_import, .f = possi_excel) |>
    set_names(day_to_import)

  return(all_files_imported)
  }
