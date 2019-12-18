#' Selecting fixtures from API
#' @export
fixtures_functions <-
  function(upcoming_fixtures = upcoming_fixtures,
           team_data = players_teams_data %>% team_functions(.)) {
    upcoming_fixtures <-
      upcoming_fixtures  %>% dplyr::rename(id_match = id,
                                           id_gameweek = event) %>%
      dplyr::mutate(
        team_a_difficulty = paste(team_a, team_a_difficulty, sep = ";"),
        team_h_difficulty = paste(team_h, team_h_difficulty, sep = ";")
      ) %>%
      tidyr::pivot_longer(
        .,
        cols = c("team_a_difficulty", "team_h_difficulty"),
        values_to = "difficulty",
        names_to = "team_difficulty"
      ) %>%
      tidyr::separate(col = "difficulty",
                      into = c("team", "difficulty"),
                      sep = ";") %>% dplyr::rename(id_team = team) %>%
      dplyr::select(-stats, -team_a, -team_h, -team_difficulty, -team_a_score, -team_h_score)

  }
