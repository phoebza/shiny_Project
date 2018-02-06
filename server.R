library(shiny)
library(DT)

# Define server logic required to generate and plot a random distribution
shinyServer(function(input, output) {

      # Reactive expression to generate the requested distribution. This is
      # called whenever the inputs change. The renderers defined
      # below then all use the value computed from this expression

      datasetInput <- reactive({
            dist <- switch(input$dist,
                           norm = rnorm,
                           unif = runif,
                           lnorm = rlnorm,
                           exp = rexp,
                           rnorm+input$obs)

            dist(input$obs)
      })

      # Generate a plot of the data. Also uses the inputs to build the
      # plot label. Note that the dependencies on both the inputs and
      # the 'data' reactive expression are both tracked, and all expressions
      # are called in the sequence implied by the dependency graph
      output$distPlot <- renderPlot({
            # generate an rnorm distribution and plot it
            dist <- input$dist

            n <- input$obs

            h <- hist(datasetInput(),xlab = 'data',
                 main=paste('r', dist, '(', n, ')', sep=''))
      })

      output$fitPlot <- renderPlot({
            # generate an rnorm distribution and plot it
            dist <- input$dist

            n <- input$obs

            h <- hist(datasetInput(),xlab = 'data',
                      main=paste('r', dist, '(', n, ')', sep=''))

            # fitting the distribution curve to the histogram
            xfit <- seq(min(datasetInput()), max(datasetInput()), length = 40)

            yfit <- dnorm(xfit, mean = mean(datasetInput()),sd = sd(datasetInput()))

            # Calculation to prepare the fitting the distribution curve
            yfit <- yfit * diff(h$mids[1:2] * length(datasetInput()))

            lines(xfit,yfit, col = "blue", lwd = 2)

            abline(v = mean(datasetInput()), col="red", lwd=3, lty=2)

            # Display the fitting distribution line curve on the side bar
            output$descrpLine <- renderPrint({
                  yfit
            })
      })

      # Generate a summary of the dataset
      output$summary <- renderPrint({
            dataset <- datasetInput()
            summary(dataset)
      })

      # Generate an HTML table view of the data
      output$viewTable <- DT::renderDataTable({
            datatable(data.frame(x=datasetInput()), colnames = c('n', 'data'))

      })

      output$descrp <- renderPrint({
            input$dist
      })
})
