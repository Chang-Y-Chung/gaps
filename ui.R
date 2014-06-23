library(shiny)

shinyUI(fluidPage(
    titlePanel("Earnings Difference"),

    p("PURPOSE: This simple application demonstrates benefits of an interactive
      graph, which makes it easy to present complicated data
      simpler by letting the readers actively engage in the presentation:
      choosing which and how much information is to be presented at once."),
    p("BACKGROUND: This example is a re-draw of six bar graphs in Figures 1 to 3 in
      a recent scholarly research article published in the academic journal, 
      Demography (See bottom for the reference). This article reports and
      compares the projected average earnings between black natives and 
      three black immigrant groups -- by origin and arrival cohort."),
    p("INSTRUCTION: Choose a baseline by using the drop down selector,
       and select one to three check boxes to see the corresponding
       group's data on graphs."),
       
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
    ),
    
    p("Notes: Each bar represents projected difference in
      percentages in weekly earnings between native black (or native
      black movers) and black immigrants with 20 or more years of
      US residency. Immigrants are grouped by their origin:
      English-speaking Afria, English-speaking Caribbean, and
      Latin America. Immigration cohort of 1965 includes all
      pre-1970 cohorts.", style="word-break:normal; font-size:90%"),
    p("Reference: Hamilton, Tod G. (2014) Selection, Language 
      Heritage, and the Earnings Trajectories of Black Immigrants
      in the United States. Demography. Vol. 51 Pp. 975-1002, 
      DOI 10.1007/s13524-014-0298-5.", style="word-break:normal; 
      font-size:90%")
    
))
