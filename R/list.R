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
  
  keep_paginating <- TRUE
  page <- 0
  all_data <- data.frame()
  data_notes_full <- data.frame()
  while(keep_paginating){
    page <- page + 1
    
    # get data for each page
    out_raw <- chatter_GET(bearer_token = bearer_token,
                     path = paste0("/research/experiments.json?page=", page))
                     
    #out_clean <- return_structure(out_raw) 
    
    Path <- out_raw$path
    Status <- out_raw$parsed$status
    Error <- out_raw$parsed$error
    Error <- ifelse(is.null(Error), "no error", Error)
    data_notes <- data.frame(Path, Status, Error)
    data_notes_full <- rbind.data.frame(data_notes_full, data_notes)
    
    # TODO: 
    # Separate dataframe
    # out_raw$path
    # out_raw$parsed$status
    # out_raw$parsed$error
    
    # append page's data to full data set
    all_data <- rbind.data.frame(all_data, out_raw$parsed$experiments) 
    
    # check if the page's data is empty,
    # if so, stop while loop
    #if(ncol(out_raw$parsed$experiments)==0 & nrow(out_raw$parsed$experiments)==0){
    if(length(out_raw$parsed$experiments) == 0){
      keep_paginating <- FALSE
    }
  }
  
  return(list("all_data" = all_data,
              "meta_data" = data_notes_full))
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
  
  keep_paginating <- TRUE
  page <- 0
  all_data <- data.frame()
  data_notes_full <- data.frame()
  while(keep_paginating){
    page <- page + 1

    # get data for each page
    out_raw <- chatter_GET(bearer_token = bearer_token,
                     path = paste0("/research/instructions.json?page=", page))
    #out_clean <- return_structure(out_raw)
    
    Path <- out_raw$path
    print(Path)
    Status <- out_raw$parsed$status
    Error <- out_raw$parsed$error
    Error <- ifelse(is.null(Error), "no error", Error)
    data_notes <- data.frame(Path, Status, Error)
    data_notes_full <- rbind.data.frame(data_notes_full, data_notes)
  
    # append page's data to full data set
    all_data <- rbind.data.frame(all_data, out_clean$content) 
    
    # check if the page's data is empty,
    # if so, stop while loop
    if(length(out_raw$parsed$experiments) == 0){
      keep_paginating <- FALSE
    }
  
  }
  return(list("all_data" = all_data,
              "meta_data" = data_notes_full))
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
  data_notes_full <- data.frame()
  while(keep_paginating){
    page <- page + 1
    
    # get data for each page
    out_raw <- chatter_GET(bearer_token = bearer_token,
                           path = paste0("/research/chatrooms.json?page=", page))
    #out_clean <- return_structure(out_raw)
    
    Path <- out_raw$path
    Status <- out_raw$parsed$status
    Error <- out_raw$parsed$error
    Error <- ifelse(is.null(Error), "no error", Error)
    data_notes <- data.frame(Path, Status, Error)
    data_notes_full <- rbind.data.frame(data_notes_full, data_notes)
    
    ##### TODO:
    ##### 1. look for errors, aggregate meta-data
    ##### 2. return all info from (1) nicely
    ##### 3. Maybe a nice message on progress for the user
    ##### .... even something they can turn on or off
    
    # append page's data to full data set
    all_data <- rbind.data.frame(all_data, out_clean$content) 
    
    # check if the page's data is empty,
    # if so, stop while loop
    if(length(out_raw$parsed$experiments) == 0){
      keep_paginating <- FALSE
    }
  }
  
  return(list("all_data" = all_data,
              "meta_data" = data_notes_full))
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
  
  keep_paginating <- TRUE
  page <- 0
  all_data <- data.frame()
  data_notes_full <- data.frame()
  while(keep_paginating){
    page <- page + 1
    
    # get data for each page
    out_raw <- chatter_GET(bearer_token = bearer_token,
                     path = paste0("/research/users.json?page=", page))
    #out_clean <- return_structure(out_raw)
    
    Path <- out_raw$path
    Status <- out_raw$parsed$status
    Error <- out_raw$parsed$error
    Error <- ifelse(is.null(Error), "no error", Error)
    data_notes <- data.frame(Path, Status, Error)
    data_notes_full <- rbind.data.frame(data_notes_full, data_notes)
  
    # append page's data to full data set
    all_data <- rbind.data.frame(all_data, out_clean$content) 
  
    # check if the page's data is empty,
    # if so, stop while loop
    if(length(out_raw$parsed$experiments) == 0){
      keep_paginating <- FALSE
    }
  }
  
  return(list("all_data" = all_data,
              "meta_data" = data_notes_full))
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
  
  keep_paginating <- TRUE
  page <- 0
  all_data <- data.frame()
  data_notes_full <- data.frame()
  while(keep_paginating){
    page <- page + 1
    
    # get data for each page
    out_raw <- chatter_GET(bearer_token = bearer_token,
                     path = paste0("/research/chatroom_memberships.json?page=", page))
    #out_clean <- return_structure(out_raw)
    
    Path <- out_raw$path
    Status <- out_raw$parsed$status
    Error <- out_raw$parsed$error
    Error <- ifelse(is.null(Error), "no error", Error)
    data_notes <- data.frame(Path, Status, Error)
    data_notes_full <- rbind.data.frame(data_notes_full, data_notes)
    
    # append page's data to full data set
    all_data <- rbind.data.frame(all_data, out_clean$content) 
    
    # check if the page's data is empty,
    # if so, stop while loop
    if(length(out_raw$parsed$experiments) == 0){
      keep_paginating <- FALSE
    }
  }
  
  return(list("all_data" = all_data,
              "meta_data" = data_notes_full))
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
  
  keep_paginating <- TRUE
  page <- 0
  all_data <- data.frame()
  data_notes_full <- data.frame()
  while(keep_paginating){
    page <- page + 1
    
    # get data for each page
    out_raw <- chatter_GET(bearer_token = bearer_token,
                     path = paste0("/research/messages.json?page=", page))
    #out_clean <- return_structure(out_raw)
    
    Path <- out_raw$path
    Status <- out_raw$parsed$status
    Error <- out_raw$parsed$error
    Error <- ifelse(is.null(Error), "no error", Error)
    data_notes <- data.frame(Path, Status, Error)
    data_notes_full <- rbind.data.frame(data_notes_full, data_notes)
    
    # append page's data to full data set
    all_data <- rbind.data.frame(all_data, out_clean$content) 
    
    # check if the page's data is empty,
    # if so, stop while loop
    if(length(out_raw$parsed$experiments) == 0){
      keep_paginating <- FALSE
    }
  }
  
  return(list("all_data" = all_data,
              "meta_data" = data_notes_full))
}

