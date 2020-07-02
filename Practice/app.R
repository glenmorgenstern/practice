#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Simple Interest Calculator"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            numericInput("principal",
                        "Principal: $", min = 0, max = 999999, step = 1),
            numericInput("rate",
                         "Annual Interest Rate in Percent: ", min = 0, max = 100, step = 0.1),
            numericInput("time",
                         "Length of Accumulation in Years: ", min = 0, max = 999999, step = 1)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("interestPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
