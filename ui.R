library(shiny)

shinyUI(fluidPage(
    titlePanel("Earnings Difference"),

    sidebarLayout(

        sidebarPanel(

            helpText("Weekly earnings gap between black 
                natives and immigrants by origin and cohort."
            ),

            selectInput("base",
                label = "Choose a baseline group:",
                choices = c("natives", "native movers"),
                selected = "natives"
            ),

            checkboxGroupInput("group",
                label = "Check all immigrant groups to compare against baseline:",
                choices = list("African"="afr", "Caribbean"="caribbean",
                    "Latin American"="la"),
                selected = "afr"
            )

        ),
        mainPanel(
            plotOutput("plot"),
            htmlOutput("note")
        )
    )
))
