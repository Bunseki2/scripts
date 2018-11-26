#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("DNase Plot"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
        numericInput("Run", "Select run number",min=1, max=11, value=1), 
        sliderInput("size", "Select point size", min=1, max=15, value=4),
        textInput("title", "Enter a title", value="This chart rocks!")
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
      x <- subset(DNase,Run == input$Run)
      ggplot(x, aes(x = conc, y = density)) + 
        geom_point(size = input$size) + ggtitle(input$title)
   })
}

# Run the application 
shinyApp(ui = ui, server = server)
##shiny::runApp()
