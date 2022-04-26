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
# retrieve_experiment <- function (experiment_id) {
# 
#   path <- paste0("/research/experiments/",
#                  experiment_id,
#                  ".json")
# 
#   bearer_token <- get_bearer_token()
# 
#   out <- chatter_GET(bearer_token = bearer_token,
#                      path = path)
# 
#   return_structure(out)
# }

retrieve_experiment <- function (experiment_id) {
  
  bearer_token <- get_bearer_token()
  
  all_data <- data.frame()
  data_notes_full <- data.frame()
  
  for(i in experiment_id){
    path <- paste0("/research/experiments/",
                   i,
                   ".json")
  
  out <- chatter_GET(bearer_token = bearer_token,
                     path = path)
  print(out)
  print(out$parsed$experiment)
  
  Path <- out$path
  Status <- out$parsed$status
  Error <- out$parsed$error
  Error <- ifelse(is.null(Error), "no error", Error)
  
  all_data <- rbind.data.frame(all_data, as.data.frame(out$parsed$experiment))
  
  data_notes <- data.frame(Path, Status, Error)
  data_notes_full <- rbind.data.frame(data_notes_full, data_notes)}
  
  return(list("content" = all_data,
              "meta_data" = data_notes_full))
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

