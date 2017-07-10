library(shiny)
library(shinysteps)
library(shinyjs)
library(tidyverse)
library(bsplus)

styles <- "

#headsty{
max-width: 100%;
margin-top: 2%;
margin-left: 10%;
margin-right: 10%;
}

.app-button{
    display:inline-block;
}
.row{
  text-align:left;
  margin-left:0px;
}

.firmLine{     
  text-decoration:overline;
  color : black;
}

.firmResultat{
  color : black;
}

#sidebar_step2 {
color : green;
border: solid red;
background-color: red;
}



"

stepsPage(styles = styles,
          stepsHeader(show = FALSE, height = 150,
                      br()
           ),
    stepsBody(initStep = "step1",
            stepPanel(id="step1",
                      
                      sideBarStep(title = "PASO 1"#,
                                  #p("Datos personales")
                      ),
                      
                      mainStep(
                        h4("Información sobre el solicitante"),
                        #br(),
                        #textInput("sol_nombre", label = "Nombre", value = ""),
                        uiOutput("info_gen")
                        
                      )
            ),
            stepPanel(id="step2",
                      sideBarStep(title = "PASO DOS"
                      ),
                      mainStep(
                        h4("Datos sobre la entidad y/o funcionario al que se solicita la información"),
                        uiOutput("info_inst")
                      )
            ),
            stepPanel(id="step3",
                      sideBarStep(title = "PASO TRES"
                      ),
                      mainStep(
                        h4("Datos sobre la información requerida"),
                        uiOutput("info_data"),
                        actionButton("show", "Vista previa")
                      )
            )
  )
)
