library(shiny)

model = readRDS("LR1.rds")
ds = read.csv("C:/Users/nimal/eclipse-workspace/CourseProjects/syCourseProject/DS/dataset/engine_data_removed_missing_and_outliers.csv")

# Define server logic
server <- function(input, output, session) {
  perform_prediction <- function() {
    # Create a reactive expression to calculate the final answer
    final_answer <- reactive({
      prediction <- plogis(predict(model, 
                            data.frame("Engine.rpm"=(as.numeric(input$rpm) - min(ds$Engine.rpm))/(max(ds$Engine.rpm) - min(ds$Engine.rpm)), 
                                       "Lub.oil.pressure"=(as.numeric(input$lubP) - min(ds$Lub.oil.pressure))/(max(ds$Lub.oil.pressure) - min(ds$Lub.oil.pressure)), 
                                       "Fuel.pressure"=(as.numeric(input$fuelP) - min(ds$Fuel.pressure))/(max(ds$Fuel.pressure) - min(ds$Fuel.pressure)), 
                                       "Coolant.pressure"=(as.numeric(input$coolantP) - min(ds$Coolant.pressure))/(max(ds$Coolant.pressure) - min(ds$Coolant.pressure)), 
                                       "lub.oil.temp"=(as.numeric(input$lubT) - min(ds$lub.oil.temp))/(max(ds$lub.oil.temp) - min(ds$lub.oil.temp)), 
                                       "Coolant.temp"=(as.numeric(input$coolantT) - min(ds$Coolant.temp))/(max(ds$Coolant.temp) - min(ds$Coolant.temp))))) > 0.5
      output <- "here"
      if(prediction == TRUE) {output <- "Need Maintenance"}
      if(prediction == FALSE) {output <- "No Need of Maintenance"}
      paste("Final Answer : ", output)
    })
    return(final_answer())
  }
  
  # Output engine rpm
  output$output_rpm <- renderText({ paste("Engine rpm:", input$rpm) })
  # Output engine lubricant oil pressure
  output$output_lubP <- renderText({ paste("Engine lubricant oil pressure:", input$lubP) })
  # Output engine's fuel pressure
  output$output_fuelP <- renderText({ paste("Engine's fuel pressure:", input$fuelP) })
  # Output engine's coolant pressure
  output$output_coolantP <- renderText({ paste("Engine's coolant pressure:", input$coolantP) })
  # Output engine's lubricant oil temperature
  output$output_lubT <- renderText({ paste("Engine's lubricant oil temperature:", input$lubT) })
  # Output engine's coolant temperature
  output$output_coolantT <- renderText({ paste("Engine's coolant temperature:", input$coolantT) })
  
  observeEvent(input$predict_button, {
    output$final_answer <- renderText({
      perform_prediction()
    })
  })
}
