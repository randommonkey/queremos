#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)


formulario_solicitante <- column(12, h3("Informacion sobre el solicitante del dataset"),
                                     
                                     textInput("text", label = h4("Nombre"), 
                                               value = "Enter text..."),
                                     
                                     textInput("text", label = h4("Apellidos"), 
                                               value = "Enter text..."),
                                     
                                     textInput("text", label = h4("Tipo Identificacion"), 
                                               value = "Enter text..."),
                                     
                                     textInput("text", label = h4("Identificacion"), 
                                               value = "Enter text..."),
                                     
                                     textInput("text", label = h4("Telefono"), 
                                               value = "Enter text..."),
                                     
                                     textInput("text", label = h4("Email"), 
                                               value = "Enter text..."),
                                     
                                     
                                     actionButton("derecho","Crear"))

formulario_institucion <- column(12, h3("Informacion sobre la institucion que administra el dataset"),
                                     
                                     textInput("text", label = h4("Nombre de la Entidad"), 
                                               value = "Enter text..."),
                                     
                                     textInput("text", label = h4("Ciudad"), 
                                               value = "Enter text..."),
                                     
                                     textInput("text", label = h4("Direccion"), 
                                               value = "Enter text...")
                                 )
formulario_funcionario <- column(12, h3("Informacion sobre la institucion que administra el dataset"),
                                 
                                 # agregar opcion para permitir remitir el template a un funcionario anonimo 
                                 # en caso que el usuario no conozca el nombre del funcionario
                                 textInput("text", label = h4("Nombre del funcionario encargado"), 
                                           value = "Enter text..."),
                                 
                                 textInput("text", label = h4("Apellidos del funcionario encargado"), 
                                           value = "Enter text..."),
                                 
                                 textInput("text", label = h4("Cargo del Funcionario"), 
                                           value = "Enter text...")
                                 
                          )

formulario_dataset <- column(12, h3("Informacion sobre la institucion que administra el dataset"),
                                 
                                 # agregar opcion para permitir remitir el template a un funcionario anonimo 
                                 # en caso que el usuario no conozca el nombre del funcionario
                                 textInput("text", label = h4("Nombre del funcionario encargado"), 
                                           value = "Enter text..."),
                                 
                                 textInput("text", label = h4("Apellidos del funcionario encargado"), 
                                           value = "Enter text..."),
                                 
                                 textInput("text", label = h4("Cargo del Funcionario"), 
                                           value = "Enter text...")
                                 
)

formulario_dataset <- column(12, h3("Informacion sobre la institucion que administra el dataset"),
                             
                             # agregar opcion para permitir remitir el template a un funcionario anonimo 
                             # en caso que el usuario no conozca el nombre del funcionario
                             textInput("text", label = h4("Descripcion del Dataset/datos/informacion a la que desea acceder"), 
                                       value = "Enter text..."),
                             
                             textInput("text", label = h4("Especifique que campos en particular del dataset le son indispensables "), 
                                       value = "Enter text..."),
                             
                             textInput("text", label = h4("Especifique el rango preferible de tiempo del dataset que solicita"), 
                                       value = "Enter text...")
                      )

restricciones_dataset <- column(12, h3("Privacidad"),
                             
                        
                             checkboxInput("checkbox", label = h4("El dataset podria contener campos que puedan vulnerar el derecho a la privacidad de terceros"), 
                                          value = FALSE),
                             
                             textInput("text", label = h4("(en caso de si)Escriba cuales campos que podrian afectar la privacidad de 3eros no son indispensables para usted"), 
                                       value = "Enter text...")
)

clasificacion_dataset <- column(12, h3("Clasificacion"),
                                
                              
                                checkboxInput("checkbox", label = h4("El dataset contiene datos amparados como `informacion clasificada`? "), 
                                              value = FALSE),
                                checkboxInput("checkbox", label = h4("Ha pasado mas de 30anos desde su clasificacion?"), 
                                              value = FALSE)
                        )

otras_restricciones <- column(12, h3("El dataset contiene:"),
                   
                              checkboxInput("checkbox", label = h4("datos acerca de secretos industriales ? "), 
                                            value = FALSE),
                              checkboxInput("checkbox", label = h4("datos acerca de secretos de seguridad nacional?"), 
                                            value = FALSE),
                              checkboxInput("checkbox", label = h4("datos acerca de secretos de relaciones internacionles?"), 
                                            value = FALSE),
                              checkboxInput("checkbox", label = h4("datos resultantes de investigaciones judiciales en desarrollo"), 
                                            value = FALSE)
)

# Define UI for application that draws a histogram
shinyUI(
  
  fluidPage(
    
    titlePanel("Solicitud de Datos Abiertos - Primera Solicitud "),
  
  # INIT SELECTION
  fluidRow(
    
    fluidPage( navlistPanel(
      tabPanel("Informacion Solicitante", formulario_solicitante),
      tabPanel("Institucion", formulario_institucion),
      tabPanel("Funcionario Encargado", formulario_funcionario),
      tabPanel("Dataset", formulario_dataset),
      tabPanel("Privacidad", restricciones_dataset),
      tabPanel("Clasificacion", clasificacion_dataset),
      tabPanel("Otras restricciones", otras_restricciones)))
  )
  
))
