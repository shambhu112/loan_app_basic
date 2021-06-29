
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
    shinyjs::useShinyjs(),
    bs4Dash::box(
      title = "Credit Preditions" ,
      width = 12 ,
      status = "primary",
      side = "right",
      solidHeader = FALSE,
      collapsible = TRUE,
      maximizable = TRUE,
      id = "prediction_box",
      fluidRow(
        column(3 ,
               shinyWidgets::switchInput(
                 label = "Server Status",
                 inputId = ns("server_run"),
                 onStatus = "success",
                 offStatus = "danger" ,
                 labelWidth = "150px" ,
                 size = "mini"
               ) ,
               shiny::textOutput(ns("server_status"))
        ),
        column( width = 9 ,
                wellPanel(
                  selectizeInput(ns("company_selection"), "Select Company:  ",
                                 choices = control$dataset_by_name("portfolio")$name)  ,
                  multiple = FALSE,  width = 6 ,options = NULL )
        )
      ),
      fluidRow(
        column(3 ,uiOutput(ns("prediction_box"))),
        column(1 ,""),
        column(3 ,
               "Outstanding Loan"),
        column(1 ,""),
        column(3 ,
               "Risk Variables"),
        column(1 ,"")

      )
    ) ,

    bs4Dash::tabBox(
      width = 12 ,
      status = "primary",
      elevation = 2,
      solidHeader = FALSE,
      collapsible = FALSE,
      maximizable = TRUE,
      id = "details_tabbox",
      tabPanel(
        "Company Details"
      ),
      tabPanel(
        "Variable Importance"
      ),
      tabPanel(
        "Correlation Funnel"
      )
    )
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

