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

    # Application title
    titlePanel("Simple Interest Calculator"),

    sidebarLayout(
        sidebarPanel(
            numericInput("principal",
                        "Principal: $", 0, min = 0, max = 999999, step = 1),
            numericInput("rate",
                         "Annual Interest Rate in Percent: ", 0, min = 0, max = 100, step = 0.1),
            numericInput("time",
                         "Length of Accumulation in Years: ", 0, min = 0, max = 999999, step = 1)
        ),

        mainPanel(
           textOutput("interestAcc")
        )
    )
)

server <- function(input, output) {
        
        totalInterest <- reactive({ 
            principal <- input$principal     
            length <- input$time
            rate <- input$rate
            intnum <-principal*(1+(rate/100)*length)
            return(as.character(intnum)) })
        
        output$interestAcc <- renderText(
            paste0("Final value is $", totalInterest() ))
    }


# Run the application 
shinyApp(ui = ui, server = server)
