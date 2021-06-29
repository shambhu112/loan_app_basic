
#' onLoad for lending_mod
#'
#' @description A shiny spring Module.
#'
#' @param control the controller  \code{app_master}
#' @param params for the mod
lending_mod_onLoad <- function(control , params){
print("lending mod on load called")
}

#' ui_function for lending_mod
#'
#' @description A shiny spring Module UI function
#' @param id the id
#' @param control the controller  \code{app_master}
#' @param params for the mod
lending_mod_ui <- function(id , control , params ){
  ns <- NS(id)
  fluidRow(
     ##Your UI Code here
     h3(" Hello lending_mod this is the UI function")
    )
}


#' server_function for lending_mod
#'
#' @description A shiny spring Module UI function
#' @param id the id
#' @param control the controller  \code{app_master}
#' @param params for the mod
lending_mod_server <- function(id , control , params){
moduleServer( id, function(input, output, session){
    ns <- session$ns
  ## Your server code here

    })
}

