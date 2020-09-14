library(shiny)
library(reticulate)
py_run_file("/home/sankore-onyinye/Documents/Python Scripts/Emo_Ana")

ui <- fluidPage(
  titlePanel("Emotional Analysis Sample"),
  fluidRow(
    column(10, wellPanel(
      textInput("text", "Enter your Text:", "text here"),
      submitButton("Submit")
    )),
    column(12,
           verbatimTextOutput("text"),
           verbatimTextOutput("data")
           
    )
  )
)

sent_fucnt <- function(text){
  
  data <- mainModel(text)
  return (data)
}

server <- function(input, output) {
  
  output$text <- renderText({
    paste("Input text is:", input$text)
  })
  
  output$data <- renderPrint({
    paste("This is classified as :", sent_fucnt(input$text))
  })
}

shinyApp(ui, server)