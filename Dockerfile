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
RUN apt-get update \
    && apt-get install -y libudunits2-dev
    
RUN Rscript -e 'install.packages(c("sf", "tidycensus"), dependencies = TRUE, repos = "https://cloud.r-project.org")'
RUN git clone   https://github.com/r-spatial/sf.git
RUN R CMD build --no-build-vignettes sf
RUN R CMD INSTALL sf_*tar.gz

RUN apt-get install -y pandoc pandoc-citeproc

RUN R CMD check --as-cran sf_*tar.gz
