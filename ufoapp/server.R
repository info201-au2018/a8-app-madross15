# Load Libraries
library(shiny)
library(leaflet)

# Define server logic required to create a map of North America
shinyServer(function(input, output) {
    
    output$mymap <- renderLeaflet({
      selected_country <- subset(data, Country == toString(input$country))
      select_shape <- subset(selected_country, Shape == toString(input$shape))
      leaflet() %>%
        addTiles() %>%
        setView(lng = -93.85, lat = 37.45, zoom = 4) %>%
        addMarkers(data = select_shape, lng = ~lng, lat = ~lat, popup = ~Summary)

    })
    output$msg <- renderText({
      paste0("This map shows ", input$country," and the amount of ", input$shape, "-shaped UFO Sightings in 2016")
    })

})