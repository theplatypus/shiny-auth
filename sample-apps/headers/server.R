library(shiny)

shinyServer(function(input, output, session) {

  output$summary <- renderText({
    ls(env=session$request)
  })
  
  output$headers <- renderUI({
    selectInput("header", "Header:", ls(env=session$request))
  })
  
  output$query <- renderText({
    query <- parseQueryString(session$clientData$url_search)
    paste(query, sep = "", collapse=", ")
  })
  
  output$value <- renderText({
    if (nchar(input$header) < 1 || !exists(input$header, envir=session$request)){
      return("NULL");
    }
    return (get(input$header, envir=session$request));
  })

  output$distPlot <- renderPlot({
    x    <- rnorm(50, 42)  # Old Faithful Geyser data
    bins <- 20 # seq(min(x), max(x), length.out = input$bins + 1)
    query <- parseQueryString(session$clientData$url_search)
    txt <- paste(query, sep = "", collapse=", ")

    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white', main = txt)
  })

})
