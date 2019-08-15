library(shiny)
library(rlang)

ui <- fluidPage(titlePanel(h1("IowaHouses SalePrice Predictor")),
                fluidRow(
                  column(3,
                         sliderInput("num_toilets", h3("Number of Toilets"),
                                     min = 0, max = 10, value = 2)
                        ),
                  column(3,
                         sliderInput("garage_cars", h3("Number of Cars Storable in Garage"),
                                     min = 0, max = 10, value = 2)
                        ),
                  column(3,
                         sliderInput("years_since_remodel", h3("Years Since Last Remodeled"),
                                     min = 0, max = 100, value = 15)
                  ),
                  column(3,
                         sliderInput("overall_qual", h3("Overall Quality of Matireal and Finish on House"),
                                     min = 0, max = 10, value = 6)
                  ),
                  column(3, 
                          numericInput("num_rooms", 
                                       h3("Total Number of Rooms (Excluding Bathrooms)"), 
                                       value = 6)
                         ),
                  column(3, 
                         numericInput("basement_area", 
                                      h3("Total SF of Basement Area"), 
                                      value = 1000)
                  ),
                  column(3, 
                         numericInput("above_ground_living_area", 
                                      h3("Total SF of above grade (ground) Living Area"), 
                                      value = 1400)
                  ),
                  column(3, 
                         numericInput("lot_area", 
                                      h3("Total Lot Area in SF"), 
                                      value = 9000)
                  ),
                  column(3,
                         selectInput("hood", h3("Neighborhood"), 
                                     choices = list("Bloomington Heights" = "Blmngtn", 
                                                    "Bluestem" = "Blueste",
                                                    "Briardale" = "BrDale",
                                                    "Brookside" = "BrkSide", 
                                                    "Clear Creek" = "ClearCr",
                                                    "College Creek" = "CollgCr",
                                                    "Crawford" = "Crawfor", 
                                                    "Edwards" = "Edwards",
                                                    "Gilbert" = "Gilbert",
                                                    "Iowa DOT and Rail Road" = "IDOTRR", 
                                                    "Meadow Village" = "MeadowV",
                                                    "Mitchel" = "Mitchel", 
                                                    "North Ames" = "NAmes",
                                                    "Northridge" = "NoRidge",
                                                    "Northpark Villa" = "NPkVill", 
                                                    "Northridge Heights" = "NridgHt",
                                                    "Northwest Ames" = "NWAmes",
                                                    "Old Town" = "OldTown", 
                                                    "South & West of Iowa State University" = "SWISU",
                                                    "Sawyer" = "Sawyer",
                                                    "Sawyer West" = "SawyerW", 
                                                    "Somerset" = "Somerst",
                                                    "Stone Brook" = "StoneBr",
                                                    "Timberland" = "Timber",
                                                    "Veenker" = "Veenker")
                                     )
                         )
                  ),
                
                fluidRow(
                  column(3,submitButton("Submit"))
                ),
                fluidRow(
                  column(6, h1("Predicted Price"),
                         textOutput("Prediction")
                         )
                )
                
)

#shinyApp(ui = ui, server = server)
