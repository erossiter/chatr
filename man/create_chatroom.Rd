% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create.R
\name{create_chatroom}
\alias{create_chatroom}
\title{Create a chatroom}
\usage{
create_chatroom(bearer_token, topic, min_duration, max_duration)
}
\arguments{
\item{bearer_token}{A string. The researcher's Auth Token found in Chatter online interface > API Credentials.}

\item{topic}{A string. Unique identifier for the chatroom. Only visible to researcher.}

\item{min_duration}{A numeric.  The minimum time in seconds users must spend in the chatroom before the "Done" button is active.}

\item{max_duration}{A numeric.  The maximum time in seconds users must spend in the chatroom before the "Done" button is active.}
}
\value{
Returns ...
}
\description{
Create a chatroom
}
\examples{

\dontrun{
create_chatroom(bearer_token = "<your-token-here>",
                    topic = "My First Chatroom",
                    min_duration = 30,
                    max_duration = 600)
}

}