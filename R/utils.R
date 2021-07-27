get_bearer_token <- function () {
  bearer_token <- Sys.getenv("BEARER_TOKEN")
  if (bearer_token == "") {
    stop("ERROR: Missing Bearer Token. Set as an environment variable.")
  }
  return(bearer_token)
}

return_structure <- function (x, delete = F) {

  if (delete) {
    structure(
      list(
        status = x$parsed[[1]],
        error = x$parsed[[2]],
        content = NA,
        meta_data = list(
          path = x$path,
          response = x$resp
        )
      ),
      class = "chatr_class"
    )
  } else {
    # Change all JSON NULL's to NA's
    is.na(x$parsed[[3]]) <- x$parsed[[3]] == "NULL"

    structure(
      list(
        status = x$parsed[[1]],
        error = x$parsed[[2]],
        content = as.data.frame(x$parsed[[3]]),
        meta_data = list(
          path = x$path,
          response = x$resp
        )
      ),
      class = "chatr_class"
    )
  }

}
# return_structure <- function (x) {
#
#   # Change all JSON NULL's to NA's
#   #is.na(x$parsed[[3]]) <- x$parsed[[3]] == "NULL"
#
#   structure(
#     list(
#       content = x$parsed,
#       meta_data = list(
#         path = x$path,
#         response = x$resp
#       )
#     ),
#     class = "chatr_class"
#   )
# }

#' @method print chatr_class
#' @export
print.chatr_class <- function (x, ...) {
  cat("<Chatter ", x$meta_data$path, ">\n",
      "Status: ", x$status, "\n",
      "Error: ", ifelse(is.null(x$error), "none", x$error), "\n",
      sep = "")
  utils::str(x$content)
  invisible(x)
}

#' @keywords internal
call_setup <- function (bearer_token,
                        path) {

  url <- "http://chatter-washu.herokuapp.com"
  headers <- httr::add_headers(Authorization = paste0("Bearer ", bearer_token))
  content <- httr::content_type("application/json; charset=utf-8")
  ua <- httr::user_agent("http://github.com/erossiter/erossiter.github.io")

  # modify URL
  url <- httr::modify_url(url = url, path = path)

  return(list(url = url,
              headers = headers,
              content = content,
              ua = ua))
}

#' @keywords internal
check_resp <- function (resp) {

  if (httr::http_type(resp) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }

  if (resp$status_code == 401) {
    stop("Unathorized. Check your Bearer Token.")
  }

  # TODO: isolate more informative error messages,
  # flag common problems in documentation as well
  #
  # if (resp$status_code == 400) {
  #   stop("Check that:\n
  #        -'topic' and 'name' fields need to be unique.\n
  #        - 'before deleting experiment, delete...'")
  # }

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

  return(parsed)
}

#' @keywords internal
chatter_POST <- function (data_list,
                          bearer_token,
                          path) {

  setup <- call_setup(bearer_token, path)

  # transform R list to JSON
  json <- jsonlite::toJSON(data_list, auto_unbox = T)

  resp <- httr::POST(url = setup$url,
                     body = json,
                     encode = "raw",
                     setup$headers,
                     setup$content,
                     setup$ua)

  parsed <- check_resp(resp)

  return(list(parsed = parsed,
              path = path,
              resp = resp))
}

#' @keywords internal
chatter_PUT <- function (data_list,
                          bearer_token,
                          path) {

  setup <- call_setup(bearer_token, path)

  # transform R list to JSON
  json <- jsonlite::toJSON(data_list, auto_unbox = T)

  resp <- httr::PUT(url = setup$url,
                     body = json,
                     encode = "raw",
                     setup$headers,
                     setup$content,
                     setup$ua)

  parsed <- check_resp(resp)

  return(list(parsed = parsed,
              path = path,
              resp = resp))
}

#' @keywords internal
chatter_GET <- function (bearer_token,
                         path) {

  setup <- call_setup(bearer_token, path)

  resp <- httr::GET(url = setup$url,
                     setup$headers,
                     setup$content,
                     setup$ua)

  parsed <- check_resp(resp)

  return(list(parsed = parsed,
              path = path,
              resp = resp))
}

#' @keywords internal
chatter_DELETE <- function (bearer_token,
                            path) {

  setup <- call_setup(bearer_token, path)

  resp <- httr::DELETE(url = setup$url,
                       setup$headers,
                       setup$content,
                       setup$ua)

  parsed <- check_resp(resp)

  return(list(parsed = parsed,
              path = path,
              resp = resp))
}



