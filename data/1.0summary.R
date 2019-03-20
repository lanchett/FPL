summaryData <- jsonlite::fromJSON("https://fantasy.premierleague.com/drf/bootstrap")


# Aggregert info
summaryPlayers <- summaryData$elements
### joiner inn lag og posisjon
summaryPlayers <-  dplyr::left_join(summaryPlayers, summaryData$teams[,c("id", "name")], by =c("team" = "id"))
summaryPlayers <- dplyr::left_join(summaryPlayers, summaryData$element_types[,c("id", "singular_name")], by =c("element_type" = "id"))

summaryPlayers <- dplyr::select(summaryPlayers,    c("id",
                                       "first_name", 
                                       "second_name",
                                       "name",
                                       "singular_name",
                                       "form",  
                                       "selected_by_percent", 
                                       "total_points",
                                       "goals_scored", 
                                       "assists",
                                       "clean_sheets",
                                       "transfers_in_event", 
                                       "transfers_out_event", 
                                       "event_points", 
                                       "points_per_game",
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
                                       "now_cost",
                                       "ep_this", 
                                       "ep_next",
                                       "chance_of_playing_this_round", 
                                       "in_dreamteam", 
                                       "dreamteam_count",
                                       "minutes")
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
