% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/optimal_team.R
\name{optimal_team}
\alias{optimal_team}
\title{LP-solver for FPL-team}
\usage{
optimal_team(
  summaryPlayers,
  objective = summaryPlayers$total_points,
  num_gk = 2,
  num_def = 5,
  num_mid = 5,
  num_fwd = 3,
  budget = 100,
  max_players_per_team = 3
)
}
\description{
LP-solver for FPL-team
}
