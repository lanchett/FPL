# Deploying Shiny App with FPL API

This project applies the FPL API to build a tool that can be helpful when picking your FPL team.

## How to use the project
The app is applying the functionality directly. Thus, by running the app, you can see how the project is supposed to work. However, here are some information about what the project contains:

- app folder: The running application of the project
- data folder: Functionality for fetching FPL data
- players folder: Functionality for finding information on player level (performance current season, last season etc, upcoming fixtures etc.)
- Dockerfile: This can be run if you want to host the Shiny application in a Docker container. 

Team optimization is inspired by Martin Eastwood: 
https://github.com/martineastwood/penalty/blob/master/fantasy_football_optimiser/optimiser.R 