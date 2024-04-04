FROM openanalytics/r-ver:4.3.3

RUN /rocker_scripts/setup_R.sh https://packagemanager.posit.co/cran/__linux__/jammy/latest
RUN echo "\noptions(shiny.port=3838, shiny.host='0.0.0.0')" >> /usr/local/lib/R/etc/Rprofile.site

# system libraries of general use
RUN apt-get update && apt-get install --no-install-recommends -y \
    pandoc \
    pandoc-citeproc \
    libcairo2-dev \
    libxt-dev \
    && rm -rf /var/lib/apt/lists/*

# system library dependency for the euler app
RUN apt-get update && apt-get install --no-install-recommends -y \
    libmpfr-dev \
    && rm -rf /var/lib/apt/lists/*

# pin renv version
ENV RENV_VERSION 1.0.5
RUN R -q -e "options(warn=2); install.packages('remotes')"
RUN R -q -e "options(warn=2); remotes::install_version('renv', '${RENV_VERSION}')"

# install R dependencies
# do this before copying the app-code, to ensure this layer is cached
WORKDIR /build
COPY euler/renv.lock /build/renv.lock
RUN R -q -e 'options(warn=2); renv::restore()'

# install R code
COPY euler /build/euler
RUN R CMD INSTALL /build/euler

EXPOSE 3838

CMD ["R", "-q", "-e", "euler::runShiny()"]
