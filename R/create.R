#' Create an experiment
#'
#' @param name A string. The experiment's name.
#' @param post_survey_link Optional. A string. A link to direct users to after the chat
#' @param moderator_message Optional. A string. The first message in the chat labeled as the "moderator"
#' @param language Optional. A string. Language of the Chatter features. Defaults to "English" option for "Spanish".
#'
#' @return Returns a list of four elements.  `status` is a string indicating whether the API call was successful or not,
#' `error` is a string indicating any error message provided, `content` is a dataframe of the content created, and
#' `meta_data` is a list of meta data associated with the API call.
#'
#' @examples
#'
#' \dontrun{
#' create_experiment(name = "My First Experiment")
#' }
#'
#' @export
create_experiment <- function (name,
                               post_survey_link = NULL,
                               moderator_message = NULL,
                               language = "English") {

  data_list <- list("experiment" = list(
    "name" = name,
    "post_survey_link" = post_survey_link,
    "language" = language,
    "moderator_message" = moderator_message
  ))

  bearer_token <- get_bearer_token()

  out <- chatter_POST(data_list = data_list,
                      bearer_token = bearer_token,
                      path = "/research/experiments.json")

  return_structure(out)
}

#' Create an instruction
#'
#' @param experiment_id A numeric. The unique ID for the experiment.
#' @param name A string. The instruction's name. Visible only to the researcher
#' @param text A string.  The instruction's contents.  Visible to the user.  HTML compatible.
#'
#' @return Returns a list of four elements.  `status` is a string indicating whether the API call was successful or not,
#' `error` is a string indicating any error message provided, `content` is a dataframe of the content created, and
#' `meta_data` is a list of meta data associated with the API call.
#'
#' @examples
#'
#' \dontrun{
#' create_instruction(experiment_id = 1, # create experiment first
#'                    name = "Instructions for My First Experiment",
#'                    text = "Follow these instructions.")
#' }
#'
#' @export
create_instruction <- function (experiment_id,
                               name,
                               text) {

  data_list <- list("instruction" = list(
    "experiment_id" = experiment_id,
    "name" = name,
    "text" = text
  ))

  bearer_token <- get_bearer_token()

  out <- chatter_POST(data_list = data_list,
                      bearer_token = bearer_token,
                      path = "/research/instructions.json")

  return_structure(out)
}

#' Create a chatroom
#'
#' @param topic A string. Unique identifier for the chatroom. Only visible to researcher.
#' @param min_duration A numeric.  The minimum time in seconds users must spend in the chatroom before the "Done" button is active.
#' @param max_duration A numeric.  The maximum time in seconds users must spend in the chatroom before the "Done" button is active.
#'
#' @return Returns a list of four elements.  `status` is a string indicating whether the API call was successful or not,
#' `error` is a string indicating any error message provided, `content` is a dataframe of the content created, and
#' `meta_data` is a list of meta data associated with the API call.
#'
#' @examples
#'
#' \dontrun{
#' create_chatroom(topic = "My First Chatroom",
#'                 min_duration = 30,
#'                 max_duration = 600)
#' }
#'
#' @export
create_chatroom <- function (topic,
                                min_duration = NULL,
                                max_duration = NULL) {

  data_list <- list("chatroom" = list(
    "topic" = topic,
    "slug"= topic,
    "min_duration" = min_duration,
    "max_duration" = max_duration
  ))

  bearer_token <- get_bearer_token()

  out <- chatter_POST(data_list = data_list,
                      bearer_token = bearer_token,
                      path = "/research/chatrooms.json")

  return_structure(out)
}

#' Create a user
#'
#' @param username A string. Unique identifier for the user. The name they would use to log in to Chatter (optional).
#'
#' @return Returns a list of four elements.  `status` is a string indicating whether the API call was successful or not,
#' `error` is a string indicating any error message provided, `content` is a dataframe of the content created, and
#' `meta_data` is a list of meta data associated with the API call.
#'
#' @examples
#'
#' \dontrun{
#' create_user(username = "My First User")
#' }
#'
#' @export
create_user <- function (username) {

  data_list <- list("user" = list(
    "username" = username
  ))

  bearer_token <- get_bearer_token()

  out <- chatter_POST(data_list = data_list,
                      bearer_token = bearer_token,
                      path = "/research/users.json")

  return_structure(out)
}


#' Create a chatroom membership
#'
#' @param user_id A numeric. The unique ID for the user.
#' @param chatroom_id A numeric. The unique ID for the chatroom.
#' @param instruction_id A numeric. The unique ID for the instruction.
#' @param display_name Optional. A string. The name other chatroom members see associated with the user's messages.
#'
#' @return Returns a list of four elements.  `status` is a string indicating whether the API call was successful or not,
#' `error` is a string indicating any error message provided, `content` is a dataframe of the content created, and
#' `meta_data` is a list of meta data associated with the API call.
#'
#' @examples
#'
#' \dontrun{
#' #create experiment, instruction, user, and chatroom first
#' create_chatroom_membership(user_id = 1,
#'                            chatroom_id = 1,
#'                            instruction_id = 1)
#' }
#'
#' @export
create_chatroom_membership <- function (user_id,
                                        chatroom_id,
                                        instruction_id,
                                        display_name = NULL) {

  data_list <- list("chatroom_membership" = list(
    "user_id" = user_id,
    "chatroom_id" = chatroom_id,
    "instruction_id" = instruction_id,
    "display_name" = display_name
  ))

  bearer_token <- get_bearer_token()

  out <- chatter_POST(data_list = data_list,
                      bearer_token = bearer_token,
                      path = "/research/chatroom_memberships.json")

  return_structure(out)
}


#' Create a message
#'
#' @param user_id A numeric. The unique ID for the user. Note that the user posting the message does not have to be a member of the chatroom.
#' @param chatroom_id A numeric. The unique ID for the chatroom.
#' @param content A string.  The message's content.  Visible to all members of the chatroom.
#'
#' @return Returns a list of four elements.  `status` is a string indicating whether the API call was successful or not,
#' `error` is a string indicating any error message provided, `content` is a dataframe of the content created, and
#' `meta_data` is a list of meta data associated with the API call.
#'
#' @examples
#'
#' \dontrun{
#' #create experiment, instruction, user, and chatroom first
#' create_message(user_id = 1,
#'                chatroom_id = 1,
#'                content = "hi")
#' }
#'
#' @export
create_message <- function (user_id,
                            chatroom_id,
                            content) {

  data_list <- list("message" = list(
    "user_id" = user_id,
    "chatroom_id" = chatroom_id,
    "content" = content
  ))

  bearer_token <- get_bearer_token()

  out <- chatter_POST(data_list = data_list,
                      bearer_token = bearer_token,
                      path = "/research/messages.json")

  return_structure(out)
}
