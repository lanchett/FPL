#' Selecting team data from API
#' @export

gameweek_functions <-
  function(players_teams_data = players_teams_data, link_users = "https://fantasy.premierleague.com/entry/") {
    gameweek_data <-
      players_teams_data %>% purrr::pluck("events") %>%
      dplyr::mutate(points_top_element = .data$top_element_info$points) %>%
      dplyr::select(-top_element_info)

    # Legg på chip_plays

    chip_plays <-
      purrr::map_df(
        gameweek_data %>%  dplyr::filter(finished == TRUE) %>% dplyr::pull(chip_plays),
        ~ tidyr::pivot_wider(
          data = .x,
          names_from =  c("chip_name"),
          values_from = "num_played"
        )
      )


    gameweek_data<- gameweek_data %>%
      dplyr::select(-chip_plays) %>%
      dplyr::filter(finished == TRUE) %>%
      dplyr::bind_cols(chip_plays) %>%
      dplyr::bind_rows(gameweek_data %>%
                         dplyr::select(-chip_plays) %>%
                         dplyr::filter(finished == FALSE))

    gameweek_data[is.na(gameweek_data)] <- 0

    # Legg på link til spiller
    gameweek_data <-
      gameweek_data %>%  dplyr::mutate(link = paste0(
        link_users,
        highest_scoring_entry,
        "/event/",
        readr::parse_number(name)
      ),
      id_gameweek = id,
      id_player = top_element,
      id_deltaker = highest_scoring_entry)

}
