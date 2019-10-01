# Fetch data for specific player ------------------------------------------

playerInfo <- function(id = c(5,50)){
  df <- data.frame(id = id, link = "https://fantasy.premierleague.com/api/element-summary/")
  linkFinal <- paste0(df$link, df$id,"/")
  playerData <- purrr:::map(linkFinal, jsonlite::fromJSON) 
}




