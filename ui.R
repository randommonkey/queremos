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

.nav > li {
display: table-cell;
width: 33.33%;
padding-right: 1px;
height: auto;
vertical-align: bottom;
}
.tabbable > .nav > li > a {
background-color: white;
border-color: #26929d;
color:#26929d;
text-align: center;}

.tabbable > .nav > li.active > a  {background-color: #C4117F;  color:white; text-align: center; border-color:#C4117F}


.well {
min-height: 20px;
padding: 10px;
margin-bottom: 20px;
background-color: white;
border: 1px solid #e3e3e3;
border-radius: 4px;
width: 104.3%;
}

"

shinyUI(
  fluidPage(
    useShinyjs(),
    tags$head(
      includeScript("js/iframeSizer.contentWindow.min.js")
    ),
    inlineCSS(styles),
    
    tabsetPanel(
      id = "Info",
      tabPanel(
        "Información Personal",
        fluidRow(
          sidebarPanel(
            HTML('<p style = "font-size: 18px; font-weight: bold; color: #26929d;
                 margin-top: 10%; position: relative; margin-left: 6%;">"El derecho de acceso a la información se rige por los
                 principios de <span style = "color: #C4117F;">máxima publicidad y de transparencia</span> (artículos 2 y 3 de la ley 1712 de 2014). De acuerdo
                 a estos, toda la información que esté en poder de las
                 entidades obligadas a entregar información es pública
                 en principio y solo podrá restringirse el acceso en casos
                 excepcionales."</p> <span style = "color: #C4117F;font-size: 10px;margin-left: 40%;">Fundación para la libertad de prensa</span>')
            ),
          br(),
          br(),
          div(align = "center",
              column(4,
                     textInput("sol_nombre", label = "Nombre", value = ""),
                     selectizeInput("sol_tipo_id", label = "Doc.",
                                    c("Tarjeta de identidad", "Cedula de ciudadania", "Cedula extranjera")),
                     textInput("sol_direccion", label = "Dirección")
              )),
          column(4,
                 textInput("sol_apellidos", label = "Apellidos",value = ""),
                 textInput("sol_idNum", label = "N. de identidad",
                           value = ""),
                 textInput("sol_email", label = "Email"),
                 br(),
                 div(align = "right",
                 actionButton('nextOne', 'Siguiente'))
          )
          
          # )
          )),
      tabPanel(
        "Información de la entidad",
        
        fluidRow(
          sidebarPanel(
            HTML('<p style = "font-size: 18px; font-weight: bold; color: #26929d;
                 margin-top: 10%; position: relative; margin-left: 6%;">"La ley de Transparencia y Acceso a la Información Pública
                 se basa en el interés social de conocer asuntos que
                 afectan a todos, de ahí que los organismos y entidades
                 no se limiten a las estatales, sino a todas aquellas que
                 custodian y producen información sobre asuntos de interés
                 público."</p> <span style = "color: #C4117F;font-size: 10px;margin-left: 40%;">Fundación para la libertad de prensa</span>')
            ),
          br(),
          br(),
          div(align = "center",
              column(8,
                     textInput("ent_ciudad", label = "Ciudad"),
                     textInput("ent_nombre", label = "Nombre de la Entidad"),
                     br(),
                     br(),
                     br(),
                     div(align = "right",
                     actionButton('nextTwo', 'Anterior'),
                     actionButton('nextThree', 'Siguiente')))
          ))),
      tabPanel(
        "Información de los datos",
        
        fluidRow(
          sidebarPanel(
            HTML('<p style = "font-size: 15px; font-weight: bold; color: #26929d;
                 margin-top: 10%; position: relative; margin-left: 6%;">"Si usted considera que pedir la información lo puede
                 poner en riesgo, puede hacer su solicitud a través de
                 la Procuraduría, de la Defensoría o de la Personería,
                 basándose en el parágrafo del artículo 4 de la Ley 1712
                 de 2014. La ley protege al ciudadano que al solicitar
                 información pueda quedar en riesgo sin sacrificar el
                 derecho de acceso a la información, por eso, estas entidades
                 deberán reservar su nombre y dar trámite a la
                 solicitud"</p> <span style = "color: #C4117F;font-size: 10px;margin-left: 40%;">Fundación para la libertad de prensa</span>')
            ),
          br(),
          br(),
          column(8,
                 div(align = "center",
                     textInput('data_ciudad', 'Ciudad de la cual realiza la consulta'),
                     
                     textInput('data_int', 'Descripción de la información que desea obtener'),
                     
                     checkboxInput('info_reserva', 'La información solicitada es clasificada o de reserva'),
                     
                     actionButton("show", "Vista previa")
                    
                     ),
                 br(),
                 div(align = "right",
                 actionButton('nextFour', 'Anterior'))
          ))
        )
      )
    )
  )
