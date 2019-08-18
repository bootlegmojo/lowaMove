library(scales)
library(RMySQL)
library(gtools)



#get data from shiny imput and SQL
house_prediction <- function(input) {
  
  #connect to MySQL server
  
  mydb <-dbConnect(MySQL(), 
                   user='root', 
                   password='root',
                   dbname='iowa', 
                   host='127.0.0.1',
                   port=3306)
  
  #retrieve server data
  
  train <- dbGetQuery(mydb, "select * from iowa")
  
  #disconects database when data has been retrieved
  
  dbDisconnect(mydb)
  
  #train <- read.csv("iowadata.csv") #for offline file retrieval
  
  #Remove ID collumn
  train_noID <- train[,-1]
  
  #creating a data frame and renaming it to be joined on to train_noid
  
  shiny_data <- data.frame(input$num_toilets, input$garage_cars, input$years_since_remodel, input$overall_qual,
                           input$num_rooms, input$basement_area, input$above_ground_living_area, input$lot_area,
                           input$hood)
  names(shiny_data) <- c("toilets", "GarageCars", "YearsSinceRemodel", "OverallQual",
                         "TotRmsAbvGrd", "TotalBsmtSF", "GrLivArea", "LotArea",
                         "Neighborhood")
  
  datafull <- smartbind(train_noID, shiny_data)
  
  #splitting data for training
  
  train <- as.data.frame(datafull[1:nrow(datafull)-1,])
  test <- as.data.frame(datafull[nrow(datafull),])
  
  #performing linear regression model with data to make a prediction
  
  model <- lm(formula = SalePrice ~ GrLivArea * TotalBsmtSF + Neighborhood + LotArea + OverallQual + toilets + TotRmsAbvGrd + GarageCars + YearsSinceRemodel , data=datafull)
  predictions <- predict(model, test)
  print(predictions)
    return(predictions)
  }

