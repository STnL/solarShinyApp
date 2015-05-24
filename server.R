library(shiny)

shinyServer(
  function(input, output) {
  
    output$state <- renderPrint({input$state}) 
    output$numPeople <- renderPrint({input$numPeople}) 
    output$sqMeters <- renderPrint({input$propertySquareMeters})  
    
    
    result  <- reactive({
      if ( (input$state == "NSW") || (input$state == "QLD") ) {
        if (input$numPeople > 4) {
            return("No")
        }  
        else {
            if (input$propertySquareMeters > 251) {
              return("No")
            }
            else {
              return("Yes")
            }
        }
      } 
      else { # state is Vic/SA
        return("No")
      }
    })
    
    # determine reason for sunlight hours
    sunlightHours <- reactive({
      if ( (input$state == "NSW") || (input$state == "QLD") ) {
        paste("Yes. ", input$state, "'s geography experiences enough sunlight hours to generate sufficient energy", sep="")
      } 
      else { # state is Vic/SA
        paste("No. ", input$state, "'s geography will not have sufficient sunlight hours to generate the required average energy consumption during April to October", sep = "")
      }
    })
    
    
    # determine reason for based on number of people on property
     householdSize <- reactive({
      if (input$numPeople < 5)  {
        paste("Yes.", input$numPeople, "person(s) in a household would on average consume", input$numPeople*5, "KWh per day and that is less than the 18KWh's that most solar units can generate per day")
      } 
      else { # more than 4 people
        paste("No. A household of", input$numPeople, "person(s) would consume", input$numPeople*5, "KWhs which is more than the 18KWhs that most solar panels generate per day.")
      }
    })
    
    # determine reason based on size of property
    propertySize <- reactive({
      if (input$propertySquareMeters < 251)  {
        paste("Yes. A", input$propertySquareMeters, "sqm of living space generally uses less than the daily average most solar panels can generate")
      } 
      else { # more than 250 sqm of living space
        paste("No. A", input$propertySquareMeters, "sqm of living space generally uses more than the daily average most solar panels can generate")
      }
    })
    
    output$result <- renderText({result()})
    output$sunlightHours <- renderText({sunlightHours()})
    output$householdSize <- renderText({householdSize() })
    output$propertySize <- renderText({propertySize() })
     
  }
)