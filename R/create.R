#' Create an experiment
#'
#' @param bearer_token A string. The researcher's Auth Token found in Chatter online interface > API Credentials.
#' @param name A string. The experiment's name
#' @param post_survey_link Optional. A string. A link to direct users to after the chat
#' @param moderator_message Optional. A string. The first message in the chat labeled as the "moderator"
#' @param language Optional. A string. Language of the Chatter features. Defaults to "English" option for "Spanish".
#'
#' @return Returns ...
#' @export
#'
#' @examples
#'
#' \dontrun{
#' create_experiment(bearer_token = "foo",
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
    class = "chatr_experiment"
  )
}

print.chatr_experiment <- function(x, ...) {
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
  } else if (what == "instructions") {
    path <- "/research/instructions.json"
  } else if (what == "chatrooms") {
    path <- "/research/chatrooms.json"
  } else if (what == "users") {
    path <- "/research/users.json"
  } else if (what == "chatroom_memberships") {
    path <- "/research/chatroom_memberships.json"
  } else if (what == "messages") {
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
      sprintf(
        "GitHub API request failed [%s]\n%s\n<%s>",
        httr::status_code(resp),
        parsed$message,
        parsed$documentation_url
      ),
      call. = FALSE
    )
  }

  return(list(parsed = parsed,
              path = path,
              resp = resp))
}
