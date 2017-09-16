

function(input, output) {
  library(shiny)
  library(ggplot2)
  library(deSolve)
  
  
  
  outx<- reactive({
    
    p <- c(alpha=input$alpha, beta= input$beta,delta= input$delta, 
          gamma= input$gamma)
  
  
     s<- c(x= input$prey, y=input$predator)
  
  
  
  # lotka volterra function
  LotVmod <- function (Time, State, Pars) {
    with(as.list(c(State, Pars)), {
      dx = x*(alpha - beta*y)
      dy = -y*(gamma - delta*x)
      return(list(c(dx, dy)))
    })
  }
  
  Time <- seq(0, 150, by = 1)
  
  outs <- as.data.frame(ode(func = LotVmod, y = s, parms = p, times = Time))
  
  
  
  return(outs)
})
  
  
  output$main_plot <- renderPlot({
  
  a <- 
    outx()

  matplot(a[,-1], type = "l", xlab = "Time (dimensionless)", ylab = "Population size")
  legend("topright", c("Prey", "Predators"), lty = c(1,2), col = c(1,2), box.lwd = 0)
  })
  

  
  }
  
  