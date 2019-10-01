
# Fetch data for all players ----------------------------------------------

summaryData <- jsonlite::fromJSON("https://fantasy.premierleague.com/api/bootstrap-static/")


summaryPlayers <- summaryData$elements
summaryPlayers <-  dplyr::left_join(summaryPlayers, summaryData$teams[,c("id", "name")], by =c("team" = "id"))
summaryPlayers <- dplyr::left_join(summaryPlayers, summaryData$element_types[,c("id", "singular_name")], by =c("element_type" = "id"))
summaryPlayers <- dplyr::select(summaryPlayers,   
                                      c("id",
                                       "name",
                                       "singular_name",
                                       "first_name", 
                                       "second_name",
                                       "form",  
                                       "selected_by_percent", 
                                       "total_points",
                                       "now_cost",
                                       "ep_this", 
                                       "ep_next",
                                       "points_per_game",
                                       "goals_scored", 
                                       "assists",
                                       "clean_sheets",
                                       "transfers_in_event", 
                                       "transfers_out_event", 
                                       "event_points",
                                       "goals_conceded", 
                                       "yellow_cards", 
                                       "red_cards", 
                                       "saves",
                                       "bonus",                       
                                       "bps",                         
                                       "influence",                   
                                       "creativity",                  
                                       "threat",                      
                                       "ict_index", 
                                       "value_form", 
                                       "value_season",
                                       "news",
                                       "chance_of_playing_this_round", 
                                       "in_dreamteam", 
                                       "dreamteam_count",
                                       "minutes",
                                       "element_type",
                                       "team_code")
)

summaryPlayers <- dplyr::mutate_at(summaryPlayers, c("form", 
                                       "selected_by_percent", 
                                       "points_per_game", 
                                       "influence",                   
                                       "creativity",                  
                                       "threat",                      
                                       "ict_index",
                                       "value_form",
                                       "value_season",
                                       "now_cost",
                                       "ep_this",
                                       "ep_next"), as.numeric)

summaryPlayers <- dplyr::mutate(summaryPlayers, now_cost = now_cost / 10)
