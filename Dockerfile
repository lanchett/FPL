FROM rocker/r-base
MAINTAINER Jeff Allen <docker@trestletech.com>

RUN apt-get update -qq && apt-get install -y \
  git-core \
  libssl-dev \
  libcurl4-gnutls-dev \
  libssh2-1-dev \
  libxml2-dev

RUN R -e 'install.packages(c("devtools", "dplyr", "purrr", "jsonlite"))'
RUN R -e 'devtools::install_github("lanchett/FPL")'
RUN install2.r plumber
RUN install2.r tidyr
RUN R -e 'install.packages(c("readr"))'

# copy everything from the current directory into the container
COPY / /

EXPOSE 8000

# when the container starts, start the Main.R script
ENTRYPOINT ["Rscript", "Main.R"]

