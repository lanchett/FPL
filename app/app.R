library(curl)
library(DT)
library(dplyr)
library(jsonlite)
library(lpSolve)
library(plotly)

source("../data/1.0summary.R")
source("../data/2.0players.R")
source("../data/3.0upcomingFixtures.R")
source("../players/2.1playerInfo.R")
source("../optimizer/optimalTeam.R")

shinyApp(ui, server)
