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
                                     
                                     textInput("solitante_nombre", label = p("Nombre"), 
                                               value = ""),
                                     
                                     textInput("solicitante_apellidos", label = p("Apellidos"), 
                                               value = ""),
                                     
                                     textInput("solicitante_tipo_identificacion", label = p("Tipo Identificacion"), 
                                               value = ""),
                                     
                                     textInput("solicitante_identificacion", label = p("Identificacion"), 
                                               value = ""),
                                     
                                     textInput("solicitante_telefono", label = p("Telefono"), 
                                               value = "Enter text..."),
                                     
                                     textInput("solicitante_email", label = p("Email"), 
                                               value = "")
                                 )

formulario_institucion <- column(12, h3("Informacion sobre la Entidad que administra el dataset"),
                                     
                                     textInput("entidad_nombre", label = p("Nombre de la Entidad"), 
                                               value = ""),
                                     
                                     textInput("entidad_ciudad", label = p("Ciudad"), 
                                               value = ""),
                                     
                                     textInput("entidad_direccion", label = p("Direccion"), 
                                               value = "")
                                 )
formulario_funcionario <- column(12, h3("Informacion sobre el funcionario al que dirige la peticion"),
                                 
                                 # agregar opcion para permitir remitir el template a un funcionario anonimo 
                                 # en caso que el usuario no conozca el nombre del funcionario
                                 textInput("funcionario_nombre", label = p("Nombre del funcionario"), 
                                           value = ""),
                                 
                                 textInput("funcionario_apellido", label = p("Apellidos del funcionario"), 
                                           value = ""),
                                 
                                 textInput("funcionario_cargo", label = p("Cargo del funcionario"), 
                                           value = "")
                                 
                          )



formulario_dataset <- column(12, h3("Informacion sobre el dataset"),
                             
                             # agregar opcion para permitir remitir el template a un funcionario anonimo 
                             # en caso que el usuario no conozca el nombre del funcionario
                             textInput("dataset_descripcion", label = p("Descripcion del dataset/informacion a la que desea acceder"), 
                                       value = ""),
                             
                             textInput("dataset_campos", label = p("Especifique que campos en particular del dataset le son indispensables "), 
                                       value = ""),
                             
                             dateRangeInput('dataset_fecha',
                                            label = p("Especifique el rango preferible de tiempo del dataset que solicita"),
                                            start = Sys.Date() - 2, end = Sys.Date() + 2
                             )
                             
                      )

restricciones_dataset <- column(12, h3("Privacidad"),
                             
                        
                             checkboxInput("privacidad_violacion_flag", label = p("El dataset podria contener campos que puedan vulnerar el derecho a la privacidad de terceros"), 
                                          value = FALSE),
                             
                             textInput("campos_violan_privacidad", label = p("(en caso de si)Escriba cuales campos que podrian afectar la privacidad de 3eros no son indispensables para usted"), 
                                       value = "")
)

clasificacion_dataset <- column(12, h3("Clasificacion"),
                                
                              
                                checkboxInput("clasificacion_flag", label = p("El dataset contiene datos amparados como `informacion clasificada`? "), 
                                              value = FALSE),
                                checkboxInput("clasificacion_expiracion_flag", label = p("Ha pasado mas de 30anos desde su clasificacion?"), 
                                              value = FALSE)
                        )

otras_restricciones <- column(12, h3("El dataset contiene:"),
                   
                              checkboxInput("restriccion_secreto_industrial_flag", label = p("datos acerca de secretos industriales ? "), 
                                            value = FALSE),
                              checkboxInput("restriccion_seguridad_nacional_flag", label = p("datos acerca de secretos de seguridad nacional?"), 
                                            value = FALSE),
                              checkboxInput("restriccion_relaciones_internacionales_flag", label = p("datos acerca de secretos de relaciones internacionles?"), 
                                            value = FALSE),
                              checkboxInput("restriccion_investigacion_judicial", label = p("datos resultantes de investigaciones judiciales en desarrollo"), 
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
      tabPanel("Otras restricciones", otras_restricciones),
      tabPanel(submitButton("Generar Solicitud")))
  ))
  
))




