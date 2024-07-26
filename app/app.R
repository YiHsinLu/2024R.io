library(shiny)


ui <- fluidPage(
  titlePanel("Authors Ranking"),
  sidebarLayout(
    sidebarPanel(
      fileInput("file", "Select a file"),

      # you cannot call data() in your ui.
      # You would have to wrap this in renderUI inside of your server and use
      # uiOutput here in the ui
      sliderInput("period", "Time period observed:", min = 1, max = 10, value = 5)
    ),
    mainPanel(
      DT::dataTableOutput("table")
    )
  )
)

# Define the server logic
server <- function(input, output) {

  input_file <- reactive({
    if (is.null(input$file)) {
      return("")
    }

    # actually read the file
    read.csv(file = input$file$datapath, fileEncoding = "big5")
  })

  output$table <- DT::renderDataTable({

    # render only if there is data available
    req(input_file())

    # reactives are only callable inside an reactive context like render
    data <- input_file()
    data <- subset(data, dateCreated >= input$period[1] & dateCreated <= input$period[2])

    data
  })



}

shinyApp(ui = ui, server = server)
