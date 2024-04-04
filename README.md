# Running Shiny apps using renv inside ShinyProxy

This repository describes how to add a Shiny app
using [renv](https://rstudio.github.io/renv/articles/renv.html) inside
ShinyProxy.

Related demos:

- [plain Shiny demo](https://github.com/openanalytics/shinyproxy-demo)
- [plain Shiny demo (no R package)](https://github.com/openanalytics/shinyproxy-demo-minimal)
- [Shiny demo using pak](https://github.com/openanalytics/shinyproxy-shiny-pak-demo)
- [Shiny demo using r2u](https://github.com/openanalytics/shinyproxy-shiny-r2u-demo)

# Build the Docker image

To pull the image made in this repository from Docker Hub, use

```bash
sudo docker pull openanalytics/shinyproxy-shiny-renv-demo
```

the relevant Docker Hub repository can be found at https://hub.docker.com/r/openanalytics/shinyproxy-shiny-renv-demo

To build the image from the Dockerfile, clone this repository, then navigate to its root directory and run

```bash
sudo docker build -t openanalytics/shinyproxy-shiny-renv-demo .
```

# ShinyProxy Configuration

To add the shiny application to ShinyProxy, add the following lines to its configuration file (see [application.yml](./application.yml) for a complete file):

```yaml
specs:
  - id: shiny-with-renv
    display-name: Shiny using renv Demo Application
    container-image: openanalytics/shinyproxy-shiny-renv-demo
```

# References

- [ShinyProxy.io](https://shinyproxy.io/)
- [All demos](https://shinyproxy.io/documentation/demos/)

**(c) Copyright Open Analytics NV, 2024.**
