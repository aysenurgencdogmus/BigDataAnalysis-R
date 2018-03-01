#Section2
#----------2.1 Olasılık Fonksiyonları------------#

#dnorm(x,y,z): Ortalamas  y and standart sapması z olan 
#bir normal dağılımın x sayısındaki olasılık dağılım fonksiyon değerini döner.

dnorm(0.5) # ortalama ve standart sapma parametreleri tanımlanmazsa 
            #R standart normal dağılım kullan r
dnorm(0 ,2 ,1)
dnorm(3 ,3 ,5)

#pnorm(x,y,z): Ortalaması  y and standart sapması  z olan 
#bir normal dağılımın x sayısındaki kümülatif dağılım fonksiyon değerini döner.

pnorm(0) # eğrinin altında kalan alan
          #standart normal dağılımda "0" solundaki kalan alan
pnorm(2)
pnorm(5 ,3 ,1)

#qnorm(x,y,z): Ortalaması y and standart sapması z olan bir normal dağılımın x olasılığındaki 
#kümülatif dağılım fonksiyon değerinin tersini 
#(quantile) döner. x bir olasılık olduğu için 0 ve 1 de§erleri arasında olmalıdır.
#Önceki "pnorm()" fonksiyonlarının tersi işlemi yapma (quantile)

qnorm(0.5)
qnorm(0.9772499)
qnorm(0.9772499 ,3 ,1)

#rnorm(x,y,z): Ortalaması y ve standart sapması z olan bir normal dağılımdan 
#x tane rastgele sayı üretir. Sonuç olarak x uzunluğunda bir dizi yaratır.

rnorm(20,2,1) # ortalaması 2 standart sapması 1 olan normal dağılımdan 
                            #20 tane rastgele sayı üretir

#---------------2.2 İstatistiksel Fonksiyonlar-----------#
x <- rnorm(1000000,5,2) # x ortalamas  5, standart sapmas  2 olan normal dağılımdan
                              # gelen 1000000 rastgele sayıdan oluşan bir dizidir .
mean(x) #ortalama
sd(x) #standart sapma
var(x) #varyans
median(x) #medyan
summary ( x ) #özet bilgi
summary(x, digits=6)
quantile(x) # bu fonksiyon çeyreklik dilimler hakkında da bilgi verir

# çeyreklik dilimleri a3a§ daki gibi de elde edebiliriz .
sort(x)[1000000*0.25]
sort(x)[1000000*0.5]
sort(x)[1000000*0.75]
