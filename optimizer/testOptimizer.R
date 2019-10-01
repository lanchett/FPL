library(lpSolve)
library(RCurl)
library(stringr)
library(jsonlite)
library(dplyr)


# Fetch data --------------------------------------------------------------

# Fetch from web or use csv-file (same format, older data)
source("data/1.0summary.R")
# summaryPlayers <- read.csv2(file = "data/summaryPlayers.csv")


# Load and use optimalTeam function ---------------------------------------

source("optimizer/optimalTeam.R")
optimal_team <- optimalTeam(summaryPlayers =  summaryPlayers,  objective = summaryPlayers$total_points, num_gk = 2, num_def = 5,
                            num_mid = 5, num_fwd = 3, budget = 100, max_players_per_team = 3) 


# Check the final team ----------------------------------------------------

solution <- summaryPlayers %>% 
  mutate(solution = optimal_team$solution) %>% 
  filter(solution == 1) %>% 
  select(second_name, element_type, now_cost, total_points) %>% 
  arrange(element_type) 

View(solution)

solution %>% summarise(total_price = sum(now_cost)) %>% print
solution %>% summarise(total_proints = sum(total_points)) %>% print
