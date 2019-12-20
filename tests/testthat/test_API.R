library(testthat)
library(dplyr)
library(purrr)

context("Test loading of data from API")


# Load data for players, teams and fixtures -------------------------------

data_players_fixtures_teams <- transform_data()


#Data per player (more detailed than player data)
player_info <- FPL::player_info_detailed(id = c(5,50), link = "https://fantasy.premierleague.com/api/element-summary/")

player_info_fixtures_current <-
  FPL::player_info_detailed_fixtures_current(player_info)

player_info_fixtures_previous <-
  FPL::player_info_detailed_fixtures_previous(player_info)

player_info_fixtures_upcoming <-
  FPL::player_info_detailed_fixtures_upcoming(player_info)



# Test API ----------------------------------------------------------------


testthat::test_that("Necessary data is available through API", {
  expect_gte(nrow(data_players_fixtures_teams %>%  purrr::pluck("team_data")), 5)
  expect_gte(nrow(data_players_fixtures_teams %>% purrr::pluck("upcoming_fixtures")), 5)
  expect_gte(nrow(data_players_fixtures_teams %>% purrr::pluck("player_data")), 5)
  expect_gte(nrow(player_info_fixtures_current), 1)
  expect_gte(nrow(player_info_fixtures_previous), 1)
  expect_gte(nrow(player_info_fixtures_upcoming), 1)

})
