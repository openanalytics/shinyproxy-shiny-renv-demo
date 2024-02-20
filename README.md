# Running Shiny apps with renv inside ShinyProxy

This repository describes how to add a shiny app with renv inside ShinyProxy (at least version 2.5.0).

# Build the Docker image

To pull the image made in this repository from Docker Hub, use

```
sudo docker pull openanalytics/shinyproxy-shiny-renv-demo
```

the relevant Docker Hub repository can be found at https://hub.docker.com/r/openanalytics/shinyproxy-shiny-renv-demo

To build the image from the Dockerfile, clone this repository, then navigate to its root directory and run

```
sudo docker build -t openanalytics/shinyproxy-shiny-renv-demo .
```

# ShinyProxy Configuration

To add the shiny application to ShinyProxy, add the following lines to its configuration file (see [application.yml](./application.yml) for a complete file):
```
specs:
  - id: shiny-with-renv
    display-name: Shiny with renv Demo Application
    container-image: openanalytics/shinyproxy-shiny-renv-demo
```


**(c) Copyright Open Analytics NV, 2024.**