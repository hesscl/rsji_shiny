library(shiny)
library(vcd)
library(mosaic)
library(xtable)
library(RColorBrewer)
load("./data/2016data.rdata")
myColors <- brewer.pal(6,"Blues")

my.settings <- list(
  superpose.polygon=list(col=myColors[2:5], border="transparent"),
  strip.background=list(col=myColors[6]),
  strip.border=list(col="black",lwd=0),
  border=list(lwd=0)
)

# Define server logic required to do spine plot
shinyServer(function(input, output) {
  
  twoway <- reactive({
    paste("~ ", input$demog, " +", input$var)
  })
  
  twoway2 <- reactive({
    paste("~ ", input$var, " +", input$demog)
  })
  
  output$caption <- renderText({
    twoway()
  })
    
  output$spine <- renderPlot({
    spine(xtabs(as.formula(twoway()), data = phone)[, 1:4],
          gp = gpar(fill = myColors,
                    lwd = 0))
  })
  
  output$bar <- renderPlot({
    barchart(xtabs(as.formula(twoway2()), data = phone)[1:4,],
             horizontal = T,
             par.settings = my.settings,
             auto.key = T)
  })
  
  output$question <- renderPrint({
    if(input$var == "nq9"){
      "How do you rate Seattle's housing affordability?"
    }
    else if (input$var == "nq29"){
      "How much trust do you have in SPD to enforce the law equally across race?"
    }
    else if (input$var == "nq4"){
      "How do you rate the availability of City services and resources in your neighborhood?"
    }
    else if (input$var == "nq23"){
      "How do you rate Seattle’s public schools?"
    }
    else if (input$var == "nq40"){
      "How would you rate race relations in Seattle?"
    }
  })
  
  
})