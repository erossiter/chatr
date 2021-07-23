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

#' @method print chatr_class
#' @export
print.chatr_class <- function (x, ...) {
  cat("<Chatter ",
      x$path,
      ">\n", sep = "")
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
