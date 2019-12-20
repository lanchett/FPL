player_info <- FPL::player_info_detailed(player_data[input$player_data_rows_selected,"id_player"])
FPL::player_info_detailed_fixtures_previous(player_info)

