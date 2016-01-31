library(shiny)
library(shinyjs)

library(ggplot2)
library(data.table)

sortbyrating <- function (dataframe) {
  sorted<- dataframe[order(-dataframe$rating),]
  sorted
}

selc<-"ALL"

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Filter data based on selections
  dt<-DT::datatable({
    sortbyrating(read.table("players.txt"))
  })
  temp<-DT::renderDataTable(dt)
  output$table <- temp
  
  observeEvent(input$select,{
    print(selc)
    shinyjs::removeClass("main", selc)
    shinyjs::addClass("main", input$select)
    selc<<-input$select
    output$table <- DT::renderDataTable(DT::datatable({
      players<-read.table("players.txt")
      if(input$select!="ALL") {
        players<-players[players$country==input$select,]
      }
      sortbyrating(players)
    }))
  })
  
})