#' Selecting team data from API
#' @export
team_functions <- function(players_teams_data = players_teams_data) {
  team_data <-
    players_teams_data %>% purrr::pluck("teams") %>%  dplyr::rename(id_team = id) %>%
    dplyr::mutate(
      img = paste0(
        "https://fantasy.premierleague.com/dist/img/badges/badge_",
        code,
        "_40.png"
      )
    )
}
