
# Shiny -------------------------------------------------------------------


shinyServer(function(input, output) {

  output$player_data <- DT::renderDT({

    source("server/player_data.R", local = TRUE)$value
  })

   output$player_info_history_current <- DT::renderDT({

     source("server/player_info_history_current.R", local = TRUE)$value

   })

   output$player_info_history_previous <- DT::renderDT({

     source("server/player_info_history_previous.R", local = TRUE)$value

   })

   output$upcoming_fixtures <- plotly::renderPlotly({


     source("server/upcoming_fixtures.R", local = TRUE)$value

   })

   output$optimal_team <- DT::renderDT({

     source("server/optimal_team.R", local = TRUE)$value

   })
})
