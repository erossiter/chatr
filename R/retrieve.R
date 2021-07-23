#' Retrieve an experiment
#'
#' @param bearer_token A string. The researcher's Auth Token found in Chatter online interface > API Credentials.
#' @param experiment_id A numeric. The unique ID for the experiment.
#'
#' @return Returns a list of four elements.  `status` is a string indicating whether the API call was successful or not,
#' `error` is a string indicating any error message provided, `content` is a dataframe of the requested content, and
#' `meta_data` is a list of meta data associated with the API call.
#'
#' @examples
#'
#' \dontrun{
#' retrieve_experiment(bearer_token = "<your-token-here>")
#' }
#'
#' @export
retrieve_experiment <- function (bearer_token,
                                 experiment_id) {

  path <- paste0("/research/experiments/",
                 experiment_id,
                 ".json")

  out <- chatter_GET(bearer_token = bearer_token,
                     path = path)

  return_structure(out)
}

#' Retrieve an instruction
#'
#' @param bearer_token A string. The researcher's Auth Token found in Chatter online interface > API Credentials.
#' @param instruction_id A numeric. The unique ID for the instruction.
#'
#' @return Returns a list of four elements.  `status` is a string indicating whether the API call was successful or not,
#' `error` is a string indicating any error message provided, `content` is a dataframe of the requested content, and
#' `meta_data` is a list of meta data associated with the API call.
#'
#' @examples
#'
#' \dontrun{
#' retrieve_instruction(bearer_token = "<your-token-here>")
#' }
#'
#' @export
retrieve_instruction <- function (bearer_token,
                                  instruction_id) {

  path <- paste0("/research/instructions/",
                 instruction_id,
                 ".json")

  out <- chatter_GET(bearer_token = bearer_token,
                     path = path)

  return_structure(out)
}

#' Retrieve a chatroom
#'
#' @param bearer_token A string. The researcher's Auth Token found in Chatter online interface > API Credentials.
#' @param chatroom_id A numeric. The unique ID for the chatroom.
#'
#' @return Returns a list of four elements.  `status` is a string indicating whether the API call was successful or not,
#' `error` is a string indicating any error message provided, `content` is a dataframe of the requested content, and
#' `meta_data` is a list of meta data associated with the API call.
#'
#' @examples
#'
#' \dontrun{
#' retrieve_chatroom(bearer_token = "<your-token-here>")
#' }
#'
#' @export
retrieve_chatroom <- function (bearer_token,
                               chatroom_id) {

  path <- paste0("/research/chatrooms/",
                 chatroom_id,
                 ".json")

  out <- chatter_GET(bearer_token = bearer_token,
                     path = path)

  return_structure(out)
}


#' Retrieve a user
#'
#' @param bearer_token A string. The researcher's Auth Token found in Chatter online interface > API Credentials.
#' @param user_id A numeric. The unique ID for the user.
#'
#' @return Returns a list of four elements.  `status` is a string indicating whether the API call was successful or not,
#' `error` is a string indicating any error message provided, `content` is a dataframe of the requested content, and
#' `meta_data` is a list of meta data associated with the API call.
#'
#' @examples
#'
#' \dontrun{
#' retrieve_user(bearer_token = "<your-token-here>")
#' }
#'
#' @export
retrieve_user <- function (bearer_token,
                               user_id) {

  path <- paste0("/research/users/",
                 user_id,
                 ".json")

  out <- chatter_GET(bearer_token = bearer_token,
                     path = path)

  return_structure(out)
}

#' Retrieve a chatroom membership
#'
#' @param bearer_token A string. The researcher's Auth Token found in Chatter online interface > API Credentials.
#' @param chatroom_membership_id A numeric. The unique ID for the chatroom membership.
#'
#' @return Returns a list of four elements.  `status` is a string indicating whether the API call was successful or not,
#' `error` is a string indicating any error message provided, `content` is a dataframe of the requested content, and
#' `meta_data` is a list of meta data associated with the API call.
#'
#' @examples
#'
#' \dontrun{
#' retrieve_chatroom_membership(bearer_token = "<your-token-here>")
#' }
#'
#' @export
retrieve_chatroom_membership <- function (bearer_token,
                                          chatroom_membership_id) {

  path <- paste0("/research/chatroom_memberships/",
                 chatroom_membership_id,
                 ".json")

  out <- chatter_GET(bearer_token = bearer_token,
                     path = path)

  return_structure(out)
}

#' Retrieve a message
#'
#' @param bearer_token A string. The researcher's Auth Token found in Chatter online interface > API Credentials.
#' @param message_id A numeric. The unique ID for the message.
#'
#' @return Returns a list of four elements.  `status` is a string indicating whether the API call was successful or not,
#' `error` is a string indicating any error message provided, `content` is a dataframe of the requested content, and
#' `meta_data` is a list of meta data associated with the API call.
#'
#' @examples
#'
#' \dontrun{
#' retrieve_message(bearer_token = "<your-token-here>")
#' }
#'
#' @export
retrieve_message<- function (bearer_token,
                                          message_id) {

  path <- paste0("/research/messages/",
                 message_id,
                 ".json")

  out <- chatter_GET(bearer_token = bearer_token,
                     path = path)

  return_structure(out)
}

