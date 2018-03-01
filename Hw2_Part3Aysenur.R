#Section3

#-------------------3.1 R'da Fonksion Tanımlamak--------------#
f <- function(p1,p2 ,....) # fonksiyon ismini ve girdilerini
  # (argüman veya parametre de denir) belirle
  
  # {girdileri (argümanlar ) ve diğer araçları kullanarak hesapları yap gerekliyse de§erleri
  # ekrana bas gerekliyse görseller oluştur
  # sonuç değişkenini son satıra yaz ve fonksiyon bu değişkeni dönsün
  #}

#ÖRNEK 1
#Yarıçapı r olan bir çemberin çevresini ve dairenin alanını hesaplayan bir fonksiyon
  cevre_alan <- function ( r )
  {
    cf <- 2*pi*r # çevreyi hesaplar , pi R'da tanımlı bir sabittir . 
    a <- pi*r^2 #alan  hesaplar
    res <- c(cf,a) # sonuçlar  birleştirir
    names(res) <- c("çevre","alan")
    res }
  cevre_alan(3)
  
#ÖRNEK 2
  #Köşe koordinatlaı iki boyutlu uzayda belirlenmiş üçgenin çevresini ve 
  #alanını hesaplayan bir fonksiyon
  
ucgen <- function(
  a, # birinci köşenin koordinatı (2 uzunluğunda bir dizi olmalı (x,y)) 
  b, # ikinci köşenin koordinatı (2 uzunluğunda bir dizi olmalı (x,y)) 
  c # üçüncü köşenin koordinatı (2 uzunluğunda bir dizi olmalı (x,y))
) {
  if(length(a)!=2 || length(b)!=2 || length(c)!=2){
    print("hata, en az bir koordinat eksik ya da hatalı girilmiş")
  }
  
  #çevre hesaplanır
  ab <- sqrt((a[1]-b[1])^2+(a[2]-b[2])^2) 
  bc <- sqrt((c[1]-b[1])^2+(c[2]-b[2])^2) 
  ac <- sqrt((a[1]-c[1])^2+(a[2]-c[2])^2)
  pm <- ab+bc+ac
  
  #alan hesaplanır
  trab <- abs((a[1]-b[1])*(a[2]-b[2]) )/2 
  trbc <- abs((c[1]-b[1])*(c[2]-b[2]) )/2 
  trac <- abs((a[1]-c[1])*(a[2]-c[2]) )/2
  
  maxxy <- pmax(a,b,c) 
  minxy <- pmin(a,b,c)
  
  sqa <- min(max((a[1]-minxy[1])*(a[2]-minxy[2]) ,0) ,max((maxxy[1]-a[1])*(maxxy[2]-a[2]) ,0))
  sqb <- min(max((b[1]-minxy[1])*(b[2]-minxy[2]) ,0) ,max((maxxy[1]-b[1])*(maxxy[2]-b[2]) ,0))
  sqc <- min(max((c[1]-minxy[1])*(c[2]-minxy[2]) ,0) ,max((maxxy[1]-c[1])*(maxxy[2]-c[2]) ,0))
  area <- (maxxy[1]-minxy[1])*(maxxy[2]-minxy[2])-trab-trbc-trac-sqa-sqb-sqc
  pm<- (area!=0)*pm # if area=0, then there is no triangle
  res <- c(pm,area)
  names(res) <- c("çevre","alan") 
  res
}
#Ucgen fonksiyonu kullanım örneği
  coora <- c(23,18)
  coorb <- c(13,34)
  coorc <- c(50,5)
  ucgen(coora,coorb,coorc)
  
  
#ÖRNEK 3
  siparisMaliyetListesi <- function(
    huc=7, # yüksek birim maliyet
    luc=6.5, # düşük birim maliyet
    ucc=40, # düşük birim maliyette
    hfc=50, # yüksek sabit maliyet
    lfc=15, # düşük sabit maliyet
    fcc=45, # yüksek birim maliyetten en çok sipariş miktarı 
    tcub=318 # toplam maliyet için en üst (sınırlayıcı) seviye
  ){
    units <- 30:50
    birimMaliyet <- huc*units*(units<ucc)+luc*units*(units>=ucc) 
    sabitMaliyet <- hfc*(units<=fcc)+lfc*(units>fcc)
    toplamMaliyet <- sabitMaliyet+birimMaliyet
    res <- toplamMaliyet[toplamMaliyet<=tcub]
    names(res) <- units[toplamMaliyet<=tcub]
    res
  }
