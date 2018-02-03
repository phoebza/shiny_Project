---
title       : Slidify Project
framework   : revealjs      # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : default       # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
github:
      user: phoebza
      repo: shiny_Project
---


## DEVELOPING DATA PRODUCTS

COURSE PROJECT 

author      : Phoebe  
job         : Data Science

--- .class #id 


## INTRODUCTION

This presentation is part of the Course Project for the Coursera Developing Data Products class. The peer assessed assignment has two parts. First, we need to create a Shiny application and deploy it on Rstudio's servers. Second, we should use Slidify or Rstudio Presenter to prepare a reproducible pitch presentation about the application. This presentation adresses the second part of the course project.

The app developed for this part of the assignment is avalilable at:

https://phoebza.shinyapps.io/shiny_project/

Source code for ui.R and server.R files are available on the GitHub:

https://github.com/phoebza/slidifyProject

---

## Slides for Shiny App Project
This shiny apps developed using shiny platform. The objective of this apps is to have below requirements:-

Some form of input (widget: textbox, radio button, checkbox, ...)
Some operation on the ui input in sever.R
Some reactive output displayed as a result of server calculations
You must also include enough documentation so that a novice user could use your application. -The documentation should be at the Shiny website itself. Do not post to an external link.

---


## Shiny Apps Features & Functions
This is a Shiny App Project that was developed to show the various widgets that can be used to the App.

This App have two sections, a sidebar which is on the left of the App and on the right is main screen that contains the tabs.  

The left side of the application:

The sidebar panel has two (2) control items and a submit button to update changes:
* checkbox to select choice of distribution, where data is also generated
* slider that allows user to increase number from observation from the selected distribution

Third item is the text output for the calculated fit line for each distribution

---


## Shiny Apps Features & Functions (cont.)

The right side of the application has four tabs:
* line fitted distribution
* normal plot of the distribution
* summary of the data generated
* content of data generated

---


## Shiny Apps Project
The shiny apps can be viewed at this page : https://phoebza.shinyapps.io/shiny_project/

---

## Shiny Github Repo Project & Code Reproducibility
The code for the shiny apps can be downloaded from the github repo at :-

https://github.com/phoebza/slidifyProject

This repo contains all the code and data making up this solution. The files and folders are the following:

README.md
app.R, ui.R and server.R - The shiny app code/presentation
The R Markdown used to create the RStudio Presenter presentation.
