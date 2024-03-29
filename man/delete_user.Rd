% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/delete.R
\name{delete_user}
\alias{delete_user}
\title{Delete a user}
\usage{
delete_user(user_id)
}
\arguments{
\item{user_id}{A numeric. The unique ID for the user or a vector of multiple IDs.}
}
\value{
Returns a list of two elements. \code{content} is \code{NA} as no information is created or requested in a DELETE call.
\code{meta_data} is a list of meta data associated with the API call including the following elements. \code{path} is a
string indicating the path for each deleted object, \code{status} is a string indicating whether the API call was successful
or not, and \code{error} is a string indicating any error message provided.
}
\description{
Delete a user
}
\examples{

\dontrun{
delete_user(user_id = 1)
}

}
