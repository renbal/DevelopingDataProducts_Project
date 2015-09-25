library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Developing Data Products Shiny App"),
  sidebarPanel(width = 7,
    h3("Overview"),
    h5("This app was developed for the Coursera Developing Data Products course.
       The purpose this app is to make predictions of the weight of a chick given 
       his age in days and the diet on which he is being fed. A prediction model 
       is build based on the ChickWeight dataset found in R, and the functions of
       the RandomForest package."),
    h3("Instructions"),
    h5("To use this app to predict the weight of a Chick, in the fields provided 
        below, you must enter the age of that chick (in days) as well as select the 
        type of diet (1 - 4) on which the chick is fed. The diets differ in the amount
       of protein intake provided to the Chick, for eg: 1.) none, 2.) small, 3.) moderate,
       4.) high"),
    h5("After filling the necessary fields (age and diet), please click on the 'Submit'
       button. The app will verify your input data and based on the prediction model,
       indicate the expected/predicted weight of the chick (in gm)."),
    h3('Please Enter Your Values:'),
    numericInput('id1', 'Age of Chick:', 0, min=0, max=10, step=1 ),
    selectInput('id2', "Choose a diet:", choices = c(1, 2, 3, 4)),
    submitButton("Submit")
  ),
  mainPanel(width = 5,
    h3("Results"),
    h4("You entered chick age (days) as:"),
    verbatimTextOutput("oid1"),
    h4("You entered chick diet as: "),
    verbatimTextOutput("oid2"),
    h4("Predicted weight of chick (in gm): "),
    h4(verbatimTextOutput("prediction"))
  )
))