setwd('D:\\Rcourse\\Lesson1')
sessionInfo()

rm(list = ls())
list

getwd()

datdir <- file.path("D","Rcourse","Lesson1")
? file.path
datdir "lesson1.R"


add <- function(x = 5){x + 1}
add(8)

add <- function(x = 5) { z <- x + 1 ;
return(c("z is",z,x))}
add(3)

newfunc <- function(x, y){
  z <- 2*x+y
  return(c(z,x,y))
}
a2b <- newfunc(2,4)
a2b
rm(newfunc, a2b)

help.start(remove)
??????delete 


# =========================================================================================== 
# start updating the codes 

download.file("http://rasta.r-forge.r-project.org/rasta_0.7.zip", 
              file.path("rasta_0.7.zip"))

## check if all R package are up to date
update.packages(checkBuilt = TRUE, ask = FALSE)
## check if all R package required for this course are there
install.packages("raster", dependencies = TRUE)
## install the rasta package
install.packages(file.path("rasta_0.7.zip"), repos = NULL)
install.packages("reshape", dependencies=TRUE)
install.packages("bitops", dependencies=TRUE)
install.packages("ggplot2", dependencies=TRUE)
install.packages("spdep", dependencies=TRUE)
install.packages("ggmap", dependencies=TRUE)
install.packages("randomForest", dependencies=TRUE)

print(library(rasta)) ## load the rasta library
?mysummary
mysummary

# =============================================================== 
# 

adm <- raster::getData("GADM", country = "",level = 0)
plot(adm)

 # ============================================

getData('GADM', country='FRA', level=1)
getData("ISO3")
# ==================================================================
# start excercise lesson 1

 
create_map <- function(countrycode, levelnr=0){
  adm <- raster::getData("GADM", country = countrycode,level = levelnr)
  plot(adm, bg = "dodgerblue", axes=T)
  plot(adm, lwd = 10, border = "skyblue", add=T)
  plot(adm, col = "green4", add = T)
  grid()
  box()
  invisible(text(getSpPPolygonsLabptSlots(adm),
                 labels = as.character(ctry$NAME_2), cex = 1.1, col = "white", font = 2))
  mtext(side = 3, line = 1, "Map of country" , cex = 2)
  mtext(side = 1, "Longitude", line = 2.5, cex=1.1)
  mtext(side = 2, "Latitude", line = 2.5, cex=1.1)
  text(122.08, 13.22, "Projection: Geographic\n")
}

create_map("Belgium",1)

adm <- raster::getData("GADM", country = "PHL",level = 2)


mar <- adm[adm$NAME_1 == "Marinduque"]
plot(mar, bg = "dodgerblue", axes=T)
plot(mar, lwd = 10, border = "skyblue", add=T)
plot(mar, col = "green4", add = T)
grid()
box()
invisible(text(getSpPPolygonsLabptSlots(mar),
                 labels = as.character(mar$NAME_2), cex = 1.1, col = "white", font = 2))
mtext(side = 3, line = 1, "Provincial Map of Marinduque", cex = 2)
mtext(side = 1, "Longitude", line = 2.5, cex=1.1)
mtext(side = 2, "Latitude", line = 2.5, cex=1.1)
text(122.08, 13.22, "Projection: Geographic\n



