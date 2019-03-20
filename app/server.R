source("../data/1.0summary.R")
source("../data/2.0players.R")
source("../players/2.1playerInfo.R")

shinyServer(function(input, output) {
  
  output$summaryPlayers <- DT::renderDT(
   
   DT::formatStyle( table =  DT::datatable(summaryPlayers, options = list(pageLength=10)),
    'selected_by_percent',
    background = DT::styleColorBar(range(summaryPlayers[,"selected_by_percent"]), 'lightblue'),
    backgroundSize = '98% 88%',
    backgroundRepeat = 'no-repeat',
    backgroundPosition = 'center',
    'text-align' = 'right')
  )
    
  
   output$playerInfoHistoryCurrent <- DT::renderDT({
  
     playerData <- playerInfo( summaryPlayers[input$summaryPlayers_rows_selected,"id"])
     
     playerInfoHistoryCurrent(playerData)
  
  
   })
   output$playerInfoHistoryPrevious <- DT::renderDT({
     
     playerData <- playerInfo( summaryPlayers[input$summaryPlayers_rows_selected,"id"])
     
     playerInfoHistoryPrevious(playerData)
     
   })
   output$playerInfoFixturesUpcoming <- DT::renderDT({
     
     playerData <- playerInfo( summaryPlayers[input$summaryPlayers_rows_selected,"id"])
     
     playerInfoFixturesUpcoming <-  playerInfoFixturesUpcoming(playerData)
     
     DT::formatStyle(table =  DT::datatable(playerInfoFixturesUpcoming), 
       'difficulty',
       backgroundColor = DT::styleInterval(c(2,3), c('green', 'yellow', 'red'))
     )
     
   })


})
