#Section 4

#-------------R ile GRAFİK ÇİZME------------#

#Örneğin standart normal dağılımının olasılık dağılım fonksiyonunun 
#değerini (-4,4) aralığındaki grafiğini çizelim.
x <- seq(-4,4,length.out=51) # yeteri kadar uzun değil
y <- dnorm(x)
plot(x,y) # boş noktalar içeren bir grafik (şekil 1)
windows() #şekli yeni bir pencerede göstermek isterseniz bu komutu kullanabilirsiniz
plot(x,y,type="l") # noktalar  birleştirir "l" line anlamına geliyor (şekil 2)

x <- seq(-4,4,length.out=10001) # yeteri kadar uzun (yoğun)
y <- dnorm(x)
windows ( )
plot(x,y,type="l") # daha çok noktayı birleştirir (Şekil 3)


#Şimdi bir dizi içindeki de§erlerin histogram  hist() fonksiyonunu kullanarak çizelim
#hist() fonksiyonunun break argümanını değiştirerek daha iyi (break değerine göre kötü) 
#görünen histogramlar elde edilebilir.
x <- rnorm(1000000 ,3 ,1.5)
# ortalaması 3 and std. sapması 1.5 olan 
#Normal dağılımdan yaratılmış bir 1000000 sayılık bir dizi

hist(x) 
windows ( )
hist (x , breaks =50)

hist (x ,breaks =100)
y <- seq(-5,10,length.out=100001)
lines (y,dnorm(y,3 ,1.5)*200000)

y <- seq(-5,10,length.out=101) 
windows ( )
plot (y ,dnorm (y ,3,1.5 ) )
lines (y ,dnorm (y ,3 ,1.5 ) )

windows ( )
plot(y,dnorm(y,3 ,1.5) ,type="l")
abline(v=4.5) # x=4.5 noktasından geçen dikey (vertical) bir doğru ekleyelim
#points() ve abline() gibi fonksiyonlar kullanarak grafiklere ek bilgiler koyulabilir.

abline(v=1.5) # x=1.5 noktasından geçen dikey (vertical) bir doğru ekleyelim 
abline(h=dnorm(1.5,3,1.5)) # y=dnorm(1.5,3,1.5) noktasından geçen yatay (horizontal) bir doğru ekleyelim 
abline(a=0.10,b=0.01) # 0.01 and x=0.10 noktasından geçen bir doğru ekleyelim

