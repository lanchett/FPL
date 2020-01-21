# Using R with Plumber API for FPL data

This package extracts data from the FPL API, and that's the main purpose of it.
By installing the package, and following the steps in the markdown **dev/data_info.Rmd**, you can see how to use it for extracting and transforming data.
As such, the package can be used directly if you would only like to extract the data for an internal solution.

Furthermore, I've also set up Plumber to expose processed data as an API.  
If you want to expose the data to other services, Plumber will allow you to do that.
For instance, I use the Plumber API on a Virtual Machine (VM), allowing me to connect a Power BI dashboard directly to that VM as a data source. 
Thus, I don't need to run anything locally to extract recent data. It also allows me to share the data with friends that are interested! 

I've also added an example of how you can run it in a Docker container. This is somewhat more robust than just running Plumber directly on a VM, and connecting to that endpoint. For instance if you want to scale the application, that's easier to orchestrate with containers. 


<img src="img/plumber.jpg" alt="Plumber from RStudio"
	title="Plumber" width="150" height="100" />
	
# Code for running Plumber API

First you need to clone this github repository and ensure you have all necessary packages installed (see **DESCRIPTION** file). 
```
# Clone repository
git clone https://github.com/lanchett/FPL.git

```
In R, install the FPL-package.

```
# Install from github..
devtools::install_github("lanchett/FPL")

# .. or build it from the project in R
# devtools::build()

```

If you now run the file **Main.R** the API will become available. 
Test API at **http://localhost:8000/data** in your browser or on a VM
http://{machineIP}:8000/data 

## Information about Plumber code
It's the files named **Main.R** and **plumber_model.R** that are relevant for actually exposing the API.
The latter controls what should be exposed at different endpoints, while **Main.R** sets up the ports to be used. 
Thus, if you need another endpoint, add it in **plumber_model.R**, and you will find it at:
http://{machineIP}:8000/[yourEndPoint] 

# Run Plumber in a Docker container

```
# Build image
docker build -t fpl_api .

# Run container
docker run --rm --name Api -p 8000:8000 fpl_api

```
Now the API should be available at:
http://{containerIP}:8000/data 

