#Homework4
#pm0 için read table işlemi(1999'a ait)
pm0 <- read.table("pm25_data/RD_501_88101_1999-0.txt", comment.char = "#", header = FALSE, 
                  sep = "|", na.strings = "")

dim(pm0)
head(pm0[, 1:13]) #Datasetin ilk 6 satırını gösterir
cnames <- readLines("Downloads/RD_501_88101_1999-0.txt", 1)#Datasetin 1.satrını(başlık satırını okur.)
cnames <- strsplit(cnames, "|", fixed = TRUE)# tek satır halinde görünen başlıkları ayırır.
names(pm0) <- make.names(cnames[[1]])#pm0 data setinin sütun isimlerini ayarlar.
head(pm0[, 1:13])#pm0 data setinin ilk 6 satırını gösterir.

x0 <- pm0$Sample.Value #x0'a pm0 datasetinin Sample.Value sütunu atanır.
summary(x0)#x0'un özeti
mean(is.na(x0))#x0'daki NA değerlerin dışındaki değerlerin ortalamasını alır.

#pm1 için read table işlemi(2012'ye ait)
pm1 <- read.table("Downloads/RD_501_88101_2012-0.txt", comment.char = "#", header = FALSE, sep = "|", na.strings = "", nrow = 1304290)
names(pm1) <- make.names(cnames[[1]])
x1 <- pm1$Sample.Value
boxplot(log2(x0), log2(x1))

summary(x0)
summary(x1)
negative <- x1 < 0
mean(negative, na.rm = T)


dates <- pm1$Date
dates <- as.Date(as.character(dates), "%Y%m%d")
missing.months <- month.name[as.POSIXlt(dates)$mon + 1]
tab <- table(factor(missing.months, levels = month.name))
round(100 * tab / sum(tab))

#Changes in PM levels at an individual monitor
site0 <- unique(subset(pm0, State.Code == 36, c(County.Code, Site.ID)))
site1 <- unique(subset(pm1, State.Code == 36, c(County.Code, Site.ID)))


site0 <- paste(site0[,1], site0[,2], sep = ".")
site1 <- paste(site1[,1], site1[,2], sep = ".")
str(site0)
str(site1)

#intersection between the sites present in 1999 and 2012
both <- intersect(site0, site1)
print(both)

## Find how many observations available at each monitor
pm0$county.site <- with(pm0, paste(County.Code, Site.ID, sep = "."))
pm1$county.site <- with(pm1, paste(County.Code, Site.ID, sep = "."))
cnt0 <- subset(pm0, State.Code == 36 & county.site %in% both)
cnt1 <- subset(pm1, State.Code == 36 & county.site %in% both)


## 1999
sapply(split(cnt0, cnt0$county.site), nrow)
## 2012
sapply(split(cnt1, cnt1$county.site), nrow)d

both.county <- 63
both.id <- 2008

## Choose county 63 and side ID 2008
pm1sub <- subset(pm1, State.Code == 36 & County.Code == both.county & Site.ID == both.id)
pm0sub <- subset(pm0, State.Code == 36 & County.Code == both.county & Site.ID == both.id)

dates1 <- as.Date(as.character(pm1sub$Date), "%Y%m%d")
x1sub <- pm1sub$Sample.Value
dates0 <- as.Date(as.character(pm0sub$Date), "%Y%m%d")
x0sub <- pm0sub$Sample.Value
## Find global range
rng <- range(x0sub, x1sub, na.rm = T)
par(mfrow = c(1, 2), mar = c(4, 5, 2, 1))
plot(dates0, x0sub, pch = 20, ylim = rng, xlab = "", ylab = expression(PM[2.5] * " (" * mu * g/m^3 * ")"))
abline(h = median(x0sub, na.rm = T))
plot(dates1, x1sub, pch = 20, ylim = rng, xlab = "", ylab = expression(PM[2.5] * " (" * mu * g/m^3 * ")"))
abline(h = median(x1sub, na.rm = T))


#Changes in state-wide PM levels
# 1999
mn0 <- with(pm0, tapply(Sample.Value, State.Code, mean, na.rm = TRUE))
# 2012
mn1 <- with(pm1, tapply(Sample.Value, State.Code, mean, na.rm = TRUE))

## Make separate data frames for states / years
d0 <- data.frame(state = names(mn0), mean = mn0)
d1 <- data.frame(state = names(mn1), mean = mn1)
mrg <- merge(d0, d1, by = "state")
head(mrg)

#a plot that shows the 1999 state-wide means in one “column” and the 2012 state-wide means in another columns.
par(mfrow = c(1, 1))
rng <- range(mrg[,2], mrg[,3])
with(mrg, plot(rep(1, 52), mrg[, 2], xlim = c(.5, 2.5), ylim = rng, xaxt = "n", xlab = "\
                 ", ylab = "State-wide Mean PM"))
with(mrg, points(rep(2, 52), mrg[, 3]))
segments(rep(1, 52), mrg[, 2], rep(2, 52), mrg[, 3])
axis(1, c(1, 2), c("1999", "2012"))