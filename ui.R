#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # INIT SELECTION
  fluidRow(
    column(4,
           icon("calendar"),
           h1("Derecho de petición"),
           actionButton("derecho","Crear")
    ),
    column(4,
           icon("calendar"),
           h1("Reposición"),
           actionButton("reposicion","Crear")
    ),
    column(4,
           icon("calendar"),
           h1("Tutela"),
           actionButton("tutela","Crear")
    )
  ),
  fluidRow(id="derechoRow",
           h1("Crear Derecho de Petición"),
    sidebarLayout(
      sidebarPanel(
        uiOutput("derechoControls")
        
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
        plotOutput("distPlot")
      )
    )
  ),
  fluidRow(id="reposicionRow",
           h1("Crear Reposicion"),
           sidebarLayout(
             sidebarPanel(
               uiOutput("reposicionControls")
             ),
             
             # Show a plot of the generated distribution
             mainPanel(
               plotOutput("distPlot")
             )
           )
  ),
  fluidRow(id="tutelaRow",
           h1("Crear Tutela"),
           sidebarLayout(
             sidebarPanel(
               uiOutput("tutelaControls")
             ),
             
             # Show a plot of the generated distribution
             mainPanel(
               plotOutput("distPlot")
             )
           )
  )
))
