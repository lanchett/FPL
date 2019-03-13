
# Info per spiller --------------------------------------------------------

## Hent data
playerInfo <- function(id = 4){
  playerData <- fromJSON(paste0("https://fantasy.premierleague.com/drf/element-summary/",id))
  
}

## Historiske kamper inneværende sesong 
playerInfoHistoryCurrent <- function(playerData){
  playerInfoHistoryCurrent <- data.frame(playerData$history)
  
}

## Historiske sesonger  
playerInfoHistoryPrevious <- function(playerData){
  playerInfoHistoryPrevious <- data.frame(playerData$history_past)
  
}

## Kommende kamper
playerInfoFixturesUpcoming <- function(playerData){
  playerInfoFixturesUpcoming <- data.frame(playerData$fixtures)
  
}


