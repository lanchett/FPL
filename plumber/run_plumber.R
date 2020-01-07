library(plumber)
r <- plumb("plumber/plumber.R")  # Where 'plumber.R' is the location of the file shown above
r$run(port=8000, swagger = F)
