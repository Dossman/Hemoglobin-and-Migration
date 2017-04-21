####################################################################################################
##
## Birds Elevate Hemoglobin prior to Spring Migration
##
####################################################################################################
## Libraries
library(tidyverse)

## Read in data
blood <- read.csv("./data/blood.csv", sep="\t")

## format dataset

blood$date <- as.POSIXct(blood$date, "%d-%b-%y", tz="EST")
blood$doy  <- as.numeric(format(blood$date, "%j"))
blood$woy  <- as.numeric(format(blood$date, "%W"))
blood$moy  <- as.numeric(format(blood$date, "%m"))

## Plotting raw timeseries data

ggplot(data =blood, aes(x = factor(moy), y=rbc/whole, color=species)) +
  geom_boxplot()


