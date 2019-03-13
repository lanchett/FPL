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
library(dplyr)
library(DT)
source("../data/summary.R")
source("../data/01players.R")
source("../players/playerInfo.R")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$playerSummary <- DT::renderDT(
   
    datatable(players) %>% formatStyle(
    'selected_by_percent',
    background = styleColorBar(range(players[,"selected_by_percent"]), 'lightblue'),
    backgroundSize = '98% 88%',
    backgroundRepeat = 'no-repeat',
    backgroundPosition = 'center'),
  
  options = list(pageLength=10)
  )
    
  
   output$playerInfoHistoryCurrent <- DT::renderDT({
  
     playerData <- playerInfo( players[input$playerSummary_rows_selected,"id"])
     
     playerInfoHistoryCurrent(playerData)
  
  
   })
   output$playerInfoHistoryPrevious <- DT::renderDT({
     
     playerData <- playerInfo( players[input$playerSummary_rows_selected,"id"])
     
     playerInfoHistoryPrevious(playerData)
     
   })
   output$playerInfoFixturesUpcoming <- DT::renderDT({
     
     playerData <- playerInfo( players[input$playerSummary_rows_selected,"id"])
     
     playerInfoFixturesUpcoming <-  playerInfoFixturesUpcoming(playerData)
     datatable(playerInfoFixturesUpcoming) %>% formatStyle(
       'difficulty',
       backgroundColor = styleInterval(c(2,3), c('green', 'yellow', 'red'))
     )
     
   })


})
