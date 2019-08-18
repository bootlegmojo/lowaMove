library(shiny)

#setting work directory to current folder
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#runs through the data to add functions and ui to the r environment

source("ui.R")
source("function.R")

#server function updates prediction on user input (submit button)

server <- function(input, output) { 
  output$Prediction<- renderText({
    paste("Predicted House Value of $", as.integer(house_prediction(input)))
  })}


