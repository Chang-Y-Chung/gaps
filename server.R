library(shiny)
library(ggplot2)

shinyServer(function(input, output) {

    df0 <- read.csv("blackearningsgap.csv")

    dataInput <- reactive({
        base <- if(input$base == "natives") "nb" else "nbm"
        df0[df0$grp1 == base, ]
    })

    groupInput <- reactive({
        afr <- if ("afr" %in% input$group) 1 else 0
        caribbean <- if("caribbean" %in% input$group) 1 else 0
        la <- if("la" %in% input$group) 1 else 0
        c(rgb(0.973, 0.463, 0.427, afr),
          rgb(0.000, 0.729, 0.220, caribbean),
          rgb(0.380, 0.612, 1.000, la))
    })

    output$plot <- renderPlot({
        data <- dataInput()
        p <- ggplot(data, aes(x=cohort, y=diff_pct, fill=grp2)) +
             geom_bar(position="dodge", stat="identity") +
             scale_y_continuous(limits=c(-20, 20)) +
             scale_x_continuous(limits=c(1960, 2010)) +
             scale_fill_manual(values = groupInput(),
                labels=c("African", "Caribbean", "Latin American")) +
             guides(fill=guide_legend(title=NULL)) +
             xlab("Immigration Cohort") +
             ylab("% Difference") +
             geom_hline(yintercept=0)
        print(p)
    })

})

