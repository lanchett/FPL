

# Info per spiller --------------------------------------------------------

## Historiske kamper inneværende sesong 
playerInfoHistoryCurrent <- function(playerData){
  playerInfoHistoryCurrent <- lapply(playerData, `[[`, "history")
  playerInfoHistoryCurrent <- data.table::rbindlist(playerInfoHistoryCurrent)
  playerInfoHistoryCurrent <- dplyr::select( playerInfoHistoryCurrent, c("selected", 
    "kickoff_time_formatted", 
    "team_h_score", 
    "team_a_score", 
    "was_home", 
    "round", 
    "total_points",
    "value",
    "transfers_balance", 
    "goals_scored", 
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
    "open_play_crosses",
    "big_chances_created",
    "clearances_blocks_interceptions",
    "recoveries",
    "key_passes",
    "tackles",
    "winning_goals",
    "attempted_passes",
    "completed_passes",
    "penalties_conceded",
    "big_chances_missed",
    "errors_leading_to_goal",
    "errors_leading_to_goal_attempt",
    "tackled",
    "offside",
    "target_missed",
    "fouls",
    "dribbles"
  )
  )
  
}

## Historiske sesonger  
playerInfoHistoryPrevious <- function(playerData){
  playerInfoHistoryPrevious <- lapply(playerData, `[[`, "history_past")
  playerInfoHistoryPrevious <- data.table::rbindlist(playerInfoHistoryPrevious)
  playerInfoHistoryPrevious <- dplyr::select(playerInfoHistoryPrevious,  c("season_name",
                                        "start_cost",
                                        "end_cost",
                                        "total_points",
                                        "minutes",
                                        "goals_scored",
                                        "assists" ,
                                        "clean_sheets",
                                        "goals_conceded",
                                        "own_goals",
                                        "penalties_saved",
                                        "penalties_missed",
                                        "yellow_cards",
                                        "red_cards",
                                        "saves",
                                        "bonus",
                                        "bps",
                                        "influence",
                                        "creativity",
                                        "threat",
                                        "ict_index"
                                        )
  )
}

## Kommende kamper
playerInfoFixturesUpcoming <- function(playerData){
  playerInfoFixturesUpcoming <- lapply(playerData, `[[`, "fixtures")
  playerInfoFixturesUpcoming <- data.table::rbindlist(playerInfoFixturesUpcoming)
  playerInfoFixturesUpcoming <- dplyr::select(playerInfoFixturesUpcoming, c("kickoff_time_formatted",
                                         "event_name",
                                         "opponent_name",
                                         "is_home",
                                         "difficulty")
  )
  
}


