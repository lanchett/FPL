playerData <- playerInfo( summaryPlayers[input$summaryPlayers_rows_selected,"id"])
playerInfoHistoryCurrent <- playerInfoHistoryCurrent(playerData)
DT::datatable(playerInfoHistoryCurrent, options = list(pageLength = 100 ))