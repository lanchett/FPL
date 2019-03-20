## Hent data
playerInfo <- function(id = c(5,50)){
  df <- data.frame(id = id, link = "https://fantasy.premierleague.com/drf/element-summary/")
  linkFinal <- paste0(df$link, df$id)
  playerData <- purrr:::map(linkFinal, jsonlite::fromJSON) 
}

