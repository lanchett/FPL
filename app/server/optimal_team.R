optimal_team <-
  FPL::optimal_team(
    summaryPlayers =  player_data,
    objective = player_data$total_points,
    num_gk = input$Goalkeepers,
    num_def = input$Defenders,
    num_mid = input$Midfielders,
    num_fwd = input$Forwards,
    budget = input$Budget,
    max_players_per_team = 3
  )

optimal_team <-
  player_data %>% mutate(solution = optimal_team$solution) %>%
  filter(solution == 1) %>%
  select(
    second_name,
    element_type,
    now_cost,
    total_points,
    selected_by_percent,
    ep_next,
    points_per_game
  ) %>%
  arrange(element_type)

DT::datatable(optimal_team, options = list(pageLength = 15))
