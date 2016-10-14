
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(shinydashboard)

dashboardPage(
  dashboardHeader(disable = TRUE),
  dashboardSidebar(disable = TRUE),
  dashboardBody(
    tags$style(
      "div.outer {
      position: fixed;
      background-color: #ffffff;
      top: 0px;
      left: 0;
      right: 0;
      bottom: 0;
      overflow: hidden;
      padding: 0;}"
    ),
    div(
      class = "outer",
      br(),
      fluidRow(
        column(8,
          valueBox(
            value = -0.5,
            subtitle = "Threat score",
            color = "navy",
            width = 6
          ),
          valueBox(
            value = 0,
            subtitle = "Demography score",
            color = "olive",
            width = 6
          )
        ),
        column(4,
          helpText("We have developed a method to score the status 
            of threats a species faces and the species' biological 
            (i.e., demographic) status. The scores can range from 
            -1 (threats are worsening / demographic status is 
            deteriorating) to +1 (threats are ameliorated / 
            demographic status is improving). Here we show how
            these scores can be presented to provide a quick
            overview of status, but these are not real estimates
            of the species' status. See ",
            tags$a(
              href = "https://peerj.com/articles/2230/",
              "our PeerJ paper for more details."
            )
          )
        )
      ),
      fluidRow(
        column(8,
          htmlOutput("past_status_scores")
        ),
        column(4,
          helpText("By extracting past scores we can better
            understand how the species has fared - in terms 
            of both threat and demographic changes - over an 
            extended period. These data are for illustration 
            only, but will provide much-needed information 
            when dynamic recovery plans are fully implemented."
          )
        )
      )
    )
  )
)
