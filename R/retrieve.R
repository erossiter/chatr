#' Create an experiment
#'
#' @param bearer_token A string. The researcher's Auth Token found in Chatter online interface > API Credentials.
#' @param experiment_id asdf
#'
#' @return Returns ...
#'
#' @examples
#'
#' \dontrun{
#' create_experiment(bearer_token = "<your-token-here>",
#'                   name = "My First Experiment")
#' }
#'
#' @export
retrieve_experiment <- function (bearer_token,
                            experiment_id) {

  path <- paste0("/research/experiments",
                 experiment_id,
                 ".json")

  out <- chatter_GET(bearer_token = bearer_token,
                     path = path)

  structure(
    list(
      content = out$parsed,
      path = out$path,
      response = out$resp
    ),
    class = "chatr_class"
  )
}

#' #' Create an instruction
#' #'
#' #' @param bearer_token A string. The researcher's Auth Token found in Chatter online interface > API Credentials.
#' #' @param experiment_id An integer. The unique ID for the experiment.
#' #' @param name A string. The instruction's name. Visible only to the researcher
#' #' @param text A string.  The instruction's contents.  Visible to the user.  HTML compatible.
#' #'
#' #' @return Returns ...
#' #'
#' #' @examples
#' #'
#' #' \dontrun{
#' #' create_instruction(bearer_token = "<your-token-here>",
#' #'                    experiment_id = 1, # create experiment first
#' #'                    name = "Instructions for My First Experiment",
#' #'                    text = "Follow these instructions.")
#' #' }
#' #'
#' #' @export
#' create_instruction <- function (bearer_token,
#'                                experiment_id,
#'                                name,
#'                                text) {
#'
#'   data_list <- list("instruction" = list(
#'     "experiment_id" = experiment_id,
#'     "name" = name,
#'     "text" = text
#'   ))
#'
#'   out <- chatter_POST(data_list = data_list,
#'                       bearer_token = bearer_token,
#'                       path = "/research/instructions.json")
#'
#'   return_structure(out)
#' }
#'
#' #' Create a chatroom
#' #'
#' #' @param bearer_token A string. The researcher's Auth Token found in Chatter online interface > API Credentials.
#' #' @param topic A string. Unique identifier for the chatroom. Only visible to researcher.
#' #' @param min_duration A numeric.  The minimum time in seconds users must spend in the chatroom before the "Done" button is active.
#' #' @param max_duration A numeric.  The maximum time in seconds users must spend in the chatroom before the "Done" button is active.
#' #'
#' #' @return Returns ...
#' #'
#' #' @examples
#' #'
#' #' \dontrun{
#' #' create_chatroom(bearer_token = "<your-token-here>",
#' #'                 topic = "My First Chatroom",
#' #'                 min_duration = 30,
#' #'                 max_duration = 600)
#' #' }
#' #'
#' #' @export
#' create_chatroom <- function (bearer_token,
#'                                 topic,
#'                                 min_duration,
#'                                 max_duration) {
#'
#'   data_list <- list("chatroom" = list(
#'     "topic" = topic,
#'     "slug"= topic,
#'     "min_duration" = min_duration,
#'     "max_duration" = max_duration
#'   ))
#'
#'   out <- chatter_POST(data_list = data_list,
#'                       bearer_token = bearer_token,
#'                       path = "/research/chatrooms.json")
#'
#'   return_structure(out)
#' }
#'
#' #' Create a user
#' #'
#' #' @param bearer_token A string. The researcher's Auth Token found in Chatter online interface > API Credentials.
#' #' @param username A string. Unique identifier for the user. Only visible to researcher.
#' #'
#' #' @return Returns ...
#' #'
#' #' @examples
#' #'
#' #' \dontrun{
#' #' create_user(bearer_token = "<your-token-here>",
#' #'             username = "My First User")
#' #' }
#' #'
#' #' @export
#' create_user <- function (bearer_token,
#'                              username) {
#'
#'   data_list <- list("user" = list(
#'     "username" = username
#'   ))
#'
#'   out <- chatter_POST(data_list = data_list,
#'                       bearer_token = bearer_token,
#'                       path = "/research/users.json")
#'
#'   return_structure(out)
#' }
#'
#'
#' #' Create a chatroom membership
#' #'
#' #' @param bearer_token A string. The researcher's Auth Token found in Chatter online interface > API Credentials.
#' #' @param user_id An integer. The unique ID for the user.
#' #' @param chatroom_id An integer. The unique ID for the chatroom.
#' #' @param instruction_id An integer. The unique ID for the instruction.
#' #'
#' #' @return Returns ...
#' #'
#' #' @examples
#' #'
#' #' \dontrun{
#' #' #create experiment, instruction, user, and chatroom first
#' #' create_chatroom_membership(bearer_token = "<your-token-here>",
#' #'                            user_id = 1,
#' #'                            chatroom_id = 1,
#' #'                            instruction_id = 1)
#' #' }
#' #'
#' #' @export
#' create_chatroom_membership <- function (bearer_token,
#'                                         user_id,
#'                                         chatroom_id,
#'                                         instruction_id) {
#'
#'   data_list <- list("chatroom_membership" = list(
#'     "user_id" = user_id,
#'     "chatroom_id" = chatroom_id,
#'     "instruction_id" = instruction_id
#'   ))
#'
#'   out <- chatter_POST(data_list = data_list,
#'                       bearer_token = bearer_token,
#'                       path = "/research/chatroom_memberships.json")
#'
#'   return_structure(out)
#' }
#'
#'
#' #' Create a message
#' #'
#' #' @param bearer_token A string. The researcher's Auth Token found in Chatter online interface > API Credentials.
#' #' @param user_id An integer. The unique ID for the user. Note that the user posting the message does not have to be a member of the chatroom.
#' #' @param chatroom_id An integer. The unique ID for the chatroom.
#' #' @param content A string.  The message's content.  Visible to all members of the chatroom.
#' #'
#' #' @return Returns ...
#' #'
#' #' @examples
#' #'
#' #' \dontrun{
#' #' #create experiment, instruction, user, and chatroom first
#' #' create_message(bearer_token = "<your-token-here>",
#' #'                user_id = 1,
#' #'                chatroom_id = 1,
#' #'                content = "hi")
#' #' }
#' #'
#' #' @export
#' create_message <- function (bearer_token,
#'                             user_id,
#'                             chatroom_id,
#'                             content) {
#'
#'   data_list <- list("message" = list(
#'     "user_id" = user_id,
#'     "chatroom_id" = chatroom_id,
#'     "content" = content
#'   ))
#'
#'   out <- chatter_POST(data_list = data_list,
#'                       bearer_token = bearer_token,
#'                       path = "/research/messages.json")
#'
#'   return_structure(out)
#' }
