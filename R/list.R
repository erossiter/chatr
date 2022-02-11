#' List all experiments
#'
#'
#' @return Returns a list of four elements.  `status` is a string indicating whether the API call was successful or not,
#' `error` is a string indicating any error message provided, `content` is a dataframe of the requested content, and
#' `meta_data` is a list of meta data associated with the API call.
#'
#' @examples
#'
#' \dontrun{
#' list_experiments()
#' }
#'
#' @export
list_experiments <- function () {

  bearer_token <- get_bearer_token()

  out <- chatter_GET(bearer_token = bearer_token,
                     path = "/research/experiments.json")

  return_structure(out)
}

#' List all instructions
#'
#'
#' @return Returns a list of four elements.  `status` is a string indicating whether the API call was successful or not,
#' `error` is a string indicating any error message provided, `content` is a dataframe of the requested content, and
#' `meta_data` is a list of meta data associated with the API call.
#'
#' @examples
#'
#' \dontrun{
#' list_instructions()
#' }
#'
#' @export
list_instructions <- function () {

  bearer_token <- get_bearer_token()

  out <- chatter_GET(bearer_token = bearer_token,
                     path = "/research/instructions.json")

  return_structure(out)
}

#' List all chatrooms
#'
#'
#' @return Returns a list of four elements.  `status` is a string indicating whether the API call was successful or not,
#' `error` is a string indicating any error message provided, `content` is a dataframe of the requested content, and
#' `meta_data` is a list of meta data associated with the API call.
#'
#' @examples
#'
#' \dontrun{
#' list_chatrooms()
#' }
#'
#' @export
list_chatrooms <- function () {
  
  bearer_token <- get_bearer_token()
  
  keep_paginating <- TRUE
  page <- 0
  all_data <- data.frame()
  while(keep_paginating){
    page <- page + 1
    
    # get data for each page
    out_raw <- chatter_GET(bearer_token = bearer_token,
                           path = paste0("/research/chatrooms.json?page=", page))
    out_clean <- return_structure(out_raw)
    
    ##### TODO:
    ##### 1. look for errors, aggregate meta-data
    ##### 2. return all info from (1) nicely
    ##### 3. Maybe a nice message on progress for the user
    ##### .... even something they can turn on or off
    
    # append page's data to full data set
    all_data <- rbind.data.frame(all_data, out_clean$content) 
    
    # check if the page's data is empty,
    # if so, stop while loop
    if(ncol(out_clean$content)==0 & nrow(out_clean$content)==0){
      keep_paginating <- FALSE
    }
  }
  
  return(all_data)
}

#' List all users
#'
#'
#' @return Returns a list of four elements.  `status` is a string indicating whether the API call was successful or not,
#' `error` is a string indicating any error message provided, `content` is a dataframe of the requested content, and
#' `meta_data` is a list of meta data associated with the API call.
#'
#' @examples
#'
#' \dontrun{
#' list_users()
#' }
#'
#' @export
list_users <- function () {

  bearer_token <- get_bearer_token()

  out <- chatter_GET(bearer_token = bearer_token,
                     path = "/research/users.json")

  return_structure(out)
}

#' List all chatroom memberships
#'
#'
#' @return Returns a list of four elements.  `status` is a string indicating whether the API call was successful or not,
#' `error` is a string indicating any error message provided, `content` is a dataframe of the requested content, and
#' `meta_data` is a list of meta data associated with the API call.
#'
#' @examples
#'
#' \dontrun{
#' list_chatroom_memberships()
#' }
#'
#' @export
list_chatroom_memberships <- function () {

  bearer_token <- get_bearer_token()

  out <- chatter_GET(bearer_token = bearer_token,
                     path = "/research/chatroom_memberships.json")

  return_structure(out)
}


#' List all messages
#'
#'
#' @return Returns a list of four elements.  `status` is a string indicating whether the API call was successful or not,
#' `error` is a string indicating any error message provided, `content` is a dataframe of the requested content, and
#' `meta_data` is a list of meta data associated with the API call.
#'
#' @examples
#'
#' \dontrun{
#' list_messages()
#' }
#'
#' @export
list_messages <- function () {

  bearer_token <- get_bearer_token()

  out <- chatter_GET(bearer_token = bearer_token,
                     path = "/research/messages.json")

  return_structure(out)
}
