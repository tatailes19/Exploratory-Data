library(tidyverse)
library(pastecs)
library(Hmisc)


data<-read.csv("Databases/1tcexam.csv")

data%>%head(5)

data<-data[1:5000,]
data%>%dim

data%>%select_if(is.numeric)%>%stat.desc()%>%slice(4:14)%>%slice(-c(3,4,7,8,11))

data%>%select_if(is.character)%>%unique()

num<-data%>%select_if(is.numeric)

hist.data.frame(num)

Histogramme<-function(data,grid){
    par(mfrow=grid)
    for (i in colnames(data)) {
        data %>% pull(i) %>% hist(main = i)
    }
}

Histogramme(num,c(3,3))

