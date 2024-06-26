% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read_multiple_data.R
\name{read_multiple_data}
\alias{read_multiple_data}
\title{read_multiple_data Title}
\usage{
read_multiple_data(path)
}
\arguments{
\item{path}{le chemin}
}
\value{
une liste de fichiers lus
}
\description{
read_multiple_data Title
}
\examples{
library(purrr)
tabs <- read_multiple_data(path = system.file(package = "squirrels"))


ttt <- tabs |>
  map(nrow)

unlist(ttt["19"])

ttt["19"]
ttt[["19"]]


tabs |>
  compact() |>
  map(nrow)

}
