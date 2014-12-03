list_hcp <- read.csv("C:/Users/echrist/Google Drive/Coursera/04-ExplorityDataAnalysis/Assignment1/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE,na.strings = c("?"))
df_hcp<-as.data.frame(list_hcp)
rm(list_hcp)

library(lubridate)
df_hcp$DateTime<-dmy_hms(paste(df_hcp$Date,df_hcp$Time))
#df_hcp$wday<-wday(df_hcp$DateTime,label=TRUE,abbr=TRUE)
df_hcp_data<-df_hcp[df_hcp$DateTime>= ymd_hms("2007-02-01 00:00:00") & df_hcp$DateTime< ymd_hms("2007-02-03 00:00:00"),]
rm(df_hcp)

png("plot2.png", width=480, height=480)
plot(df_hcp_data$DateTime,df_hcp_data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
