library(shiny)
library(datasets)
attach(ChickWeight)
library(caret)
library(randomForest)

set.seed(460)
modfit <- randomForest(weight~., data=ChickWeight, method="class")

predWeight <- function(age, diettype) {
  sample <- data.frame(weight = 0, Time = age, Chick=as.factor(0), Diet=as.factor(diettype))
  levels(sample$Diet) <- levels(ChickWeight$Diet)
  return(predict(modfit, sample, type="class"))
}

shinyServer(
  function(input, output){
    output$oid1 <- renderPrint({input$id1})
    output$oid2 <- renderPrint({input$id2})
    output$prediction <- renderPrint({predWeight(input$id1, input$id2)})
  }
)