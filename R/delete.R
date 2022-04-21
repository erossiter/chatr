#' Delete an experiment
#'
#' @param experiment_id A numeric. The unique ID for the experiment or a vector of multiple IDs.
#'
#' @return Returns a list of two elements. `content` is `NA` as no information is created or requested in a DELETE call. 
#' `meta_data` is a list of meta data associated with the API call including the following elements. `path` is a 
#' string indicating the path for each deleted object, `status` is a string indicating whether the API call was successful 
#' or not, and `error` is a string indicating any error message provided.
#' 
#' @examples
#'
#' \dontrun{
#' delete_experiment(experiment_id = 1)
#' }
#'
#' @export
delete_experiment <- function (experiment_id) {

    bearer_token <- get_bearer_token()
    
    data_notes_full <- data.frame()
    
    for(i in experiment_id){
      path <- paste0("/research/experiments/",
                     i,
                     ".json")
      
      
      
      out <- chatter_DELETE(bearer_token = bearer_token,
                            path = path)
      
      Path <- out$path
      Status <- out$parsed$status
      Error <- out$parsed$error
      Error <- ifelse(is.null(Error), "no error", Error)
      
      data_notes <- data.frame(Path, Status, Error)
      data_notes_full <- rbind.data.frame(data_notes_full, data_notes)}
    
    return(list("content" = NA,
                "meta_data" = data_notes_full))
  }
  
#' Delete an instruction
#'
#' @param instruction_id A numeric. The unique ID for the instruction or a vector of multiple IDs.
#'
#' @return Returns a list of two elements. `content` is `NA` as no information is created or requested in a DELETE call. 
#' `meta_data` is a list of meta data associated with the API call including the following elements. `path` is a 
#' string indicating the path for each deleted object, `status` is a string indicating whether the API call was successful 
#' or not, and `error` is a string indicating any error message provided.
#'
#' @note Note you need to delete any chatroom memberships that contain the instruction
#' before you can successfully delete the instruction.
#'
#' @examples
#'
#' \dontrun{
#' delete_instruction(instruction_id = 1)
#' }
#'
#' @export
delete_instruction <- function (instruction_id) {

  bearer_token <- get_bearer_token()
  
  data_notes_full <- data.frame()
  
  for(i in instruction_id){
    path <- paste0("/research/instructions/",
                   i,
                   ".json")
    
    
    
    out <- chatter_DELETE(bearer_token = bearer_token,
                          path = path)
    
    Path <- out$path
    Status <- out$parsed$status
    Error <- out$parsed$error
    Error <- ifelse(is.null(Error), "no error", Error)
    
    data_notes <- data.frame(Path, Status, Error)
    data_notes_full <- rbind.data.frame(data_notes_full, data_notes)}
  
  return(list("content" = NA,
              "meta_data" = data_notes_full))
  
}
  

#' Delete a chatroom
#'
#' @param chatroom_id A numeric. The unique ID for the chatroom or a vector of multiple IDs.
#'
#' @return Returns a list of two elements. `content` is `NA` as no information is created or requested in a DELETE call. 
#' `meta_data` is a list of meta data associated with the API call including the following elements. `path` is a 
#' string indicating the path for each deleted object, `status` is a string indicating whether the API call was successful 
#' or not, and `error` is a string indicating any error message provided.
#'
#' @examples
#'
#' \dontrun{
#' delete_chatroom(chatroom_id = 1)
#' }
#'
#' @export
delete_chatroom <- function (chatroom_id) {

  bearer_token <- get_bearer_token()
  
  data_notes_full <- data.frame()
  
  for(i in chatroom_id){
    path <- paste0("/research/chatrooms/",
                   i,
                   ".json")
    
    
    
    out <- chatter_DELETE(bearer_token = bearer_token,
                          path = path)
    
    Path <- out$path
    Status <- out$parsed$status
    Error <- out$parsed$error
    Error <- ifelse(is.null(Error), "no error", Error)
    
    data_notes <- data.frame(Path, Status, Error)
    data_notes_full <- rbind.data.frame(data_notes_full, data_notes)}
  
  return(list("content" = NA,
              "meta_data" = data_notes_full))
}  
  


