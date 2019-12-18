#' Fetch data for specific contender given gameweek
#'
#' @export
#'
contender_info_detailed <- function(id_contender = c(2045023),id_gameweek = c(1), link = "https://fantasy.premierleague.com/api/entry/"){
  df <- data.frame(id_contender = id_contender, id_gameweek = id_gameweek, link = link)
  link_use <- paste0(df$link, df$id_contender,"/", "event/", df$id_gameweek, "/picks/")
  contender_info <- jsonlite::fromJSON(link_use)

  contender_info <- purrr::list_merge(contender_info, id_contender  = id_contender, id_gameweek =  id_gameweek)
  }


#' Fetch data for specific contenders pick a given gameweek
#'
#' @export
contender_info_detailed_picks <- function(contender_info = contender_info_detailed()){
  contender_info_picks <- contender_info %>%  purrr::pluck("picks")
  contender_info_picks <- contender_info_picks %>%  dplyr::mutate(id_contender = contender_info %>%  purrr::pluck("id_contender"),
                                                             id_gameweek = contender_info %>%  purrr::pluck("id_gameweek")) %>%
    dplyr::rename(id_player = element)


}

#' Fetch status for specific contenders a given gameweek
#'
#' @export
contender_info_detailed_status <- function(contender_info = contender_info_detailed()){
  contender_info_status <- contender_info  %>% purrr::pluck("entry_history") %>%  as.data.frame()
  chips <-
    if_else(is.null(
      contender_info %>% purrr::pluck("active_chip")),
      "None",
      contender_info %>% purrr::pluck("active_chip")
    )
  contender_info_status <- contender_info_status %>%  dplyr::mutate(active_chip = chips,
                                                                    id_contender = contender_info %>%  purrr::pluck("id_contender"),
                                                                    id_gameweek = contender_info %>%  purrr::pluck("id_gameweek"))


}

