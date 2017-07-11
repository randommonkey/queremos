library(shiny)
library(shinyjs)
library(tidyverse)
library(bsplus)

shinyServer(function(input, output, session){
  
  output$nombre <- renderText({
    paste(input$sol_nombre, input$sol_apellidos)
  })
  
  output$entidad <- renderText({
    input$ent_nombre
  })
  
  tipDoc <- reactive({
    td <- input$sol_tipo_id
    ifelse(td == "Tarjeta de identidad", "T.I",
           ifelse(td == "Cedula de ciudadania", "C.C", "C.E"))
  })
  
  
  fecha <- reactive({
    a <- separate(data.frame(fecha = Sys.Date()), fecha, c("Año", "Mes", "Día"))
    a$mes_d <- ifelse(a$Mes == "01", "Enero",
                      ifelse(a$Mes == "02", "Febrero",
                             ifelse(a$Mes == "03", "Marzo", 
                                    ifelse(a$Mes == "04", "Abril",
                                           ifelse(a$Mes == "05", "Mayo",
                                                  ifelse(a$Mes == "06", "Junio",
                                                         ifelse(a$Mes == "07", "Julio",
                                                                ifelse(a$Mes == "08", "Agosto",
                                                                       ifelse(a$Mes == "09", "Septiembre",
                                                                              ifelse(a$Mes == "10", "Octubre",
                                                                                     ifelse(a$Mes == "11", "Noviembre", "Diciembre")))))))))))
    a$fecha <- paste0(a$Día, " de ", a$mes_d, " del ", a$Año)
    a$fecha
  })
  
  template <- reactive({
    
    templ <- list(
      fluidRow(
        div(id = "headsty",
            HTML(
              paste0(input$data_ciudad, ", ", fecha(), '</br></br>',
                     textOutput('nombre'), input$sol_cargo, textOutput('entidad'), input$ent_ciudad,
                     '</br></br>', 'Referencia: Solicitud de información </br> Respetado señor/a: </br></br> 
                     <p style="text-align: justify;"> En ejercicio del derecho fundamental de petición, consagrado en el artículo 23 de la 
                     Constitución Nacional, y del derecho de acceso a la información pública, consagrado en los artículos 20 y 74 de la misma, desarrollado por 
                     la ley 1712 de 2014; de manera respetuosa le solicito la siguiente información:</p></br>',
                     '<p style="text-align: justify;">',input$data_int, '</p>',
                     '<p style="text-align: justify;"> La respuesta a la presente solicitud la recibiré en la ', input$sol_direccion,'o en mi correo electrónico', 
                     input$sol_email, '.</p>', '<p> Cordialmente, </p> </br>','
                     <div class="firmLine">', paste(input$sol_nombre, input$sol_apellidos), '
                     </div>
                     <p>', paste0(tipDoc(), " ",input$sol_idNum) ,'</p>
                     '
                     
              )
            ),
            div(align = 'center',
                downloadButton('descarga_pet', 'Descargar PDF')  
                
            )
            )
            )
      )
    
    templ
    
    
  })
  
  
  
  observeEvent(input$show, {
    showModal(modalDialog(
      title = "",
      template(),
      easyClose = TRUE,
      footer = NULL
    ))
  })
  
  
  output$descarga_pet <- 
    downloadHandler(
      "peticion.pdf",
      content = 
        function(file)
        {
          params <- list(
            ciudad = input$data_ciudad,
            fecha = fecha(),
            nombres = paste(input$sol_nombre, input$sol_apellidos),
            cargo = input$sol_cargo,
            entidad = input$ent_nombre,
            ciudadDat = input$ent_ciudad,
            info = input$data_int,
            direc = input$sol_direccion,
            correo = input$sol_email,
            documento = paste0(tipDoc(), " ",input$sol_idNum))
          rmarkdown::render("temp_latex/untitle.Rmd",
                            #output_format = pdf_document(template="default.tex"),
                            params = params,
                            output_file = "peticion_gen.pdf")
          
          readBin(con = "temp_latex/peticion_gen.pdf", 
                  what = "raw",
                  n = file.info("temp_latex/peticion_gen.pdf")[, "size"]) %>%
            writeBin(con = file)
        },
      contentType = 'temp_latex/peticion_gen.pdf'
    )
  
  
  

  
  observeEvent(input$nextOne, {
    updateTabsetPanel(session, "Info", "Información de la entidad")
  })

  
  observeEvent(input$nextTwo, {
    updateTabsetPanel(session, "Info", "Información Personal")
  })

  
  observeEvent(input$nextThree, {
    updateTabsetPanel(session, "Info", "Información de los datos")
  })
  
  observeEvent(input$nextFour, {
    updateTabsetPanel(session, "Info", "Información de la entidad")
  })
  
  
})