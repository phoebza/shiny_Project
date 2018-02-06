library(shiny)
library(DT)

# Define UI for application that plots random distributions
shinyUI(pageWithSidebar(

      # Application title
      headerPanel("shiny Project"),

      # Sidebar with a the following:
      # 1. slider input for number of observations
      # 2. radioButton to choose different distribution
      # 3. submitButton to update the output after input is selected or modified
      sidebarPanel(

            helpText("Please follow the following steps (doesn't need to be in sequence):"),
            helpText("1. Select the distribution type you would like to view", br(),
                     "2. choose number of observations from the slider (slider will determine how many",
                        "observations or data will each distribution type generate as selected in",
                        "point 1)",br(),
                     "3. Click the 'Update View' button below"),

            helpText(br()),
            radioButtons("dist", "Distribution type:",
                         list("Normal" = "norm",
                              "Uniform" = "unif",
                              "Log-normal" = "lnorm",
                              "Exponential" = "exp")),

            helpText(br()),
            helpText("Slide the slider to the left (to reduce number of observations) or to the right",
                     "(to increase number of observations).",br(), "The slider enables the user to observe how ",
                     "each distribution behaves when number of observations increase or decrease; and",
                     "the changes on the mean"),
            sliderInput("obs",
                        "Number of observations:",
                        min = 1,
                        max = 1000,
                        value = 500),

            helpText(br()),
            helpText("click the 'Update View' button once you have made changes in order to reflect on",
                  "the output from the main Panel"),
            # click the submitButton after changes to make updates
            submitButton("Update View"),

            helpText(br())
      ),

      # create tabs and show output accordinly
      mainPanel(
            h3("Select a tab to view your output of interest", br(), br(), br()),
            tabsetPanel(
                  tabPanel("line fitted-Distribution",br(), plotOutput("fitPlot",width = "100%"), br(), br(),
                           helpText(br(),
                                    tags$div(tags$ul(
                                          tags$li("The calculated fit variable (yFit) determines if the created",
                                                  "Histogram graph fit to the distribution curve based on the",
                                                  "selected distribution type."),
                                          tags$li("The mean for each histogram is indicated with a red vertical line")
                                    ),  style = "font-size: 15px")), br(),
                           h4("The calculated yFit values:", verbatimTextOutput("descrpLine"))),

                  tabPanel("normal Plot",br(), plotOutput("distPlot",width = "100%"), br(),
                           helpText("This is the Histogram graph for:"),
                           h4(verbatimTextOutput("descrp"))),

                  tabPanel("Summary", br(), verbatimTextOutput("summary"),
                           helpText(br(),
                                    tags$div(tags$ul(
                                          tags$li("The summary function gives an output of the distribution",
                                                  "of the generated dataset from the selected 'distribution type'."),
                                          tags$li("This output includes the range, quartiles, median, mean")
                                          ),  style = "font-size: 15px"))
                                   ),

                  tabPanel("Table", br(), "Below is dataset generated from the selected 'distribution type' in accordance",
                           "with number of observation (n) from the slider on the",
                           HTML(paste0("<b>", "sidebar panel:", "</b>")),
                           br(), br(), DT::dataTableOutput(outputId = "viewTable"))
            )
      )
))
