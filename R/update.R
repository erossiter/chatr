#' Update an experiment
#'
#' @param bearer_token A string. The researcher's Auth Token found in Chatter online interface > API Credentials.
#' @param experiment_id A numeric. The unique ID for the experiment.
#' @param name Optional. A string. The experiment's name.
#' @param post_survey_link Optional. A string. A link to direct users to after the chat
#' @param moderator_message Optional. A string. The first message in the chat labeled as the "moderator"
#' @param language Optional. A string. Language of the Chatter features. Defaults to "English" option for "Spanish".
#'
#' @return Returns ...
#'
#' @examples
#'
#' \dontrun{
#' update_experiment(bearer_token = "<your-token-here>",
#'                   experiment_id = 1,
#'                   name = "New Name for Experiment")
#' }
#'
#' @export
update_experiment <- function (bearer_token,
                               experiment_id,
                               name = NULL,
                               post_survey_link = NULL,
                               moderator_message = NULL,
                               language = NULL) {

  data_list <- list("experiment" = list(
    "name" = name,
    "post_survey_link" = post_survey_link,
    "language" = language,
    "moderator_message" = moderator_message
  ))

  path <- paste0("/research/experiments/",
                 experiment_id,
                 ".json")

  out <- chatter_PUT(data_list = data_list,
                      bearer_token = bearer_token,
                      path = path)

  return_structure(out)
}

#' Update an instruction
#'
#' @param bearer_token A string. The researcher's Auth Token found in Chatter online interface > API Credentials.
#' @param instruction_id A numeric. A numeric. The unique ID for the instruction.
#' @param experiment_id Optional. A numeric. The unique ID for the experiment.
#' @param name Optional. A string. The instruction's name. Visible only to the researcher
#' @param text Optional. A string.  The instruction's contents.  Visible to the user.  HTML compatible.
#'
#' @return Returns ...
#'
#' @examples
#'
#' \dontrun{
#' update_instruction(bearer_token = "<your-token-here>",
#'                    instruction_id = 1,
#'                    name = "New Name for Instruction")
#' }
#'
#' @export
update_instruction <- function (bearer_token,
                                instruction_id,
                                experiment_id = NULL,
                                name = NULL,
                                text = NULL) {

  data_list <- list("instruction" = list(
    "experiment_id" = experiment_id,
    "name" = name,
    "text" = text
  ))

  path <- paste0("/research/instructions/",
                 instruction_id,
                 ".json")

  out <- chatter_PUT(data_list = data_list,
                      bearer_token = bearer_token,
                      path = path)

  return_structure(out)
}

#' Update a chatroom
#'
#' @param bearer_token A string. The researcher's Auth Token found in Chatter online interface > API Credentials.
#' @param chatroom_id A numeric. The unique ID for the chatroom.
#' @param topic Optional. A string. Unique identifier for the chatroom. Only visible to researcher.
#' @param min_duration Optional. A numeric.  The minimum time in seconds users must spend in the chatroom before the "Done" button is active.
#' @param max_duration Optional. A numeric.  The maximum time in seconds users must spend in the chatroom before the "Done" button is active.
#'
#' @return Returns ...
#'
#' @examples
#'
#' \dontrun{
#' update_chatroom(bearer_token = "<your-token-here>",
#'                 chatroom_id = "1",
#'                 max_duration = 900)
#' }
#'
#' @export
update_chatroom <- function (bearer_token,
                             chatroom_id,
                             topic = NULL,
                             min_duration = NULL,
                             max_duration = NULL) {

  data_list <- list("chatroom" = list(
    "topic" = topic,
    "slug"= topic,
    "min_duration" = min_duration,
    "max_duration" = max_duration
  ))

  path <- paste0("/research/chatrooms/",
                 chatroom_id,
                 ".json")

  out <- chatter_PUT(data_list = data_list,
                      bearer_token = bearer_token,
                      path = path)

  return_structure(out)
}

#' Update a user
#'
#' @param bearer_token A string. The researcher's Auth Token found in Chatter online interface > API Credentials.
#' @param user_id A numeric. The unique ID for the user.
#' @param username Optional. A string. Unique identifier for the user. Only visible to researcher.
#'
#' @return Returns ...
#'
#' @examples
#'
#' \dontrun{
#' update_user(bearer_token = "<your-token-here>",
#'             user_id = 1,
#'             username = "New Username")
#' }
#'
#' @export
update_user <- function (bearer_token,
                         user_id,
                         username = NULL) {

  data_list <- list("user" = list(
    "username" = username
  ))

  path <- paste0("/research/users/",
                 user_id,
                 ".json")

  out <- chatter_PUT(data_list = data_list,
                      bearer_token = bearer_token,
                      path = path)

  return_structure(out)
}


#' Update a chatroom membership
#'
#' @param bearer_token A string. The researcher's Auth Token found in Chatter online interface > API Credentials.
#' @param chatroom_membership_id A numeric. The unique ID for the chatroom membership.
#' @param user_id Optional. A numeric. The unique ID for the user.
#' @param chatroom_id Optional. A numeric. The unique ID for the chatroom.
#' @param instruction_id Optional. A numeric. The unique ID for the instruction.
#'
#' @return Returns ...
#'
#' @examples
#'
#' \dontrun{
#' update_chatroom_membership(bearer_token = "<your-token-here>",
#'                            chatroom_membership_id = 1,
#'                            instruction_id = 2) # Change instructions
#' }
#'
#' @export
update_chatroom_membership <- function (bearer_token,
                                        chatroom_membership_id,
                                        user_id = NULL,
                                        chatroom_id = NULL,
                                        instruction_id = NULL) {

  data_list <- list("chatroom_membership" = list(
    "user_id" = user_id,
    "chatroom_id" = chatroom_id,
    "instruction_id" = instruction_id
  ))

  path <- paste0("/research/chatroom_memberships/",
                 chatroom_membership_id,
                 ".json")

  out <- chatter_PUT(data_list = data_list,
                      bearer_token = bearer_token,
                      path = path)

  return_structure(out)
}


#' Update a message
#'
#' @param bearer_token A string. The researcher's Auth Token found in Chatter online interface > API Credentials.
#' @param message_id A numeric. The unique ID for the message.
#' @param user_id Optional. A numeric. The unique ID for the user. Note that the user posting the message does not have to be a member of the chatroom.
#' @param chatroom_id Optional. A numeric. The unique ID for the chatroom.
#' @param content Optional. A string.  The message's content.  Visible to all members of the chatroom.
#'
#' @return Returns ...
#'
#' @examples
#'
#' \dontrun{
#' update_message(bearer_token = "<your-token-here>",
#'                message_id = 1,
#'                content = "updated message content")
#' }
#'
#' @export
update_message <- function (bearer_token,
                            message_id,
                            user_id = NULL,
                            chatroom_id = NULL,
                            content = NULL) {

  data_list <- list("message" = list(
    "user_id" = user_id,
    "chatroom_id" = chatroom_id,
    "content" = content
  ))

  path <- paste0("/research/messages/",
                 message_id,
                 ".json")

  out <- chatter_PUT(data_list = data_list,
                      bearer_token = bearer_token,
                      path = path)

  return_structure(out)
}
