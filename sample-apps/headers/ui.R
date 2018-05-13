shinyUI(pageWithSidebar(
  headerPanel("Shiny Client Data"),
  sidebarPanel(
    uiOutput("headers")
  ),
  mainPanel(
    h3("Headers passed into Shiny"),
    verbatimTextOutput("summary"),
    h3("Value of specified header"),
    verbatimTextOutput("value"),
    h3("Query String"),
    verbatimTextOutput("query"),
    #sliderInput("bins",
    #              "Number of bins:",
    #              min = 1,
    #              max = 50,
    #              value = 30)
    #),
    plotOutput("distPlot", height=250)
  )
))
