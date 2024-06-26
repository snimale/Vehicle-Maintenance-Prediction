#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#


# ui.R

library(shiny)

# Define UI for application
ui <- fluidPage(
  # Application title
  titlePanel("Predictive Maintenance Using Automotive Engine Health Dataset"),
  
  # Sidebar with text inputs for engine details
  sidebarLayout(
    sidebarPanel(
      h4("Enter the details about your Engine"),
      textInput("rpm", "Engine rpm", ""),
      textInput("lubP", "Engine lubricant oil pressure", ""),
      textInput("fuelP", "Engine's fuel pressure", ""),
      textInput("coolantP", "Engine's coolant pressure", ""),
      textInput("lubT", "Engine's lubricant oil temperature", ""),
      textInput("coolantT", "Engine's coolant temperature", ""),
      actionButton("predict_button", "Predict")
    ),
    
    # Show engine details in the main panel
    mainPanel(
      h4("Engine Details"),
      # Display engine details
      textOutput("output_rpm"),
      textOutput("output_lubP"),
      textOutput("output_fuelP"),
      textOutput("output_coolantP"),
      textOutput("output_lubT"),
      textOutput("output_coolantT"),
      textOutput("final_answer")
    )
  )
)
