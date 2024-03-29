% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/list.R
\name{list_chatrooms}
\alias{list_chatrooms}
\title{List all chatrooms}
\usage{
list_chatrooms()
}
\value{
Returns a list of two elements. \code{content} is a dataframe of the requested content.
\code{meta_data} is a dataframe of meta data associated with the API call for each page of the \code{content} dataframe- \code{path} is a
string indicating the path for each page of data, \code{status} is a string indicating whether the API call was successful
or not, and \code{error} is a string indicating any error message provided.
}
\description{
List all chatrooms
}
\examples{

\dontrun{
list_chatrooms()
}

}
