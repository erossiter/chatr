#' List all experiments
#'
#' @param bearer_token A string. The researcher's Auth Token found in Chatter online interface > API Credentials.
#'
#' @return Returns a list of four elements.  `status` is a string indicating whether the API call was successful or not,
#' `error` is a string indicating any error message provided, `content` is a dataframe of the requested content, and
#' `meta_data` is a list of meta data associated with the API call.
#'
#' @examples
#'
#' \dontrun{
#' list_experiments(bearer_token = "<your-token-here>")
#' }
#'
#' @export
list_experiments <- function (bearer_token) {

  out <- chatter_GET(bearer_token = bearer_token,
                     path = "/research/experiments.json")

  return_structure(out)
}

#' List all instructions
#'
#' @param bearer_token A string. The researcher's Auth Token found in Chatter online interface > API Credentials.
#'
#' @return Returns a list of four elements.  `status` is a string indicating whether the API call was successful or not,
#' `error` is a string indicating any error message provided, `content` is a dataframe of the requested content, and
#' `meta_data` is a list of meta data associated with the API call.
#'
#' @examples
#'
#' \dontrun{
#' list_instructions(bearer_token = "<your-token-here>")
#' }
#'
#' @export
list_instructions <- function (bearer_token) {

  out <- chatter_GET(bearer_token = bearer_token,
                     path = "/research/instructions.json")

  return_structure(out)
}

#' List all chatrooms
#'
#' @param bearer_token A string. The researcher's Auth Token found in Chatter online interface > API Credentials.
#'
#' @return Returns a list of four elements.  `status` is a string indicating whether the API call was successful or not,
#' `error` is a string indicating any error message provided, `content` is a dataframe of the requested content, and
#' `meta_data` is a list of meta data associated with the API call.
#'
#' @examples
#'
#' \dontrun{
#' list_chatrooms(bearer_token = "<your-token-here>")
#' }
#'
#' @export
list_chatrooms <- function (bearer_token) {

  out <- chatter_GET(bearer_token = bearer_token,
                     path = "/research/chatrooms.json")

  return_structure(out)
}

#' List all users
#'
#' @param bearer_token A string. The researcher's Auth Token found in Chatter online interface > API Credentials.
#'
#' @return Returns a list of four elements.  `status` is a string indicating whether the API call was successful or not,
#' `error` is a string indicating any error message provided, `content` is a dataframe of the requested content, and
#' `meta_data` is a list of meta data associated with the API call.
#'
#' @examples
#'
#' \dontrun{
#' list_users(bearer_token = "<your-token-here>")
#' }
#'
#' @export
list_users <- function (bearer_token) {

  out <- chatter_GET(bearer_token = bearer_token,
                     path = "/research/users.json")

  return_structure(out)
}

#' List all chatroom memberships
#'
#' @param bearer_token A string. The researcher's Auth Token found in Chatter online interface > API Credentials.
#'
#' @return Returns a list of four elements.  `status` is a string indicating whether the API call was successful or not,
#' `error` is a string indicating any error message provided, `content` is a dataframe of the requested content, and
#' `meta_data` is a list of meta data associated with the API call.
#'
#' @examples
#'
#' \dontrun{
#' list_chatroom_memberships(bearer_token = "<your-token-here>")
#' }
#'
#' @export
list_chatroom_memberships <- function (bearer_token) {

  out <- chatter_GET(bearer_token = bearer_token,
                     path = "/research/chatroom_memberships.json")

  return_structure(out)
}


#' List all messages
#'
#' @param bearer_token A string. The researcher's Auth Token found in Chatter online interface > API Credentials.
#'
#' @return Returns a list of four elements.  `status` is a string indicating whether the API call was successful or not,
#' `error` is a string indicating any error message provided, `content` is a dataframe of the requested content, and
#' `meta_data` is a list of meta data associated with the API call.
#'
#' @examples
#'
#' \dontrun{
#' list_messages(bearer_token = "<your-token-here>")
#' }
#'
#' @export
list_messages <- function (bearer_token) {

  out <- chatter_GET(bearer_token = bearer_token,
                     path = "/research/messages.json")

  return_structure(out)
}
