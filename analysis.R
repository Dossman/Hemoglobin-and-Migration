####################################################################################################
##
## Birds Elevate Hemoglobin prior to Spring Migration
##
####################################################################################################
## Libraries
library(ggplot2)

## Read in data
blood <- read.csv("./data/blood.csv")

## format dataset

blood$date <- as.POSIXct(blood$date, "%d-%b-%y", tz="EST")
blood$doy  <- as.numeric(format(blood$date, "%j"))
blood$woy  <- as.numeric(format(blood$date, "%W"))
blood$moy  <- as.numeric(format(blood$date, "%m"))

## correct data structure
blood$rbc <- as.numeric(as.character(blood$rbc))
blood$whole <- as.numeric(as.character(blood$whole))

## Creating MCHC
blood$HCT <-  blood$rbc/blood$whole
blood$MCHC <- blood$hb /blood$HCT

## Plotting raw timeseries data

ggplot(data = subset(blood, species=="AMRE" & doy >= 70), aes(x = doy, y=rbc/whole)) +
  geom_point() + stat_smooth(method="lm") + 
  theme_classic(base_size=20) + 
  ylab("Hematocrit") 




