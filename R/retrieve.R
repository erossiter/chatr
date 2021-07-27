#' Retrieve an experiment
#'
#' @param experiment_id A numeric. The unique ID for the experiment.
#'
#' @return Returns a list of four elements.  `status` is a string indicating whether the API call was successful or not,
#' `error` is a string indicating any error message provided, `content` is a dataframe of the requested content, and
#' `meta_data` is a list of meta data associated with the API call.
#'
#' @examples
#'
#' \dontrun{
#' retrieve_experiment(experiment_id = 1)
#' }
#'
#' @export
retrieve_experiment <- function (experiment_id) {

  path <- paste0("/research/experiments/",
                 experiment_id,
                 ".json")

  bearer_token <- get_bearer_token()

  out <- chatter_GET(bearer_token = bearer_token,
                     path = path)

  return_structure(out)
}

#' Retrieve an instruction
#'
#' @param instruction_id A numeric. The unique ID for the instruction.
#'
#' @return Returns a list of four elements.  `status` is a string indicating whether the API call was successful or not,
#' `error` is a string indicating any error message provided, `content` is a dataframe of the requested content, and
#' `meta_data` is a list of meta data associated with the API call.
#'
#' @examples
#'
#' \dontrun{
#' retrieve_instruction(instruction_id = 1)
#' }
#'
#' @export
retrieve_instruction <- function (instruction_id) {

  path <- paste0("/research/instructions/",
                 instruction_id,
                 ".json")

  bearer_token <- get_bearer_token()

  out <- chatter_GET(bearer_token = bearer_token,
                     path = path)

  return_structure(out)
}

#' Retrieve a chatroom
#'
#' @param chatroom_id A numeric. The unique ID for the chatroom.
#'
#' @return Returns a list of four elements.  `status` is a string indicating whether the API call was successful or not,
#' `error` is a string indicating any error message provided, `content` is a dataframe of the requested content, and
#' `meta_data` is a list of meta data associated with the API call.
#'
#' @examples
#'
#' \dontrun{
#' retrieve_chatroom(chatroom_id = 1)
#' }
#'
#' @export
retrieve_chatroom <- function (chatroom_id) {

  path <- paste0("/research/chatrooms/",
                 chatroom_id,
                 ".json")

  bearer_token <- get_bearer_token()

  out <- chatter_GET(bearer_token = bearer_token,
                     path = path)

  return_structure(out)
}


#' Retrieve a user
#'
#' @param user_id A numeric. The unique ID for the user.
#'
#' @return Returns a list of four elements.  `status` is a string indicating whether the API call was successful or not,
#' `error` is a string indicating any error message provided, `content` is a dataframe of the requested content, and
#' `meta_data` is a list of meta data associated with the API call.
#'
#' @examples
#'
#' \dontrun{
#' retrieve_user(user_id = 1)
#' }
#'
#' @export
retrieve_user <- function (user_id) {

  path <- paste0("/research/users/",
                 user_id,
                 ".json")

  bearer_token <- get_bearer_token()

  out <- chatter_GET(bearer_token = bearer_token,
                     path = path)

  return_structure(out)
}

#' Retrieve a chatroom membership
#'
#' @param chatroom_membership_id A numeric. The unique ID for the chatroom membership.
#'
#' @return Returns a list of four elements.  `status` is a string indicating whether the API call was successful or not,
#' `error` is a string indicating any error message provided, `content` is a dataframe of the requested content, and
#' `meta_data` is a list of meta data associated with the API call.
#'
#' @examples
#'
#' \dontrun{
#' retrieve_chatroom_membership(chatroom_membership_id = 1)
#' }
#'
#' @export
retrieve_chatroom_membership <- function (chatroom_membership_id) {

  path <- paste0("/research/chatroom_memberships/",
                 chatroom_membership_id,
                 ".json")

  bearer_token <- get_bearer_token()

  out <- chatter_GET(bearer_token = bearer_token,
                     path = path)

  return_structure(out)
}

#' Retrieve a message
#'
#' @param message_id A numeric. The unique ID for the message.
#'
#' @return Returns a list of four elements.  `status` is a string indicating whether the API call was successful or not,
#' `error` is a string indicating any error message provided, `content` is a dataframe of the requested content, and
#' `meta_data` is a list of meta data associated with the API call.
#'
#' @examples
#'
#' \dontrun{
#' retrieve_message(message_id = 1)
#' }
#'
#' @export
retrieve_message<- function (message_id) {

  path <- paste0("/research/messages/",
                 message_id,
                 ".json")

  bearer_token <- get_bearer_token()

  out <- chatter_GET(bearer_token = bearer_token,
                     path = path)

  return_structure(out)
}

