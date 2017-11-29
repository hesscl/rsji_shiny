library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(theme = "bootstrap.css",
  titlePanel(windowTitle = "RSJI 2016 Community Survey",
             title=img(src="rsji-logo-lg.png")),
             
  
  sidebarLayout(
    sidebarPanel(h4("Explore the Community Survey"),
                 h6("This webapp allows Seattle residents to analyze the data collected from the 2016 Race and Social Justice Initiative Community Surveys, using a few selected data visualizations."),
                 br(),
                 h4("Select the data to visualize:"), 
                 selectInput("var",
                             label = "Topic:",
                             choices = list("Housing Affordability" = "nq9",
                                         "Policing" = "nq29",
                                         "Neighborhood Resources" = "nq4",
                                         "Race Relations" = "nq40",
                                         "Schools" = "nq23"),
                             selected = "nq9"),
                 br(),
                 radioButtons("demog", label = ("Demographic"),
                              choices = list("Race" = "Race", 
                                             "Gender" = "Gender",
                                             "Housing Status" = "HousingStatus"),
                              selected = "Race"),
                 br(),
                 br(),
                 br(),
                 br(),
                 br(),
                 br(),
                 br(),
                 br()),
         #        radioButtons("year", label = h4("Year"),
          #                    choices = list("2013" = 13, "2016" = 16),
           #                   selected = 16)),
  
    mainPanel(
      h3(verbatimTextOutput("question")),
      tabsetPanel(
        tabPanel("Spineplot", plotOutput("spine")),
        tabPanel("Barchart", plotOutput("bar"), width = "100%")
      ),
      br(),
      br(),
      br(),
      br()
    )
  )
))