#1.1 Vektör Olusturma
x <- 3
x = 3

x <- 7.5

x <- 1:8 # ardışık tam sayı vektörü oluşturur.

y <- 15:11 #azalan bir ardışık tam sayı vektörü oluşturur. 

y <- x+3

x <- 1:8
y <- 1:4
x+y

x <- 1:8
y <- 1:3
x+y


x<- c(4,8,15, 16 , 23 , 42)
y<- c ( 501,505,578,586)
z<- c(x,y)

length(z)

m<-c(1,5,1,4,7,4,1)
unique(m) # oluşturulan m vektöründeki tekil değerler

table(m) #tekil değerlerin kaç adet olduğu

z<- rev(z) # eleman sırasını tersine çevir

x<- rep(5,10) #5 değerini 10 kez tekrar et
y<- c(3,5,7)
z<- rep(y,4) #z vektörünü 4 kez tekrar et


rep(y,c(2,3,5)) # y nin elemanlarını teker teker belirlenen değerlerde tekrar et

x<- seq(2,3,length.out = 21) #lenght.out vektörün uzunluğunu belirleyen parametre adı.

x<- seq(2,3,by=0.06)

#1.2 Mantıksal Ifadeler
x<- 10:20

x<17 #x in hangi de?erleri 17 den k???kt?r.
x<=17
x>14
x>=14
x==16
x!=16
x<=16 & x>=12 # x ' in hangi değerleri 16dan küçük eşit ve 12den büyük eşittir.
( x<=11) | ( x>=18)

ind=which ( x<17) # x ' in 17den küçük değerlerinin indeksleri nedir
ind

ind2=which ( x==16) #x ' in hangi i n d e k s t e k i de? e r i 16ya e ? i t t i r
ind2
 # 7

v1=90:120 
v2=10:100

ind3=which(v1 %in% v2)
ind3

x<- 1:20
y<- (x>=8)*(x)
y



siparisMiktari <- 30:50
birimMaliyet <- 7*siparisMiktari*(siparisMiktari<40)+6.5*siparisMiktari*(siparisMiktari>=40)
birimMaliyet

sabitMaliyet <- 50*(siparisMiktari<=45)+15*(siparisMiktari>45)
sabitMaliyet

toplamMaliyet <- sabitMaliyet+birimMaliyet
toplamMaliyet

siparisMiktari[toplamMaliyet <=318] #318TL' den daha dusuk maliyete sahip olan sipariş miktarlarını gösterir.

toplamMaliyet[toplamMaliyet <=318]


x <- seq( 5 , 8 , by=0.3) # 11 elemanlı bir vektör oluşturuyoruz
x
length(x)

y1 <- x [3:7] # 3. elemanından 7. elemana kadar olan kısmını alıyoruz
y1

y2 <- x [ 2 * ( 1 : 5 ) ] # çift sayı sırasındaki elemanları alıyoruz 2. , 4. gibi
y2

y3 <- x[ -1] 
y3

y4 <- x[-length(x)]
y4

y5 <-x[-seq(1,11,3)] # belirtilen elemanları çıkarıp geri kalanı alıyoruz
y5

y6 <- x[c(1,3,7)] # sadece birinci,üçüncü ve yedinci elemanları alıyoruz
y6

y7 <-x [seq(1,11,3)]
y7

#1.3 Matrisler

x <-1:5
y <-t(x)
y

t(y) #veya sadece t(t(x)) de yazabilirdik.


vec <-1:12
x <- matrix ( vec,nrow=3, ncol=4)
x #rakamlarınn sırasına dikkat

t(x) #döndürülmüş

vec <-1:12
x <- matrix ( vec,nrow=3, ncol=4,byrow = TRUE)
x


x <- matrix ( c(1,2,-1,1,2,1,2,-2,-1),nrow=3, ncol=3)
x

xinv <- solve(x)
xinv

x <-matrix(0,nrow=4,ncol=4)
x

diag(x) <-1  # mat r i s k? ? egenin bütün değerlerini 1 yapar
x

x <-matrix(0,ncol=5,nrow=4)
ncol(x)
nrow(x)
length(x)
dim(x)

#1.4 R'da Aritmetik Islemler

x<- 2*(1:5)
x

y<-1:5
y

x+y
x*y
x/y
x-y
x^2
x^y
x%%3 # mod(3) ile kalan hesabı


y<- 3:7
y

x%%y
x%/%y

x<- c(3,1,6,5,8,10,9,12,3)
min(x)
max(x)
sum(x)
prod(x)


x<- 1:10
y<- 10:1
z<- c(3,2,1,6,5,4,10,9,8,7)

a<- pmax(x,y,z)
a

b<- pmin(x,y,z)
b

veri<-c(5,32,6,11,43,11,4,3,2,8) #Sort bize güzel bir sıralı liste verir.
sort(veri) 
#Order bize sıralamanın hücre numaralarını ( indeks ) verir.
order(veri)
veri[order(veri)]
order(veri,decreasing=TRUE)
rank(veri)
rank(veri,ties.method="first")
rank(veri,ties.method="random")
rank(veri,ties.method="max")
rank(veri,ties.method="min")
rank(veri,ties.method="average")
rank(-veri)
x<- matrix (1:6,ncol=2,nrow=3)
x

y<- matrix (1:4,ncol=2,nrow=2)
y

x%*%y

y%*%x

y%*%t(x)


x<- 1:3
y<- 3:1

x%*%y

t(x)%*%y

t(x)%*%t(y)

x%*%t(y)

x<- c(1,4,5,6,2,12)
y<- cumsum(x)
y

z<- cumprod(x)
z

diff(x)

factorial(3)
factorial(1:6)
abs(-4)
abs(c(-3:3))
sqrt(4)
sqrt(1:9)

log(100)
log10(100)
log2(100)
log(100,5)
log(c(10,20,30,40))

exp(4.60517)

exp (log(100))
exp(seq(-2,2,0.4))
gamma(5)
gamma(5.5)
x<- c(-3,-3.5,4,4.2)
floor (x)
ceiling(x)
as.integer(x)
