shinyUI(
  pageWithSidebar(
    headerPanel("Would purchasing solar panels for your home earn you a profit from energy generators in Australia?"),
  
    sidebarPanel(
        radioButtons(inputId = "state" ,
                     label = 'What Australian State do you reside in?' ,
                     choices = list("NSW" = "NSW","SA" = "SA" ,"QLD" = "QLD", "VIC" = "VIC")
        ),
        numericInput(inputId = "numPeople",
                      label = "How many people are in your household?" ,
                      1, min = 1 , max = 20, step = 1
         ),
        numericInput(inputId = "propertySquareMeters",
                      label = "How many square meters is your living space?" ,
                      50, min = 50 , max = 2000, step = 50
         )
    ),

    mainPanel(
        h3('Selections:'),
        h5('State selected') ,
        verbatimTextOutput("state") ,
        h5('Number of people in household entered'), 
        verbatimTextOutput("numPeople"), 
        h5('Living space size (sqm) entered' ), 
        verbatimTextOutput("sqMeters"),
        
        h3('Results:'),
        h5('Overall Result '), 
        verbatimTextOutput("result"),
        #verbatimTextOutput("result"),
        h5('Reasons '), 
        verbatimTextOutput("sunlightHours"),
        verbatimTextOutput("householdSize"),
        verbatimTextOutput("propertySize")
  )
)
)