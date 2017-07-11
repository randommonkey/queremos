# library(shiny)
# library(shinysteps)
# library(shinyjs)
# library(tidyverse)
# library(bsplus)
# 
# styles <- "
# #headsty{
# max-width: 100%;
# margin-top: 2%;
# margin-left: 10%;
# margin-right: 10%;
# }
# .app-button{
# display:inline-block;
# }
# .row{
# text-align:left;
# margin-left:0px;
# }
# .firmLine{     
# text-decoration:overline;
# color : black;
# }
# .firmResultat{
# color : black;
# }
# #sidebar_step2 {
# color : green;
# border: solid red;
# background-color: red;
# }
# "
# 
# stepsPage(styles = styles,
#           stepsHeader(show = FALSE, height = 150,
#                       br()
#           ),
#           stepsBody(initStep = "step1",
#                     stepPanel(id="step1",
#                               
#                               sideBarStep(title = "PASO 1"#,
#                                           #p("Datos personales")
#                               ),
#                               
#                               mainStep(
#                                 h4("Información sobre el solicitante"),
#                                 #br(),
#                                 #textInput("sol_nombre", label = "Nombre", value = ""),
#                                 uiOutput("info_gen")
#                                 
#                               )
#                     ),
#                     stepPanel(id="step2",
#                               sideBarStep(title = "PASO DOS"
#                               ),
#                               mainStep(
#                                 h4("Datos sobre la entidad y/o funcionario al que se solicita la información"),
#                                 uiOutput("info_inst")
#                               )
#                     ),
#                     stepPanel(id="step3",
#                               sideBarStep(title = "PASO TRES"
#                               ),
#                               mainStep(
#                                 h4("Datos sobre la información requerida"),
#                                 uiOutput("info_data"),
#                                 actionButton("show", "Vista previa")
#                               )
#                     )
#           )
# )
# 
# 
# 
# 
# library(shiny)
# library(shinyjs)
# library(tidyverse)
# library(shinysteps)
# library(bsplus)
# library(pystr)
# 
# server <- function(input,output,session){
#   
#   
#   output$info_gen <- renderUI({
#     info <- list(
#       textInput("sol_nombre", label = "Nombre", value = ""),
#       textInput("sol_apellidos", label = "Apellidos",value = ""),
#       textInput("sol_cargo", label = "Cargo",value = ""),
#       #fluidRow(
#       div(class = "row",
#           div(class = "app-button",
#               selectizeInput("sol_tipo_id", label = "Doc.", 
#                              c("T.I", "C.C", "C.E", "NIT."), width = "62px")
#           ),
#           div(class = "app-button",
#               textInput("sol_idNum", label = "N. de identidad", 
#                         value = "", width = "234px")
#           )),
#       
#       textInput("sol_direccion", label = "Dirección"),
#       # textInput("sol_tel", label = "Telefono"),
#       textInput("sol_email", label = "Email")
#     )
#     info
#     
#   }) 
#   
#   
#   output$info_inst <- renderUI({
#     info <- list(
#       
#       textInput("ent_ciudad", label = "Ciudad"),
#       textInput("ent_nombre", label = "Nombre de la Entidad")
#       
#     )
#     
#     info                                                                
#   })
#   
#   
#   output$info_data <- renderUI({
#     info <- list(
#       textInput('data_ciudad', 'Ciudad de la cual realiza la consulta'),
#       
#       textInput('data_int', 'Descripción de la información que desea obtener'),
#       
#       checkboxInput('info_reserva', 'La información solicitada es clasificada o de reserva')
#     )
#     info
#   })
#   
#   
#   
#   output$val_num <- renderText({ input$sol_idNum})
#   output$val_tel <- renderText({ input$sol_tel})
#   output$val_eml <- renderText({ input$sol_email})
#   
#   
#   output$nombre <- renderText({
#     paste(input$sol_nombre, input$sol_apellidos)
#   })
#   
#   output$entidad <- renderText({
#     input$ent_nombre
#   })
#   
#   template <- reactive({
#     
#     templ <- list(
#       fluidRow(
#         div(id = "headsty",
#             HTML(
#               paste0(input$data_ciudad, ", ", 'fecha', '</br></br>',
#                      textOutput('nombre'), input$sol_cargo, textOutput('entidad'), input$ent_ciudad,
#                      '</br></br>', 'Referencia: Solicitud de información </br> Respetado señor/a: </br></br> 
#                      <p style="text-align: justify;"> En ejercicio del derecho fundamental de petición, consagrado en el artículo 23 de la 
#                      Constitución Nacional, y del derecho de acceso a la información pública, consagrado en los artículos 20 y 74 de la misma, desarrollado por 
#                      la ley 1712 de 2014; de manera respetuosa le solicito la siguiente información:</p></br>',
#                      '<p style="text-align: justify;">',input$data_int, '</p>',
#                      '<p style="text-align: justify;"> La respuesta a la presente solicitud la recibiré en la ', input$sol_direccion,'o en mi correo electrónico', 
#                      input$sol_email, '.</p>', '<p> Cordialmente, </p> </br>','
#                      <div class="firmLine">', paste(input$sol_nombre, input$sol_apellidos), '
#                      </div>
#                      <p>', paste0(input$sol_tipo_id, " ",input$sol_idNum) ,'</p>
#                      '
#                      
#               )
#             ),
#             div(align = 'center',
#                 downloadButton('descarga_pet', 'Descargar PDF')  
#                 
#             )
#             )
#             )
#       )
#     
#     templ
#     
#     
#   })
#   
#   
#   
#   observeEvent(input$show, {
#     showModal(modalDialog(
#       title = "",
#       template(),
#       easyClose = TRUE,
#       footer = NULL
#     ))
#   })
#   
#   
#   output$descarga_pet <- 
#     downloadHandler(
#       "peticion.pdf",
#       content = 
#         function(file)
#         {
#           params <- list(
#             ciudad = input$data_ciudad,
#             fecha = '16 de septiembre 2341',
#             nombres = paste(input$sol_nombre, input$sol_apellidos),
#             cargo = input$sol_cargo,
#             entidad = input$ent_nombre,
#             ciudadDat = input$ent_ciudad,
#             info = input$data_int,
#             direc = input$sol_direccion,
#             correo = input$sol_email,
#             documento = paste0(input$sol_tipo_id, " ",input$sol_idNum))
#           rmarkdown::render("temp_latex/untitle.Rmd",
#                             #output_format = pdf_document(template="default.tex"),
#                             params = params,
#                             output_file = "peticion_gen.pdf")
#           
#           readBin(con = "temp_latex/peticion_gen.pdf", 
#                   what = "raw",
#                   n = file.info("temp_latex/peticion_gen.pdf")[, "size"]) %>%
#             writeBin(con = file)
#         },
#       contentType = 'temp_latex/peticion_gen.pdf'
#     )
#   
#   
#   
#   
#   
# }