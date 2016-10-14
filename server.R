# BSD_2_clause

library(googleVis)
library(shiny)

shinyServer(function(input, output) {
  output$past_status_scores <- renderGvis({
    threats <- c(-1, rep(NA, 8), -0.5, rep(NA, 5), -0.5, rep(NA, 2))
    demography <- c(-1, rep(NA, 8), -0.5, rep(NA, 5), 0, rep(NA, 2))
    year <- seq(from = 1998, to = 2015, by = 1)
    year <- as.character(year)
    dat <- data.frame(threats, demography, year)
    gvisLineChart(dat,
      xvar = "year",
      yvar = c("threats", "demography"),
      options = list(
        legend = "{position:'top'}",
        vAxis = "{title:'Score', minValue:'-1', maxValue:'1'}",
        hAxis = "{title:'Year'}",
        height = 300,
        dataOpacity = 0.3,
        pointSize = 9,
        lineWidth = 2,
        chartArea="{bottom: 20, left: 100, width:'80%', height:'70%'}"
      ) 
    )
  })
  outputOptions(output, "past_status_scores", suspendWhenHidden = TRUE)

})
