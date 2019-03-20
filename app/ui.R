shinyUI(fluidPage(
  
  # Application title
  
  titlePanel("Fantasy Premier League"),
  
  mainPanel(
    tabsetPanel(
      tabPanel("All Players",DT::DTOutput("summaryPlayers")),
      tabPanel("This Season", DT::DTOutput("playerInfoHistoryCurrent")),
      tabPanel("Previous Seasons", DT::DTOutput("playerInfoHistoryPrevious")),
      tabPanel("Upcoming Fixtures", DT::DTOutput("playerInfoFixturesUpcoming"))
    )
  )
)
)
