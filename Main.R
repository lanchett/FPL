library(plumber)
r <- plumb("plumber_model.R")  # Where 'plumber.R' is the location of the file shown above
r$run(port=8000, host="0.0.0.0", swagger = F)
