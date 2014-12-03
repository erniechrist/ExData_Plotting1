list_hcp <- read.csv("C:/Users/echrist/Google Drive/Coursera/04-ExplorityDataAnalysis/Assignment1/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE,na.strings = c("?"))
df_hcp<-as.data.frame(list_hcp)
rm(list_hcp)

library(lubridate)
df_hcp$DateTime<-dmy_hms(paste(df_hcp$Date,df_hcp$Time))
df_hcp_data<-df_hcp[df_hcp$DateTime>= ymd_hms("2007-02-01 00:00:00") & df_hcp$DateTime< ymd_hms("2007-02-03 00:00:00"),]
rm(df_hcp)

png("plot3.png", width=480, height=480)

plot(df_hcp_data$DateTime,df_hcp_data$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
points(df_hcp_data$DateTime,df_hcp_data$Sub_metering_1 ,type="l")
points(df_hcp_data$DateTime,df_hcp_data$Sub_metering_2 ,type="l", col="red")
points(df_hcp_data$DateTime,df_hcp_data$Sub_metering_3 ,type="l", col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd="1")


dev.off()