#' Delete a user
#'
#' @param user_id A numeric. The unique ID for the user or a vector of multiple IDs.
#'
#' @return Returns a list of two elements. `content` is `NA` as no information is created or requested in a DELETE call. 
#' `meta_data` is a list of meta data associated with the API call including the following elements. `path` is a 
#' string indicating the path for each deleted object, `status` is a string indicating whether the API call was successful 
#' or not, and `error` is a string indicating any error message provided.
#'
#' @examples
#'
#' \dontrun{
#' delete_user(user_id = 1)
#' }
#'
#' @export
delete_user <- function (user_id) {

  bearer_token <- get_bearer_token()
  
  data_notes_full <- data.frame()
  
  for(i in user_id){
    path <- paste0("/research/users/",
                   i,
                   ".json")
    
    
    
    out <- chatter_DELETE(bearer_token = bearer_token,
                          path = path)
    
    Path <- out$path
    Status <- out$parsed$status
    Error <- out$parsed$error
    Error <- ifelse(is.null(Error), "no error", Error)
    
    data_notes <- data.frame(Path, Status, Error)
    data_notes_full <- rbind.data.frame(data_notes_full, data_notes)}
  
  return(list("content" = NA,
              "meta_data" = data_notes_full))
}
  

#' Delete a chatroom membership
#'
#' @param chatroom_membership_id A numeric. The unique ID for the chatroom membership or a vector of multiple IDs.
#'
#' @return Returns a list of two elements. `content` is `NA` as no information is created or requested in a DELETE call. 
#' `meta_data` is a list of meta data associated with the API call including the following elements. `path` is a 
#' string indicating the path for each deleted object, `status` is a string indicating whether the API call was successful 
#' or not, and `error` is a string indicating any error message provided.
#'
#' @examples
#'
#' \dontrun{
#' delete_chatroom_membership(chatroom_membership_id = 1)
#' }
#'
#' @export
delete_chatroom_membership <- function (chatroom_membership_id) {

 
   bearer_token <- get_bearer_token()
   
   data_notes_full <- data.frame()
  
   for(i in chatroom_membership_id){
   path <- paste0("/research/chatroom_memberships/",
                 i,
                 ".json")

  

  out <- chatter_DELETE(bearer_token = bearer_token,
                        path = path)
   
   Path <- out$path
   Status <- out$parsed$status
   Error <- out$parsed$error
   Error <- ifelse(is.null(Error), "no error", Error)
   
   data_notes <- data.frame(Path, Status, Error)
   data_notes_full <- rbind.data.frame(data_notes_full, data_notes)}

   return(list("content" = NA,
               "meta_data" = data_notes_full))
}

#' Delete a message
#'
#' @param message_id A numeric. The unique ID for the message or a vector of multiple IDs.
#'
#' @return Returns a list of two elements. `content` is `NA` as no information is created or requested in a DELETE call. 
#' `meta_data` is a list of meta data associated with the API call including the following elements. `path` is a 
#' string indicating the path for each deleted object, `status` is a string indicating whether the API call was successful 
#' or not, and `error` is a string indicating any error message provided.
#'
#' @examples
#'
#' \dontrun{
#' delete_message(message_id = 1)
#' }
#'
#' @export
delete_message <- function (message_id) {

  bearer_token <- get_bearer_token()
  
  data_notes_full <- data.frame()
  
  for(i in message_id){
    path <- paste0("/research/messages/",
                   i,
                   ".json")
    
    
    
    out <- chatter_DELETE(bearer_token = bearer_token,
                          path = path)
    
    Path <- out$path
    Status <- out$parsed$status
    Error <- out$parsed$error
    Error <- ifelse(is.null(Error), "no error", Error)
    
    data_notes <- data.frame(Path, Status, Error)
    data_notes_full <- rbind.data.frame(data_notes_full, data_notes)}
  
  return(list("content" = NA,
              "meta_data" = data_notes_full))
}