FROM openanalytics/r-ver:4.3.2

RUN apt-get update 

# copy necessary files
## app folder
COPY /shinyApp ./app
## renv.lock file
COPY /shinyApp/renv.lock ./renv.lock

# install renv & restore packages
RUN R -q -e "install.packages(c('shiny', 'renv'))"
RUN R -q -e 'renv::restore()'

# expose port
EXPOSE 3838

# run app on container start
CMD ["R", "-e", "shiny::runApp('/app', host = '0.0.0.0', port = 3838)"]
