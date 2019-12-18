#' Fetch high-level data for players, teams and fixtures
#'
#' @export
#'
load_data <- function(players_teams_data_link = "https://fantasy.premierleague.com/api/bootstrap-static/",
                      upcoming_fixtures_link = "https://fantasy.premierleague.com/api/fixtures") {
  players_teams_data <-
    jsonlite::fromJSON(players_teams_data_link)

  upcoming_fixtures <-
    jsonlite::fromJSON(upcoming_fixtures_link) %>%
    dplyr::filter(started  == FALSE)

  output <- list(players_teams_data = players_teams_data,
                 upcoming_fixtures = upcoming_fixtures)

}

#' Transform high-level data for players, teams and fixtures
#'
#' @export
transform_data <- function(loaded_data = load_data(), link_users = "https://fantasy.premierleague.com/entry/") {
  # Team data ---------------------------------------------------------------

  team_data <-
    loaded_data %>% purrr::pluck("players_teams_data") %>% team_functions(.)

  # Fixture data ------------------------------------------------------------

  upcoming_fixtures <-
    loaded_data %>% pluck("upcoming_fixtures") %>%
    fixtures_functions(upcoming_fixtures = ., team_data = team_data)


  # Player data -------------------------------------------------------------
  player_data <-
    loaded_data %>%  purrr::pluck("players_teams_data") %>% player_functions(.)


  # Gameweek data -----------------------------------------------------------
  gameweek_data <-
    loaded_data %>%  purrr::pluck("players_teams_data") %>% gameweek_functions(players_teams_data = ., link_users = link_users)


  output <- list(
    team_data = team_data,
    player_data = player_data,
    upcoming_fixtures = upcoming_fixtures,
    gameweek_data = gameweek_data
  )
}
