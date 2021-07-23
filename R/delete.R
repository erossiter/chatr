#' Delete an experiment
#'
#' @param bearer_token A string. The researcher's Auth Token found in Chatter online interface > API Credentials.
#' @param experiment_id A numeric. The unique ID for the experiment.
#'
#' @return Returns a list of four elements.  `status` is a string indicating whether the API call was successful or not,
#' `error` is a string indicating any error message provided, `content` is `NA` as no information is created or requested in a DELETE call, and
#' `meta_data` is a list of meta data associated with the API call.
#'
#' @examples
#'
#' \dontrun{
#' delete_experiment(bearer_token = "<your-token-here>")
#' }
#'
#' @export
delete_experiment <- function (bearer_token,
                               experiment_id) {

  path <- paste0("/research/experiments/",
                 experiment_id,
                 ".json")

  out <- chatter_DELETE(bearer_token = bearer_token,
                        path = path)

  return_structure(out, delete = T)
}

#' Delete an instruction
#'
#' @param bearer_token A string. The researcher's Auth Token found in Chatter online interface > API Credentials.
#' @param instruction_id A numeric. The unique ID for the instruction.
#'
#' @return Returns a list of four elements.  `status` is a string indicating whether the API call was successful or not,
#' `error` is a string indicating any error message provided, `content` is `NA` as no information is created or requested in a DELETE call, and
#' `meta_data` is a list of meta data associated with the API call.
#'
#' @note Note you need to delete any chatroom memberships that contain the instruction
#' before you can successfully delete the instruction.
#'
#' @examples
#'
#' \dontrun{
#' delete_instruction(bearer_token = "<your-token-here>")
#' }
#'
#' @export
delete_instruction <- function (bearer_token,
                                instruction_id) {

  path <- paste0("/research/instructions/",
                 instruction_id,
                 ".json")

  out <- chatter_DELETE(bearer_token = bearer_token,
                        path = path)

  return_structure(out, delete = T)
}

#' Delete a chatroom
#'
#' @param bearer_token A string. The researcher's Auth Token found in Chatter online interface > API Credentials.
#' @param chatroom_id A numeric. The unique ID for the chatroom.
#'
#' @return Returns a list of four elements.  `status` is a string indicating whether the API call was successful or not,
#' `error` is a string indicating any error message provided, `content` is `NA` as no information is created or requested in a DELETE call, and
#' `meta_data` is a list of meta data associated with the API call.
#'
#' @examples
#'
#' \dontrun{
#' delete_chatroom(bearer_token = "<your-token-here>")
#' }
#'
#' @export
delete_chatroom <- function (bearer_token,
                             chatroom_id) {

  path <- paste0("/research/chatrooms/",
                 chatroom_id,
                 ".json")

  out <- chatter_DELETE(bearer_token = bearer_token,
                        path = path)

  return_structure(out, delete = T)
}


#' Delete a user
#'
#' @param bearer_token A string. The researcher's Auth Token found in Chatter online interface > API Credentials.
#' @param user_id A numeric. The unique ID for the user.
#'
#' @return Returns a list of four elements.  `status` is a string indicating whether the API call was successful or not,
#' `error` is a string indicating any error message provided, `content` is `NA` as no information is created or requested in a DELETE call, and
#' `meta_data` is a list of meta data associated with the API call.
#'
#' @examples
#'
#' \dontrun{
#' delete_user(bearer_token = "<your-token-here>")
#' }
#'
#' @export
delete_user <- function (bearer_token,
                         user_id) {

  path <- paste0("/research/users/",
                 user_id,
                 ".json")

  out <- chatter_DELETE(bearer_token = bearer_token,
                        path = path)

  return_structure(out, delete = T)
}

#' Delete a chatroom membership
#'
#' @param bearer_token A string. The researcher's Auth Token found in Chatter online interface > API Credentials.
#' @param chatroom_membership_id A numeric. The unique ID for the chatroom membership.
#'
#' @return Returns a list of four elements.  `status` is a string indicating whether the API call was successful or not,
#' `error` is a string indicating any error message provided, `content` is `NA` as no information is created or requested in a DELETE call, and
#' `meta_data` is a list of meta data associated with the API call.
#'
#' @examples
#'
#' \dontrun{
#' delete_chatroom_membership(bearer_token = "<your-token-here>")
#' }
#'
#' @export
delete_chatroom_membership <- function (bearer_token,
                                        chatroom_membership_id) {

  path <- paste0("/research/chatroom_memberships/",
                 chatroom_membership_id,
                 ".json")

  out <- chatter_DELETE(bearer_token = bearer_token,
                        path = path)

  return_structure(out, delete = T)
}

#' Delete a message
#'
#' @param bearer_token A string. The researcher's Auth Token found in Chatter online interface > API Credentials.
#' @param message_id A numeric. The unique ID for the message.
#'
#' @return Returns a list of four elements.  `status` is a string indicating whether the API call was successful or not,
#' `error` is a string indicating any error message provided, `content` is `NA` as no information is created or requested in a DELETE call, and
#' `meta_data` is a list of meta data associated with the API call.
#'
#' @examples
#'
#' \dontrun{
#' delete_message(bearer_token = "<your-token-here>")
#' }
#'
#' @export
delete_message <- function (bearer_token,
                            message_id) {

  path <- paste0("/research/messages/",
                 message_id,
                 ".json")

  out <- chatter_DELETE(bearer_token = bearer_token,
                        path = path)

  return_structure(out, delete = T)
}

