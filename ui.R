library(shiny)

# Define UI for application that plots random distributions
shinyUI(pageWithSidebar(

      # Application title
      headerPanel("Data Science - shiny Project"),

      # Sidebar with a the forllowing:
      # 1. slider input for number of observations
      # 2. radioButton to choose different distribution
      # 3. submitButton to update the output after input is selected or modified
      sidebarPanel(

            radioButtons("dist", "Distribution type:",
                         list("Normal" = "norm",
                              "Uniform" = "unif",
                              "Log-normal" = "lnorm",
                              "Exponential" = "exp")),
            br(),

            sliderInput("obs",
                        "Number of observations:",
                        min = 1,
                        max = 1000,
                        value = 500),

            helpText("Note: while the data view will show only the specified",
                     "number of observations, the summary (on the 'summary tab') will still be based",
                     "on the full dataset."),

            h4("click the submitButton after changes to make updates"),

            # click the submitButton after changes to make updates
            submitButton("Update View"),

            h4("The calculated yFit values:", color = "blue"),

            textOutput("yFit")
      ),

      # create tabs and show output accordinly
      mainPanel(
            tabsetPanel(
                  tabPanel("line fitted-Distribution", plotOutput("fitPlot")),
                  tabPanel("normal Plot", plotOutput("distPlot")),
                  tabPanel("Summary", verbatimTextOutput("summary")),
                  tabPanel("Table", tableOutput("viewTable"))
            )
      )
))
