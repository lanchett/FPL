
# Info per spiller --------------------------------------------------------

## Hent data
playerInfo <- function(id = 4){
  playerData <- fromJSON(paste0("https://fantasy.premierleague.com/drf/element-summary/",id))
  
}

## Historiske kamper inneværende sesong 
playerInfoHistoryCurrent <- function(playerData){
  playerInfoHistoryCurrent <- data.frame(playerData$history)
  playerInfoHistoryCurrent %>% select(
    "selected", 
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
  
}

## Historiske sesonger  
playerInfoHistoryPrevious <- function(playerData){
  playerInfoHistoryPrevious <- data.frame(playerData$history_past)
  playerInfoHistoryPrevious %>% select( "season_name",
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
  
}

## Kommende kamper
playerInfoFixturesUpcoming <- function(playerData){
  playerInfoFixturesUpcoming <- data.frame(playerData$fixtures)
  playerInfoFixturesUpcoming %>% select( "kickoff_time_formatted",
                                         "event_name",
                                         "opponent_name",
                                         "is_home",
                                         "difficulty")
  
}


