#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("Estimated price of diamonds per carat"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            h3("Which diamonds are you interested in?"),
            
            radioButtons(inputId="inCut",
                         label = "Diamonds cut: ",
                         choices = c("Fair","Good","Very Good","Premium","Ideal"),
                         inline = TRUE),
            radioButtons(inputId="inColor",
                         label = "Diamonds color: ",
                         choices = c("D","E","F","G","H","I","J"),
                         inline = TRUE),
            sliderInput("slider1", "What is the carat of the diamond?",
                        0,5,step = 0.1,value=1)
            
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("Plot"),
            textOutput("Pred1"),
            h3(" How to use this app: "),
            h4("check this link: https://github.com/szykora17/Shinyappproject")
        )
    )
)
