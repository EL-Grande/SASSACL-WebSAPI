#This modules uses the URL_Getter Function to extract data embbdded in a webpage
setwd("C:/Users/Tsaone Thapelo/Desktop/CreamaTech")
TheHarvester<- function(AWS_Name,MiDate){
  link1<-"http://www.sasscalweathernet.org/weatherstat_hourly_we.php?loggerid_crit="
  source("AWS_ID_Getter.R")#Use the URL_Getter Function to return name of the AWS
  stacion<-AWS_ID_Getter(AWS_Name)
  diario<-"&date_crit_daily="
  miURL<-paste(link1,stacion,diario,MiDate)
  myURL<-str_replace_all(string=miURL, pattern=" ", repl="")#Remove all blank spaces
  sasscal_data_xml1<-readHTMLTable(myURL)
  data_buf<-as.data.frame(head(sasscal_data_xml1[13]))#Select the quaterly data values
  
  #Clean the hourly data: get rid of the first row, and shift the first three elements
  Tope<-((data_buf[2:4,])[-1])
  Buttock<-data_buf[5:99,1:17]
  #Make sure the names are the same
  names(Buttock)<-names(Tope)
  #Row bind the data
  MyData<-rbind(Tope,Buttock,row.names = TRUE)
  #Nombres<-
  names(MyData)<-c("Time","AirTemp.","SurfaceTemp.","Rain","WindSpeed","WindDirect.","WindSpeed(max)","WindSpeed(min)","Humidity","Barom.Press.","Solar radiation","SolarradiationEnergy","LeafWetness","DewPoint","WetBulb","Sun Hours","BatteryVoltage")
  
  #Clean the data, 
  MyData<-(MyData[3:nrow(MyData),1:17])
  MyData<-MyData[1:96,]
  #Call the Quarterly_Intervals Function to return a vector of daily 15 minutes intervals
  #source("Quarterly_Intervels.R")
 # MyData$Hour<-miFecha()
  #hora<-miFecha
  #View(hora)
  #MyData$Time<-hora
   return(MyData)
  
}

MyData<-TheHarvester("Pandamatenga","2016-04-03")
#View(MyData)

##
# Try and plot the values
#summary(dataframe)
#str(MyData)
#kable(head(MyData), digits = 1)
#MyData$Time<-hms(MyData$Time)
#trim <- function (x) gsub("^\\s+|\\s+$", " ", x)
#print(UV)
#myURL = trim(miURL)
#library(stringr)
#SS<-gsub("[[:blank:]]", "", miURL)
#AWS_ID_Getter<-hash[[AWS]]# show value for a given single AWS
#Link<-"http://www.sasscalweathernet.org/weatherstat_hourly_we.php?loggerid_crit="
#Link<-"http://www.sasscalweathernet.org/weatherstat_hourly_we.php?loggerid_crit="
#Station_ID<-hash[[AWS_ID_Getter]];Station_ID
#URL3<- paste(Link,AWS_ID_Getter,MiDate,sep="")
#URL3<-"http://www.sasscalweathernet.org/weatherstat_hourly_we.php?loggerid_crit=68030"
#URL3 <- "http://www.sasscalweathernet.org/weatherstat_hourly_we.php?loggerid_crit=68026&date_crit_daily=2021-03-12"
#http://www.sasscalweathernet.org/weatherstat_daily_we.php?loggerid_crit=68030
#http://www.sasscalweathernet.org/weatherstat_hourly_we.php?loggerid_crit=67585


