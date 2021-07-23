#' Create an experiment
#'
#' @param bearer_token A string. The researcher's Auth Token found in Chatter online interface > API Credentials.
#' @param name A string. The experiment's name
#' @param post_survey_link Optional. A string. A link to direct users to after the chat
#' @param moderator_message Optional. A string. The first message in the chat labeled as the "moderator"
#' @param language Optional. A string. Language of the Chatter features. Defaults to "English" option for "Spanish".
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
create_experiment <- function (bearer_token,
                               name,
                               post_survey_link = NULL,
                               moderator_message = NULL,
                               language = "English") {

  data_list <- list("experiment" = list(
    "name" = name,
    "post_survey_link" = post_survey_link,
    "language" = language,
    "moderator_message" = moderator_message
  ))

  out <- chatter_POST(data_list = data_list,
                       bearer_token = bearer_token)

  structure(
    list(
      content = out$parsed,
      path = out$path,
      response = out$resp
    ),
    class = "chatr_class"
  )
}

#' Create an instruction
#'
#' @param bearer_token A string. The researcher's Auth Token found in Chatter online interface > API Credentials.
#' @param experiment_id A numeric. ...
#' @param name A string. The instruction's name, visible only to the researcher
#' @param text A string.  The instruction's contents visible to the user.  HTML compatible.
#'
#' @return Returns ...
#'
#' @examples
#'
#' \dontrun{
#' create_instruction(bearer_token = "<your-token-here>",
#'                     experiment_id = 1, #create experiment first
#'                     name = "Instructions for My First Experiment",
#'                     text = "Follow these instructions.")
#' }
#'
#' @export
create_instruction <- function (bearer_token,
                               experiment_id,
                               name,
                               text) {

  data_list <- list("instruction" = list(
    "experiment_id" = experiment_id,
    "name" = name,
    "text" = text
  ))

  out <- chatter_POST(data_list = data_list,
                      bearer_token = bearer_token)

  return_structure(out)
}

#' Create a chatroom
#'
#' @param bearer_token A string. The researcher's Auth Token found in Chatter online interface > API Credentials.
#' @param topic A string. Unique identifier for the chatroom. Only visible to researcher.
#' @param min_duration A numeric.  The minimum time in seconds users must spend in the chatroom before the "Done" button is active.
#' @param max_duration A numeric.  The maximum time in seconds users must spend in the chatroom before the "Done" button is active.
#'
#' @return Returns ...
#'
#' @examples
#'
#' \dontrun{
#' create_chatroom(bearer_token = "<your-token-here>",
#'                     topic = "My First Chatroom",
#'                     min_duration = 30,
#'                     max_duration = 600)
#' }
#'
#' @export
create_chatroom <- function (bearer_token,
                                topic,
                                min_duration,
                                max_duration) {

  data_list <- list("chatroom" = list(
    "topic" = topic,
    "slug"= topic,
    "min_duration" = min_duration,
    "max_duration" = max_duration
  ))

  out <- chatter_POST(data_list = data_list,
                      bearer_token = bearer_token)

  return_structure(out)
}

#' Create a user
#'
#' @param bearer_token A string. The researcher's Auth Token found in Chatter online interface > API Credentials.
#' @param username A string. Unique identifier for the user. Only visible to researcher.
#'
#' @return Returns ...
#'
#' @examples
#'
#' \dontrun{
#' create_user(bearer_token = "<your-token-here>",
#'             username = "My First User")
#' }
#'
#' @export
create_user <- function (bearer_token,
                             username) {

  data_list <- list("user" = list(
    "username" = username
  ))

  out <- chatter_POST(data_list = data_list,
                      bearer_token = bearer_token)

  return_structure(out)
}


# Helper functions ----
return_structure <- function (x) {
  structure(
    list(
      content = x$parsed,
      path = x$path,
      response = x$resp
    ),
    class = "chatr_class"
  )
}

print.chatr_class <- function (x, ...) {
  cat("<Chatter ",
      x$path,
      ">\n", sep = "")
  utils::str(x$content)
  invisible(x)
}

chatter_POST <- function (data_list,
                          bearer_token) {

  url <- "http://chatter-washu.herokuapp.com"
  headers <- httr::add_headers(Authorization = paste0("Bearer ", bearer_token))
  content <- httr::content_type("application/json; charset=utf-8")
  ua <- httr::user_agent("http://github.com/erossiter/erossiter.github.io")

  # modify URL
  what <- names(data_list)
  if (what == "experiment") {
    path <- "/research/experiments.json"
  } else if (what == "instruction") {
    path <- "/research/instructions.json"
  } else if (what == "chatroom") {
    path <- "/research/chatrooms.json"
  } else if (what == "user") {
    path <- "/research/users.json"
  } else if (what == "chatroom_membership") {
    path <- "/research/chatroom_memberships.json"
  } else if (what == "message") {
    path <- "/research/messages.json"
  } else {
    stop("TODO: write an error message")
  }
  url <- httr::modify_url(url = url, path = path)

  # transform R list to JSON
  json <- jsonlite::toJSON(data_list, auto_unbox = T)

  resp <- httr::POST(url = url,
                     body = json,
                     encode = "raw",
                     headers,
                     content,
                     ua)

  if (httr::http_type(resp) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }

  parsed <- jsonlite::fromJSON(httr::content(resp, "text"), simplifyVector = T)

  if (httr::http_error(resp)) {
    stop(
      sprintf("Chatter API request failed [%s]\n%s",
        resp$status_code,
        parsed$error
      ),
      call. = FALSE
    )
  }

  return(list(parsed = parsed,
              path = path,
              resp = resp))
}
