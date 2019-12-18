#' General player information (aggregated)
#'
#' @export

player_functions <-
  function(players_teams_data = players_teams_data) {
    player_data <- players_teams_data %>% purrr::pluck("elements") %>%
      dplyr::mutate_at(
        c(
          "form",
          "selected_by_percent",
          "points_per_game",
          "influence",
          "creativity",
          "threat",
          "ict_index",
          "value_form",
          "value_season",
          "now_cost",
          "ep_this",
          "ep_next"
        ),
        as.numeric
      ) %>%
      dplyr::mutate(
        now_cost = now_cost / 10,
        points_per_mill = total_points / now_cost,
        points_per_mill_per_minute = points_per_mill / minutes)


    names_elements <-
      players_teams_data %>% purrr::pluck("element_stats")

    player_data <-
      player_data %>%  dplyr::rename_at(c(names_elements %>%  dplyr::pull(name)),
                                        ~ c(names_elements %>% dplyr::pull(label))) %>%
      dplyr::rename(id_position = element_type,
                    id_player = id,
                    id_team = team) %>% dplyr::left_join(players_teams_data %>%
                                                           purrr::pluck("element_types") %>%
                                                           dplyr::rename(id_position = id),
                                                         by = "id_position") %>%
      dplyr::select(-sub_positions_locked)

  }

# Fetch data for specific player ------------------------------------------

#' Fetch data for specific player
#'
#' @export
player_info_detailed <-
  function(id = c(5, 50), link = "https://fantasy.premierleague.com/api/element-summary/") {
    df <- data.frame(id = id, link = link)
    link_use <- paste0(df$link, df$id, "/")
    player_info <- purrr:::map(link_use, jsonlite::fromJSON)
  }

#' Fetch data for specific player current season
#'
#' @export
player_info_detailed_fixtures_current <-
  function(player_info = player_info_detailed()) {
    player_info_history_current <- lapply(player_info, `[[`, "history")
    player_info_history_current <-
      data.table::rbindlist(player_info_history_current)


  }

#' Fetch data for specific player previous seasons
#'
#' @export
player_info_detailed_fixtures_previous <-
  function(player_info = player_info_detailed()) {
    player_info_history_previous <-
      lapply(player_info, `[[`, "history_past")
    player_info_history_previous <-
      data.table::rbindlist(player_info_history_previous)


  }

#' Fetch data for specific player - upcoming fixtures
#'
#' @export
player_info_detailed_fixtures_upcoming <-
  function(player_info = player_info_detailed()) {
    player_info_fixtures_upcoming <-
      lapply(player_info, `[[`, "fixtures")
    player_info_fixtures_upcoming <-
      data.table::rbindlist(player_info_fixtures_upcoming)

  }
