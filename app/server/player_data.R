columns = names(player_data)
if (!is.null(input$select)) {
  columns = input$select
}
player_data <- player_data[,columns,drop=FALSE]
DT::datatable(player_data, options = list(pageLength=15))

# DT::formatStyle( table =  DT::datatable(summaryPlayers, options = list(pageLength=10)),
#  'selected_by_percent',
#  background = DT::styleColorBar(range(summaryPlayers[,"selected_by_percent"]), 'lightblue'),
#  backgroundSize = '98% 88%',
#  backgroundRepeat = 'no-repeat',
#  backgroundPosition = 'center',
#  'text-align' = 'right')