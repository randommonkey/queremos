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
                                     
                                     textInput("solitante_nombre", label = h4("Nombre"), 
                                               value = "Enter text..."),
                                     
                                     textInput("solicitante_apellidos", label = h4("Apellidos"), 
                                               value = "Enter text..."),
                                     
                                     textInput("solicitante_tipo_identificacion", label = h4("Tipo Identificacion"), 
                                               value = "Enter text..."),
                                     
                                     textInput("solicitante_identificacion", label = h4("Identificacion"), 
                                               value = "Enter text..."),
                                     
                                     textInput("solicitante_telefono", label = h4("Telefono"), 
                                               value = "Enter text..."),
                                     
                                     textInput("solicitante_email", label = h4("Email"), 
                                               value = "Enter text...")
                                 )

formulario_institucion <- column(12, h3("Informacion sobre la institucion que administra el dataset"),
                                     
                                     textInput("entidad_nombre", label = h4("Nombre de la Entidad"), 
                                               value = "Enter text..."),
                                     
                                     textInput("entidad_ciudad", label = h4("Ciudad"), 
                                               value = "Enter text..."),
                                     
                                     textInput("entidad_direccion", label = h4("Direccion"), 
                                               value = "Enter text...")
                                 )
formulario_funcionario <- column(12, h3("Informacion sobre la institucion que administra el dataset"),
                                 
                                 # agregar opcion para permitir remitir el template a un funcionario anonimo 
                                 # en caso que el usuario no conozca el nombre del funcionario
                                 textInput("funcionario_nombre", label = h4("Nombre del funcionario encargado"), 
                                           value = "Enter text..."),
                                 
                                 textInput("funcionario_apellido", label = h4("Apellidos del funcionario encargado"), 
                                           value = "Enter text..."),
                                 
                                 textInput("funcionario_cargo", label = h4("Cargo del Funcionario"), 
                                           value = "Enter text...")
                                 
                          )



formulario_dataset <- column(12, h3("Informacion sobre el dataset"),
                             
                             # agregar opcion para permitir remitir el template a un funcionario anonimo 
                             # en caso que el usuario no conozca el nombre del funcionario
                             textInput("dataset_descripcion", label = h4("Descripcion del Dataset/datos/informacion a la que desea acceder"), 
                                       value = "Enter text..."),
                             
                             textInput("dataset_campos", label = h4("Especifique que campos en particular del dataset le son indispensables "), 
                                       value = "Enter text..."),
                             
                             dateRangeInput('dataset_fecha',
                                            label = h4("Especifique el rango preferible de tiempo del dataset que solicita"),
                                            start = Sys.Date() - 2, end = Sys.Date() + 2
                             )
                             
                      )

restricciones_dataset <- column(12, h3("Privacidad"),
                             
                        
                             checkboxInput("privacidad_violacion_flag", label = h4("El dataset podria contener campos que puedan vulnerar el derecho a la privacidad de terceros"), 
                                          value = FALSE),
                             
                             textInput("campos_violan_privacidad", label = h4("(en caso de si)Escriba cuales campos que podrian afectar la privacidad de 3eros no son indispensables para usted"), 
                                       value = "Enter text...")
)

clasificacion_dataset <- column(12, h3("Clasificacion"),
                                
                              
                                checkboxInput("clasificacion_flag", label = h4("El dataset contiene datos amparados como `informacion clasificada`? "), 
                                              value = FALSE),
                                checkboxInput("clasificacion_expiracion_flag", label = h4("Ha pasado mas de 30anos desde su clasificacion?"), 
                                              value = FALSE)
                        )

otras_restricciones <- column(12, h3("El dataset contiene:"),
                   
                              checkboxInput("restriccion_secreto_industrial_flag", label = h4("datos acerca de secretos industriales ? "), 
                                            value = FALSE),
                              checkboxInput("restriccion_seguridad_nacional_flag", label = h4("datos acerca de secretos de seguridad nacional?"), 
                                            value = FALSE),
                              checkboxInput("restriccion_relaciones_internacionales_flag", label = h4("datos acerca de secretos de relaciones internacionles?"), 
                                            value = FALSE),
                              checkboxInput("restriccion_investigacion_judicial", label = h4("datos resultantes de investigaciones judiciales en desarrollo"), 
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
