FROM rocker/verse:4.0.3

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

#sf and tidycensus 
RUN apt-get update && install --y libudunits2-dev
