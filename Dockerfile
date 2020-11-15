FROM rocker/geospatial:4.0.3

#sf and tidycensus 
RUN apt-get update \
    && apt-get install -y libudunits2-dev libproj-dev

# install from MRAN, a version-frozen mirror of CRAN like this
RUN install2.r --error \
    --deps TRUE \
    aws.s3 \
    fixest \
    Formula \
    gmt \
    googledrive \
    gtools \
    pacman \
    plyr \
    rmdcev \
    rstan \
    sf \
    tidycensus 
    

# install with devtools like this if needed
# RUN Rscript -e "devtools::install_github("tidyverse/tidyr");"


