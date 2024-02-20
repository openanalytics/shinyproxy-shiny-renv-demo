#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

ui <- fluidPage(
  
  titlePanel("Old Faithful Geyser"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      tagList("Waiting time between eruptions and the duration of the eruption for the Old Faithful 
          geyser in Yellowstone National Park, Wyoming, USA.", 
        tags$br(), 
        tags$br(), 
        paste0("The data contains ", nrow(faithful), " observations on ", ncol(faithful), " variables:"),
        tags$ul(
          tags$li(HTML(paste(tags$i("eruptions"), "(numeric):	Eruption time in mins"))), 
          tags$li(HTML(paste(tags$i("waiting"), "(numeric):	Waiting time to next eruption (in mins)")))
        ),
        tags$br()
      ),
      
      sliderInput("bins",
        "Number of bins:",
        min = 1,
        max = 50,
        value = 25)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$distPlot <- renderPlot({
      x    <- faithful[, 2]  # Old Faithful Geyser data
      bins <- seq(min(x), max(x), length.out = input$bins + 1)
      
      hist(x, breaks = bins, main = "Histogram of waiting time", xlab = "Waiting time", col = 'darkgray', border = 'white')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
