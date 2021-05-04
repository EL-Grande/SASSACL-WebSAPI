library(shiny);
library(shinydashboard)
library(rsconnect)
library(XML);
library("htmltools")
library("reader") # To select some files to skip
library(ggplot2)
library(shinydashboard)
library(DBI)# For databases
library(data.table)

if (interactive()) {
  #===================== Scrape the Data from the SASSCAL Weathernet================================
  #Using the XML package to parse the HTML tables
  url1 <- "http://www.sasscalweathernet.org/weatherstat_hourly_we.php?loggerid_crit=68026&date_crit_daily=2017-06-06"
  Link<-"http://www.sasscalweathernet.org/weatherstat_hourly_we.php?loggerid_crit="
  Station<-"68026"
  Connection<-"&date_crit_daily="
  Date<-"2017-06-06"
  URL3<- paste(Link,Station,Connection,Date,sep="")
  sasscal_data_xml1<-readHTMLTable(url1)
  Nov_1_2020<-as.data.frame(head(sasscal_data_xml1[13]))

  #Clean the hourly data: get rid of the first row, and shift the first three elements

  Tope<-((Nov_1_2020[2:4,])[-1])
  Buttock<-Nov_1_2020[5:99,1:17]

  #Make sure the names are the same
  names(Buttock)<-names(Tope)
  #Row bind the data
  MyData<-rbind(Tope,Buttock,row.names = TRUE)
  Nombres<-c("Hour","AirTemp.","SurfaceTemp.","Rain","WindSpeed","WindDirect.","WindSpeed(max)","WindSpeed(min)","Humidity","Barom.Press.","Solar radiation","SolarradiationEnergy","LeafWetness","DewPoint","WetBulb","Sun Hours","BatteryVoltage")
  names(MyData)<-Nombres
  #Clean the data,
  MyData<-(MyData[3:nrow(MyData),1:17])

  Data_Output <- radioButtons("Data_Output", "Export as?",c("CSV", "XLSX"),#,"ARFF"),#,"DTA","SPE"),
                              inline = TRUE)
  Station <- selectInput("Station","Station",c("","Shakawe","Tubu","Gumare","Mahalapye","Pandamatenga"))
  MyRange<-dateRangeInput("daterange1", "Desired Date Range", start = "2015-01-01",end = "2020-10-29")
  Aplicacion <- selectInput("Application","Application",c("", "Research","Labs","Deployment","Tutorials"))
  Resolution <- selectInput("Resolution","Resolution",c("", "Quaterly","Hourly","Daily","Monthly"))
  Variable_Selector <-  varSelectInput("variables", "Select the desired variables:", MyData, multiple = TRUE)
  #================================================
  #Cabeza
  ui<-dashboardPage(
    header <- dashboardHeader(title = "SASSCAL WebSAPI"),
    #================================================
    #================================================
    #Sidebar
    sidebar <- dashboardSidebar(
      sidebarUserPanel("User Name",
                       subtitle = a(href = "#", icon("circle", class = "text-success"), "Online"),
                       # Image file should be in www/ subdir
                       image = "Swaabow.png"
      ),

      #Sidebar search
      sidebarSearchForm(label = "Enter a country", "searchText", "searchButton"),

      #Sidebar Menu
      sidebarMenu(
        # Setting id makes input$tabs give the tabName of currently-selected tab
        id = "tabs",

        menuItem("View AWSs by Country", icon = icon("bar-chart-o"),
                 menuSubItem("Angola", tabName = "subitem1"),
                 menuSubItem("Botswana", tabName = "subitem2"),
                 menuSubItem("Namibia", tabName = "subitem3"),
                 menuSubItem("South Africa", tabName = "subitem4"),
                 menuSubItem("Zimbabwe", tabName = "subitem5")
        ),


        menuItem("Data Access by Country", icon = icon("th"),
                 menuSubItem("Angola", tabName = "Ang"),
                 menuSubItem("Botswana", tabName = "BW"),
                 menuSubItem("Namibia", tabName = "Nam"),
                 menuSubItem("South Africa", tabName = "SA"),
                 menuSubItem("Zimbabwe", tabName = "Zim")
        )
      )#,

      #The date ranger function
      # MyRange<-dateRangeInput("daterange1", "Desired Date Range", start = "2015-01-01",end = "2020-10-29")
    ),
    #================================================
    #================================================
    #Body
    body <- dashboardBody(
      fluidRow(
        #Box 1
        box(
          title = "Automated Weather Station", status = "primary",
          solidHeader = TRUE, collapsible = TRUE,
          Station, height = 116

        ),

        #Box 2
        box(
          title = "Desired Temporal Resolution", status = "primary", solidHeader = TRUE, collapsible = TRUE,
          Resolution, height = 116
        ),

        #Box 3
        box(
          title = "Date Range", status = "primary", solidHeader = TRUE, collapsible = TRUE,
          MyRange, height = 116
        ),

        #Box 4
        box(
          title = "Select Application of Data", status = "primary", solidHeader = TRUE, collapsible = TRUE,
          Aplicacion, height = 116
        ),

        #Box 5
        box(
          title = "Data Output", status = "primary", solidHeader = TRUE, collapsible = TRUE,
          column(width = 4,Data_Output), height = 116
        ),

        #Box 6
        box(
          title = "Request Data?", status = "primary", solidHeader = TRUE, collapsible = TRUE,
          action_demo1 <-actionButton("submit", "Download this data"),
          action_demo2 <- actionButton("clear", "Clear Form"), height = 116
        )
      ),

      fluidRow(
        #Box 7
        box(
          column(width = 12,Variable_Selector),
          #  valueBox("ALL", "Selected Variables"),
          tableOutput("data"), width = 12
        )
      )
    )#End Dashboardy = body

  )#End GUID =u i
  #================================================
  ui = dashboardPage(header, sidebar, body)#End the client
  server = function(input, output) {

    output$data <- renderTable({
      if (length(input$variables) == 0) return(MyData)
      MyData %>% dplyr::select(!!!input$variables)
    }, rownames = TRUE)

    # Downloadable csv of selected dataset ----
    output$downloadData <- downloadHandler(
      filename = function() {
        paste(input$dataset, ".csv", sep = "")
      },
      content = function(file) {
        write.csv(datasetInput(), file, row.names = FALSE)
      }
    )

  }#End the server
  #================================================

  shinyApp( ui, server)
}