#sipariş maliyet listesi fonksiyonu kullanım örneği
  siparisMaliyetListesi(hfc=55,luc=6.3)

#ÖRNEK 4 (if-else ifadeleri için örnek)
  f <- function (x){ if (x<(-2)){
    x^2
  }else if(x<0){ x+6
  }else if(x<4){
    -x+6 
  }
    else{ sqrt(x) }
  }
#f fonksiyonu kullanım örneği
  c(f(-4),f(-1),f(3),f(9))
  
  
  
#-------------------3.2 R'da Döngüler--------------#

#--------------------for döngüsü--------------------#
# for(i in x){ # i x dizisi içindeki değerleri sırasıyla alır 
# gerekli işlemler her i için yapılır
#}  

#yaklaşık pi'yi bulan program
  simPI <- function(n){
    y <- array(0,n)
    
    #n uzunluğunda bir sıfırlarla dolu bir dizi yaratıyoruz
    #Orijine Öklit (Euclidean) uzaklığın birden küçük ve eşit olduğu noktalar daireyi
    #temsil eder
    nDaire <- 0 # daire içine düşen notka sayısını tutar
    for ( i in 1:n){ # i will take integer values from 1 to n
      u1 <- runif(1,-1,1)
      u2 <- runif(1,-1,1)
      y[ i ] <- sqrt ((u1-0)^2 + (u2-0)^2) # orijine uzaklığı  tutuyoruz
      nDaire <- nDaire + (y[i]<1) # mantıksal operatörleri uyguladığımızda 0 ve 1 değerleri döner
    }
# simüle edilmiş karenin dairenin alanına oranı gerçek karenin alanının gerçek dairenin alanına oranı
# kareAlan=2∗2, daireAlan=pi∗(r^2) r=1 dolayısıyla tahminiDaireAlan/ tahminiKareAlan=daireAlan/KareAlan
# dolayısıyla tahminiPi=(KareAlan∗(tahminiDaireAlan/tahminiKareAlan))/r^2
    yaklasikPi=4*(nDaire/n)/1^2
    names( yaklasikPi ) <- c("tahmini")
    return(yaklasikPi) # sonuç dönmek için return() fonksiyonu da kullanılabilir.
  }
#simPI fonksiyonunu kullanım örnekleri
  simPI(1000)
  simPI(10000)
  # n yani simüle edilen nokta sayısı arttıkça gerçek pi değerine yakınsamamız beklenir
  # fakat rassal işlemler yaptığımız için bunu her zaman gözlemleyemeyebiliriz
  # bu durumlarda deneyimizi (kodumuzu) tekrarlamamız ( replicate ) ve tekrarlardan alınan
  # sonuç ortalamalarını kullanmamız daha güvenilir sonuçlar verir
  system.time(x <- simPI(100000)) # saniye cinsinden koşma süresi
  
#Aynı işlemi apply adlı bir fonksiyon ile yapan bir kod yazalım
  simPI_apply <- function (n){
    #rassal sayıları tek seferde n x 2 lik bir matriste tutalım
    rnd <- matrix(runif(2*n,-1,1) ,ncol=2) # 2∗n kadar rastgele sayı üretip bunu sütun sayısı
                                           #2 olan bir matrise dağıtır.
    y <- sqrt(apply(rnd^2,1,sum))# apply fonksiyonu kullanarak satırlar ya da sütunlar
                                 # üzerinden çeşitli fonksiyonlar çalıştırılabilir
          # apply fonksiyonu içinde önce matris değerlerinin karesini al p sonra satırlardaki
          # değerlerin (1 argümanı satır olduğunu ifade eder) toplamını alıyoruz
    nDaire <- sum(y<=1) # daire içine düşen nokta sayısını buluyoruz
    # mantıksal operatörleri dizilere uyguladığımızda operatör her elemana uygulanır 
    # 0 ve 1 değerlerin toplamını aldığımızda daire içine düşen nokta sayısını buluruz
    yaklasikPi=4*(nDaire/n)/1^2
    names( yaklasikPi ) <- c("tahmini")
    return(yaklasikPi) # sonuç dönmek için return() fonksiyonu da kullanılabilir
  }
  system.time(x <- simPI_apply(100000))

  
