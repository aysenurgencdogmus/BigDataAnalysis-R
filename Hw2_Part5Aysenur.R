#Section 5

#---------5. Temel Kullanıcı Bilgileri-----------#
#----------5.1 Veri Okuma ve Yazma---------------#

#Örneğin elimizde aşağıdaki biçimde metin dosyasına yazılmış bir veri olsun.
# 3 25 94.9 12 547 32556 56 89 567
# 435 342.1 76.5 983.2
# 0 343

x<- scan()# enter tuşuna bastıktan sonra , komut satırında "1:" görünür
        # CTRL+V yazarak kopyalanmış veriyi yapıştırabiliriz , 15 sayı x isimli dizide tutulur
# sonrasında komut satırında "16:" görünür
# enter tuşuna basarak veri girişi sonlandırılır ve 15 sayı okunmuş olur

#tablo değerlerini metin dosyasından da okuyabiliriz
# x doyası boy,kilo ve yaş verilerini içeren bir text dosyasıdır
x <- read.table(file="data.txt",header=TRUE)

x$boy
x$kilo
x$yas

calisma <- getwd() # şu anki çalışma klasörünü calisma değişkenine eşitler
print ( calisma )

setwd("C:/") # çal 3ma klasörünü C klasörü yap
getwd() # ekranda çalışma klasörünü bas
setwd("C:\\Programlar") # çalışma klasörünü C altında Programlar klasörü yap 
getwd()  # ekranda çalışma klasörünü bas

print ("hata")
# [1] "hata"
x <- 1:5 
print(x)
# 1 2 3 4 5


#----------5.2 Oturum Yönetimi----#
#Fonksiyonlar ile ilgili detaylı  bilgilere ulaşmak için;
?det 
?sample 
?sin 
?cbind
#Ayrıca apropos(".") fonksiyon adında kullanarak belli bir kelimeyi 
#içeren fonksiyonları da listeleyebiliriz.
apropos("norm")
# "dlnorm" "dnorm"
# "pnorm" "qlnorm"
# "qqnorm. default" "rlnorm"
# "normalizePath" "plnorm" "qnorm" "qqnorm"
# "rnorm"
apropos("exp")

#Bir çalışma oturumundaki tüm objeleri görmek istediğinizde 
#objects() komutunu kullanabiliriz.
objects ()
