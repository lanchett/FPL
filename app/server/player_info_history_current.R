player_info <- FPL::player_info_detailed(player_data[input$player_data_rows_selected,"id_player"])
player_info_fixtures_current <- FPL::player_info_detailed_fixtures_current(player_info)
DT::datatable(player_info_fixtures_current, options = list(pageLength = 100 ))
