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
                        "Principal: $", 0, min = 0, max = 999999, step = 1),
            numericInput("rate",
                         "Annual Interest Rate in Percent: ", 0, min = 0, max = 100, step = 0.1),
            numericInput("time",
                         "Length of Accumulation in Years: ", 0, min = 0, max = 999999, step = 1)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           textOutput("interestAcc")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    totalInterest <- reactive(input$principal*(1+(input$rate/100)*input$time))
    output$interestAcc <- renderText(totalInterest)
}

# Run the application 
shinyApp(ui = ui, server = server)
