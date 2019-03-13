#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(jsonlite)
source("../players/playerInfo.R")
#source("../data/summary.R")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$table1 <- renderDataTable({
    
    playerData <- fromJSON(paste0("https://fantasy.premierleague.com/drf/element-summary/",4))
    playerData$history_summary
    
  })
  
})
