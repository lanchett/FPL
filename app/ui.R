source("../data/1.0summary.R")
source("../data/2.0players.R")
source("../data/3.0upcomingFixtures.R")
source("../players/2.1playerInfo.R")
source("../optimizer/optimalTeam.R")

shinyUI(
  navbarPage(
    # Application title
    title = "Fantasy Premier League",
    tabPanel(
      "All Players",
      icon = icon("futbol"),
      selectInput(
        "select",
        "Select columns to display",
        names(summaryPlayers),
        multiple = TRUE
      ),
      h2('Summary of all players'),
      h4('Aggregated performance this season'),
      DT::DTOutput("summaryPlayers")
    ),
    tabPanel(
      "This Season",
      icon = icon("shoe-prints"),
      h2('Game-by-game'),
      h4('Performance for selected players this season'),
      DT::DTOutput("playerInfoHistoryCurrent")
    ),
    tabPanel(
      "Previous Seasons",
      icon = icon("history"),
      h2('Aggregated performance previous seasons'),
      h4('Performance for selected players previous seasons'),
      DT::DTOutput("playerInfoHistoryPrevious")
    ),
    tabPanel(
      "Upcoming Fixtures",
      icon = icon("calendar"),
      h4('Upcoming fixtures for all teams'),
      plotly::plotlyOutput("playerInfoFixturesUpcoming")
    ),
    tabPanel(
      "Optimal Team",
      icon = icon("trophy"),
      numericInput("Budget", "Budget:", 100, min = 80, max = 110),
      numericInput(
        "Goalkeepers",
        "Goalkeepers:",
        2,
        min = 1,
        max = 2
      ),
      numericInput("Defenders", "Defenders:", 5, min = 1, max = 5),
      numericInput(
        "Midfielders",
        "Midfielders:",
        5,
        min = 1,
        max = 5
      ),
      numericInput("Forwards", "Forwards:", 3, min = 1, max = 3),
      DT::DTOutput("optimalTeam")
    )
  )
)
