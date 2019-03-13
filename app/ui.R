#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  
  titlePanel("Fantasy Premier League"),
  
  mainPanel(
    tabsetPanel(
      tabPanel("All Players", #numericInput("playerID", "PlayerID", value = 1),
               DT::DTOutput("playerSummary")),
      tabPanel("This Season", dataTableOutput("playerInfoHistoryCurrent")),
      tabPanel("Previous Seasons", dataTableOutput("playerInfoHistoryPrevious")),
      tabPanel("Upcoming Fixtures", DT::DTOutput("playerInfoFixturesUpcoming"))
    )
  )
)
)
