plotly::plot_ly(
  x = upcomingFixtures$event, y = upcomingFixtures$Team,
  z = upcomingFixtures$Difficulty,  colors = colorRamp(c("green4", "yellow", "red")), type = "heatmap"
)