#' Sauvegarde d'un df en csv
#'
#' @param df df a exporter
#' @param path chemin de sortie
#'
#' @importFrom tools file_ext
#' @importFrom readr write_csv2
#' @return le chemin de sortie
#'
#' @export
#' @examples
#' dossier_temp <- tempfile(pattern = "saveascsv")
#' dir.create(dossier_temp)
#' save_as_csv(df = data_demo_squirrels, path = file.path(dossier_temp, "monfichier.csv"))
#' unlink(dossier_temp, recursive = TRUE)
#'
save_as_csv <- function(df, path){

  if (isFALSE(is.data.frame(df))){
    stop("df must be a dataframe")
  }

  if (isFALSE(file_ext(path) == "csv")) {
    stop("File must be a csv")
  }

  if (isFALSE(dir.exists(dirname(path)))) {
    stop("path does not exist")
  }

  write_csv2(df, file = path)

  return(path)

}
