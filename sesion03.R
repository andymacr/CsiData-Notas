#Variables aleatorias binomial y normal 

#para probalidad de tener exctamente 3 exitos 
#densidad 
dbinom(3,10,0.4)

#para probabilida de tener asta 3 exitos 
#densidad acumulada
pbinom(3,10,0.4)

#EJEMPLO1
#la prob de que se funda la lamapara en un mes = 0.2. S el televisor tiene 5 años 
#pbinom es la prbabildidad de que el numero de exitos  sea menor o gial que 
#dbinom es la probabildiad de que el numero de exitos  sea igual 


#cuantas veces fallo el televisor a lo largo de 5 años?
#nos mide el total de exitos (descompuso) 
#tenemos que dar por hecho independencia entre los meses

#a)

#bin (n,p)
#x= nuermo de veces qe falló durante 5 meses 
n=60 #12x5
p=0.02
# bin (60,0.02)


#b)
#la esperza es np
E= n*p
E
# se espera que durante los 5 años la tv tuvo al menos un desperfecto
#la varinaza es npq = 1.76
#el promedio la tv o no tuvo ningun fallo o tuvo dos 
#sd=1.08


#c)calcular la probabilidad dee que nunca se haya roto 
p1=0

dbinom(0,60,0.02)
#la probabildiad de que el tv no haya fallado en 5 años es de .2975
#de cada 100 vendidos, 30 sufrieron un desperecto 

#d) calcular la probabilidad de haber tenido x=5 , 5 fallos 
p2=5
dbinom(5,60,0.02)

#e) probabildidad de que almenos haya 5 rupturas
#p= 5, 6,...,n , es la probabildiad de que x sea mayor o igaul que 5
#recordemos que A y B son eventos complementarios, se cunple p(B)=1-p(A)
#P(X>_ 5) = 1 - P(A_<5)
1-pbinom(4,60,0.02)


#f) obetenre la probabilidad de que haya entre 5 y 25 roturas (ambos inclusive)
#se debe incluir al 5 y al 25
#el numero de fallos sea mayor o igual que 5 pero menor o igual que 25
#recordemos que la P (a_<X_<b)= P(X_<b) -P(X<a)
#p(x_<25)-p(X<5)=p(x_<25)-p(x_<4) = 0.007

pbinom(25,60,0.02)-pbinom(4,60,0.02)

#**NOTA** los signos deben e utilizarce con cuuidado por las vairbels discretas 

#g) calcular el valor de la vairble tal que deja a su derecha el 32%de las obs.
#es decir pdide el numero de errores que vana  tener el 68% de los tv.

qbinom (0.32,60,0.02,lower.tail=FALSE)


##EJEMPLO 2:
#test=8 preguntas y c/u tiene 4 opciones y 1 es correcta 
#para aporbar enecesitamos contestar 6 de ellas
#¿cual es la probabilidad de aprobar?
#ESTO SIGUE UNA DISTRIBUCION BINOMIAL (o la repsondo bien o la respondo mal)
#sea X (la vairbale aleatoria)"numero de respueats correctas"

n=8
p=0.25 #1/4

Bin (8,0.25)

#aprobar sign ifica P(X_>6)=1-P(X<6)=1-P(X_<5)
#la probailidad de aprobar es 0.0042
1-pbinom(5,8,0.25)


#la probabilidad de fallar todas es P(X=0)
dbinom(0,8,0.25)


#espero tener bien 2 preguntas 
e2=8*0.25
e2