# Aynı işlemi vektörel olarak yapan bir kod yazalım ve sonuç 
# artı bir takım ekstra bilgileri liste halinde dönelim
  simPI_vektor <- function (n){
    #rassal sayıları  tek seferde n x 2 lik bir matriste tutalım
    rnd <- matrix(runif(2*n,-1,1) ,ncol=2)
    # 2∗n kadar rastgele sayı üretip bunu sütun sayısı 2 olan bir matrise dağıtır.
    y <- sqrt(rnd[,1]^2+rnd[,2]^2)# apply yerine toplamı vektörel olarak yapalım 
                                       # (iki vektör toplamı)
    nDaire <- sum(y<=1)
    yaklasikPi=4*(nDaire/n)/1^2
    return ( list ( tahminiPi=yaklasikPi , gercekPi=pi , DaireNoktaSayisi=nDaire ,
                       ToplamNoktaSayisi=n))
    # sonucu bir liste halinde dönebilirsiniz
  }
  snc=simPI_vektor (100000)
  # sadece tahmini pi değerine bakalım:
  snc$tahminiPi
  
  system.time(x <- simPI_vektor(100000))
  
  
#--------------------while döngüsü-------------------#
# while(koşul){ 
# koşul sağlamdığı sürece döngüye devam et 
# gerekli işlemleri gerçekleştir
#}
  
# while döngüsü ile kök bulma fonksiyonu
# belirli bir aralıktaki sürekli bir fonksiyonun kökünü bulur.
# sürekli fonksiyon x eksenini kesmelidir fakat dik kesmemelidir
  kokbul <- function(
    f, # sıfır değeri için çözülecek sürekli fonksiyon
    interval , # tek çözümün aranacağı aralık (2 elemanlı bir dizi) 
    errbound=1e-12, # izin verilen maksimum hata
    trace=FALSE # trace do§ru yapılırsa , yakınsanan sayı dizileri ekrana yazılır
  ){
    a <- interval [ 1 ] 
    b <- interval [ 2 ] 
    if (f(a)*f(b)>0){
      print("hata − çözüm yok ya da birden fazla çözüm var")
    }else{
      counter <- 0
      res <- 0
      err <- abs(a-b) while(err>errbound){
        c <- (a+b)/2
        fc < f(c)
        if (f(a)*fc>0){
          a <- c 
          }else{
            b <- c 
          }
        err <- abs(a-b) 
        counter <- counter+1 
        res[counter] <- a
      } 
      print(c(a,counter)) 
      if(trace){
        print(res)
      }
    }
  }

#Kök bulma fonksiyonunu kullanmak için func isimli bir fonksiyon daha tanımladık
  func <- function (x){x^2-2} 
  int <- c(1,2)
  kokbul(func , int)
 # [1] 1.414214 40.000000
  kokbul (func ,int , trace =TRUE )
  # [1] 1.000000 1.250000 1.375000 1.375000 1.406250 1.406250 1.414062 1.414062 
  # [9] 1.414062 1.414062 1.414062 1.414062 1.414185 1.414185 1.414185 1.414200
  # [17] 1.414207 1.414211 1.414213 1.414213 1.414213 1.414213 1.414214 1.414214 
  # [25] 1.414214 1.414214 1.414214 1.414214 1.414214 1.414214 1.414214 1.414214 
   
  [33] 1.414214 1.414214 1.414214 1.414214 1.414214 1.414214 1.414214 1.414214
  
  