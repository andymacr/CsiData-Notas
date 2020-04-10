
rm(list=ls)

setwd("C:/Users/andre/Desktop/CsiData/Inferencia-Estadistica-master/Enpecyt_2017-master")
dir() # es para ver lo que hay en la carpeta 

#install.packages("foreing")
#install.packages("tidyverse")
library(foreign)
library(tidyverse)


cb1<- read.dbf("enpecyt2017_cb1.dbf")

head(cb1$S3P1)
table(cb1$S3P1) #resumen
sum() # para que te sume basicamente le promedio 
tapply(cb1$FAC,cb1$S3P1,sum) #las personas que teninan estudios en las ciudades con estudios 
#son 3 argumentos, el primero es lo qu quieres clafisicar, el 2 como los quieres clasificar, 3 que hacer con la clasificacion 
head(cb1$FAC) #factor de expansión de cada individuo. La suma de FAC es el total de la población. ¿Cuanta gente representa ese individuo?


nivel_estudios <- tapply(cb1$FAC, cb1$S3P1,sum) #sumas mediante clasifiaciones. La suma de FAC clasificados por nivel de estudios


names(nivel_estudios) <- c("Grado", "Absoluto") #cambiar el nombre a las columnas

niveles_estudios <- c("Ninguno","Preescolar", "Primaria", "Secundaria", "Preparatoria", "Normal", "TSU", "Licenciatura", "Especialidad", "Maestría", "Doctorado")


nivel_estudios$relativo <- nivel_estudios$Absoluto/sum(nivel_estudios$Absoluto) #crear una columna con un porcentaje


nivel_estudios <- data.frame(niveles_estudios, nivel_estudios)
view(nivel_estudios)



##SESION 02 
#GRAFICAS SEGUIMOS CON LA MISMA ENCUENTA

#toma la grafica de nivel estudios y
library(Rcmdr)
x11()
ggplot(data=nivel_estudios)+
  geom_col(mapping=aes(x= Grado, y= Absoluto, fill = Grado, alpha = 0.2 )) #alpha es para cambiar la transparencia de las graficas 

etiquetas_nivel<- paste(nivel_estudios$grado, round(100*nivel_estudios$realtivo))

#grafica de pastel 
pie(nivel_estudios$relativo)

#en esta variable tenemos todos lo grados de las personas 
#cb1$S3P1

cb1$grupo <- 0 #creando una colluman y la llenamos con puros 0
names(cb1)
head(cb1$grupo)
#s3p1 preg. ¿hasta que año parobo usted en la escuela?
cb1[cb1$S3P1 %in% c(0),]$grupo <- 0  #ver los valores de los grados que tengan un 0 
cb1[cb1$S3P1 %in% c(1,2,3),]$grupo <- 1  #ver los valores de los grados que tengan un escolar primaria y sec y dales valro de 1
cb1[cb1$S3P1 %in% c(4),]$grupo <- 2  
cb1[cb1$S3P1 %in% c(5,6,7),]$grupo <- 3  
cb1[cb1$S3P1 %in% c(8,9,10),]$grupo <- 4 
#le pones el $ despues grupo para renombrar o rellenar la variable 
head(cb1$grupo)




grupo_estudios <- tapply(cb1$FAC, cb1$grupo,sum)

grupos_estudios <- c("Ninguno","Básico", "Medio superior", "Superior", "Posgrado")

grupo_estudios <- data.frame(grupos_estudios, grupo_estudios)

names(grupo_estudios)<- c("grado", "absoluto")

grupo_estudios$relativo <- grupo_estudios$absoluto/sum(grupo_estudios$absoluto) #crear una columna con un porcentaje


etiquetas_grupo<- paste(grupo_estudios$grado, round(100*grupo_estudios$realtivo))

x11()
pie(grupo_estudios$relativo,etiquetas_grupo)






