# Shiny App for the Developing Data Products Project
# from the Coursera's Data Science specialization

library(shiny)

# Load Insurance Data
insurance <- read.csv("insurance.csv", stringsAsFactors = TRUE)

# Add a non-linear relationship
insurance$age2 <- insurance$age^2

# Add binary variable
insurance$bmi30 <- ifelse(insurance$bmi >= 30, 1, 0)

# Regression model
ins_model2 <- lm(charges ~ age + age2 + children + bmi + sex +
                     bmi30*smoker + region, data = insurance)


shinyServer(
    function(input, output) {
        bmi <- reactive({input$weight/(input$height^2)})
        bmi30 <- reactive({ifelse(bmi() >= 30, 1, 0)})
        prediction <- reactive({
                predict(ins_model2,data.frame(age=input$age, age2=input$age^2, 
                            children=input$children,bmi=bmi(), 
                            bmi30=bmi30(),smoker=input$smoker,
                            sex=input$sex, region=input$region))
        })
        output$prediction <- renderPrint(paste("$",format(prediction(), big.mark=","),sep=""))
#        output$prediction <- renderPrint(prediction())
    }
)