library("XML")
library("methods")

#download.file("http://ratings.fide.com/download/players_list_xml.zip","players.zip")
#unzip("players.zip")

#players <- xmlToDataFrame("players.xml")
#write.table(players,"players.txt")

players<-read.table("players.txt")
filt<-players[players$rating>2500,]
write.table(filt,"players.txt")