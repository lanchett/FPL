# plumber.R
library(dplyr)
library(purrr)
#* Load and transform data
#* @get /data
function(){
  loaded_data <- FPL::load_data(players_teams_data_link = "https://fantasy.premierleague.com/api/bootstrap-static/",
                                             upcoming_fixtures_link = "https://fantasy.premierleague.com/api/fixtures")

  data_players_fixtures_teams <- FPL::transform_data(loaded_data = loaded_data, link_users = "https://fantasy.premierleague.com/entry/")
  team_data <- data_players_fixtures_teams %>%  pluck("team_data")
  player_data <- data_players_fixtures_teams %>%  pluck("player_data")
  upcoming_fixtures <- data_players_fixtures_teams %>%  pluck("upcoming_fixtures")
  gameweek_data <-
  loaded_data %>%  pluck("players_teams_data") %>% FPL::gameweek_functions(players_teams_data = ., link_users = "https://fantasy.premierleague.com/entry/")

  list(data_players_fixtures_teams = data_players_fixtures_teams,
       team_data = team_data,
       player_data = player_data,
       upcoming_fixtures = upcoming_fixtures,
       gameweek_data = gameweek_data)
}
