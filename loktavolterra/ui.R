ui <- fluidPage(
  
  # App title ----
  titlePanel("Lotka-Volterra"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar to demonstrate various slider options ----
    sidebarPanel( 
      
      # Input: Simple integer interval ----
      sliderInput("alpha", "Alpha:",
                  min = 0, max = 1,
                  value = 0.5, step = 0.01),
      
      # Input: Decimal interval with step value ----
      sliderInput("beta", "Beta:",
                  min = 0, max = 1,
                  value = 0.02, step = 0.01),
      
      # Input: Specification of range within an interval ----
      sliderInput("gamma", "Gamma:",
                  min = 0, max = 1,
                  value =0.6, step =0.01),
      
      # Input: Custom currency format for with basic animation ----
      sliderInput("delta", "Delta:",
                  min = 0, max = 1,
                  value =0.02, step =0.01),
      
      # Input: Custom currency format for with basic animation ----
      sliderInput("prey", "Prey:",
                  min = 0, max = 100,
                  value =25),
     
       sliderInput("predator", "Predators:",
                  min = 0, max = 100,
                  value =25)
      

     ), 
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Table summarizing the values entered ----
       plotOutput(outputId = "main_plot", height = 700)
      # Output: Table summarizing the values entered ----
     # tableOutput("values")
      
    )
  
    
  )
)




