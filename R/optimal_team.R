#' LP-solver for FPL-team
#' @export
#'
optimal_team <- function (summaryPlayers, objective = summaryPlayers$total_points, num_gk = 2, num_def = 5,
                      num_mid = 5, num_fwd = 3, budget = 100, max_players_per_team = 3) {

  df <- summaryPlayers

  # Create vectors to constrain by position
  df$Goalkeeper <- ifelse(df$element_type == "1", 1, 0)
  df$Defender <- ifelse(df$element_type == "2", 1, 0)
  df$Midfielder <- ifelse(df$element_type == "3", 1, 0)
  df$Forward <- ifelse(df$element_type == "4", 1, 0)

  # Create constraint vectors (indicator 0/1) to see which team a player is playing for
  team_constraint <- unlist(lapply(unique(df$team_code), function(x, df) {
    ifelse(df$team_code == x, 1, 0)
  }, df = df))


  # Build the matrix of numeric constraints. One row per constraint, and one column per variable/player.
  const_mat <- matrix(c(df$Goalkeeper, df$Defender, df$Midfielder, df$Forward,
                        df$now_cost, team_constraint),
                      nrow = (5 + length(unique(df$team_code))), byrow = TRUE)

  # Vector of numeric constraints (players per position, budget and max players per team)
  const_rhs <- c(num_gk, num_def, num_mid, num_fwd, budget, rep(max_players_per_team,
                                                                length(unique(df$team_code))))

  # next we need the constraint directions
  const_dir <- c("=", "=", "=", "=", rep("<=", length(const_rhs) - 4 ))

  # then solve the matrix
  result <- lpSolve::lp("max", objective, const_mat, const_dir, const_rhs, all.bin = TRUE, all.int = TRUE)

}
