library(shiny)
library(shinyjs)

library(ggplot2)

# Define the overall UI
dto<-DT::dataTableOutput("table")

shinyUI(
  fluidPage(
    useShinyjs(),
    titlePanel("List of Fide players rated >2500 as of August 2012"),
    tags$div(id = "main",
        shinyjs::inlineCSS(list(
          .ALL ='background-image: url("flagall.jpg")',
          .USA ='background-image: url("flagusa.png")',
          .RUS ='background-image: url("flagrus.jpg")',
          .IND ='background-image: url("flagind.png")'
             )),
    column(3,
           selectInput("select", label="Select country",
                       choices = list("ALL" = "ALL", "RUS" = "RUS", "USA" = "USA",
                                      "IND" = "IND"))),
    
    fluidRow(
      dto
    )
  ))
)
