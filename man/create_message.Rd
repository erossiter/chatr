% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create.R
\name{create_message}
\alias{create_message}
\title{Create a message}
\usage{
create_message(user_id, chatroom_id, content)
}
\arguments{
\item{user_id}{A numeric. The unique ID for the user. Note that the user posting the message does not have to be a member of the chatroom.}

\item{chatroom_id}{A numeric. The unique ID for the chatroom.}

\item{content}{A string.  The message's content.  Visible to all members of the chatroom.}
}
\value{
Returns a list of four elements.  \code{status} is a string indicating whether the API call was successful or not,
\code{error} is a string indicating any error message provided, \code{content} is a dataframe of the content created, and
\code{meta_data} is a list of meta data associated with the API call.
}
\description{
Create a message
}
\examples{

\dontrun{
#create experiment, instruction, user, and chatroom first
create_message(user_id = 1,
               chatroom_id = 1,
               content = "hi")
}

}
