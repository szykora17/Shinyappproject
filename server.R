#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
function(input, output, session) {

    output$Plot <- renderPlot({

        # load and filter dataset
            data <- diamonds
            data1 <- data[data$cut == input$inCut & data$color == input$inColor, ]
        #build a linear model   
            model1 <- lm(price ~ carat, data=data1)
        
        #plot the data    
            plot(data1$carat, data1$price, pch = 19, 
                 xlab = "Carat",
                 ylab = "Price",
                 main = paste("Price per carat for", input$inCut, "cut and", input$inColor, "color"),
                 xlim = c(0, 5), ylim = c(0, 20000))
            abline(model1,col="red",lwd=2)
            # Add a point for the selected carat
            points(input$slider1, predict(model1, newdata = data.frame(carat = input$slider1)), 
                   col = "blue", pch = 19, cex = 2)
    })
            output$Pred1 <- renderText({
                    data <- diamonds
                    data1 <- data[data$cut == input$inCut & data$color == input$inColor, ]
                    model1 <- lm(price ~ carat, data = data1)
                    pred_price <- predict(model1, newdata = data.frame(carat = input$slider1))
                    paste("Estimated price for a", input$slider1, "carat diamond:", round(pred_price, 2), "USD")
        
            

    })

}
