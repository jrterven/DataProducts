# Shiny App for the Developing Data Products Project
# from the Coursera's Data Science specialization

library(shiny)

shinyUI(
    pageWithSidebar(
        # Application title
        headerPanel("Medical Expenses Prediction"),
        
        sidebarPanel(
            numericInput('age','Age', 30, min = 0, max = 150, step = 1),
            numericInput('children','Children', 0, min = 0, max = 10, step = 1),
            numericInput('weight','Weight (kg)', 50, min = 10, max = 200, step = 1),
            numericInput('height','Height (m)', 1.50, min = 0.30, max = 2.5, step = 0.05),
            selectInput("sex", label = "Sex", choices = list("Female" = "female", "Male" = "male"), 
                        selected = "female"),
            selectInput("smoker", label = "Smoker", choices = list("No" = "no", "Yes" = "yes"), 
                        selected = "no"),
            selectInput("region", label = "Region", choices = list("NorthEast" = "northeast", 
                        "NorthWest" = "northwest", "SouthEast" = "southeast", "SouthWest" = "southwest"), selected = 1),
            
            submitButton('Submit')
        ),
        mainPanel(
            h2("Description"),
            helpText("This app estimates the average medical care expenses 
                     for a population segment. These estimates could be used 
                     to create actuarial tables which set the price of yearly 
                     premiums higher or lower depending on the expected 
                     treatment costs"),
            h3("How to use"),
            helpText("To estimate the medical care expenses just fill the 
                     inputs on the left and press Submit. The result will appear
                     on the Estimated Expenses box."),
            h3('Estimated Expenses'),
            verbatimTextOutput("prediction")
        )
    )
)
