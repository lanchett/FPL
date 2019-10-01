source("../data/1.0summary.R")
source("../data/2.0players.R")
source("../data/3.0upcomingFixtures.R")
source("../players/2.1playerInfo.R")
source("../optimizer/optimalTeam.R")
library(dplyr)
library(plotly)

shinyServer(function(input, output) {
  
  output$summaryPlayers <- DT::renderDT({
    
    source("server/summaryPlayers.R", local = TRUE)$value   
  })
  
   output$playerInfoHistoryCurrent <- DT::renderDT({
  
     source("server/playerInfoHistoryCurrent.R", local = TRUE)$value   
     
   })
   
   output$playerInfoHistoryPrevious <- DT::renderDT({
     
     source("server/playerInfoHistoryPrevious.R", local = TRUE)$value
     
   })
   
   output$playerInfoFixturesUpcoming <- plotly::renderPlotly({
     
     
     source("server/fixturesUpcoming.R", local = TRUE)$value
     
   })
   
   output$optimalTeam <- DT::renderDT({
     
     source("server/optimalTeam.R", local = TRUE)$value
     
   })
})
