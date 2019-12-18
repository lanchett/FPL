plotly::plot_ly(
  x = upcoming_fixtures$event, y = upcoming_fixtures$Team,
  z = upcoming_fixtures$Difficulty,  colors = colorRamp(c("green4", "yellow", "red")), type = "heatmap"
)