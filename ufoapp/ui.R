# Load Libraries
library(shiny)
library(leaflet)
library(dplyr)

# Group the shap column
shapedata <- data %>% group_by(Shape) %>% summarise()

# Define UI for application that creates a map of North America
shinyUI(fluidPage(
  titlePanel("UFO Sightings Data-North America 2016"),
  sidebarLayout(
    sidebarPanel(
      selectInput("shape", "Select Shape", shapedata), 
      radioButtons("country", "Select Country",choices = list("USA", "CANADA"),  selected=1)
    ),
    mainPanel(
      leafletOutput("mymap", height = 500),
      textOutput("msg")
    )
  )
  )
  )
