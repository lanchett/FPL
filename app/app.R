library(curl)
library(DT)
library(dplyr)
library(jsonlite)
library(lpSolve)
library(plotly)
library(FPL)

data_players_fixtures_teams <- transform_data()
team_data <- data_players_fixtures_teams %>%  pluck("team_data")
upcoming_fixtures <-
  data_players_fixtures_teams %>% pluck("upcoming_fixtures")
player_data <- data_players_fixtures_teams %>% pluck("player_data")


shinyApp(ui, server)
