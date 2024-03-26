rm(list=ls()) #czyszczenie obszaru roboczego
cat("\014") #czyszczenie konsoli (odpowiednik Ctrl+L)
# 1. Instalacja i ładowanie pakietów
install.packages("zoo") #pakiet służący do porządkowania szeregów czasowych
install.packages("tseries") #pakiet służący do analiz  szeregów czasowych
install.packages("ggplot2") #uniwersalny pakiet do tworzenia ładnych wykresów w R 
install.packages("moments") #statystyki opisowe, testy
library(zoo)
library(tseries)
library(ggplot2)
library(moments)


#Wczytanie instrumentów LockHeadMartin, RTX, BAE Systems

bae<-read.csv("https://stooq.pl/q/d/l/?s=ba.uk&i=d")
lmt<-read.csv("https://stooq.pl/q/d/l/?s=lmt.us&i=d")
rtx<-read.csv("https://stooq.pl/q/d/l/?s=rtx.us&i=d")

#Konwersja dat z chr na date

bae$Data<-as.Date(bae$Data,format="%Y-%m-%d")
lmt$Data<-as.Date(lmt$Data,format="%Y-%m-%d")
rtx$Data<-as.Date(rtx$Data,format="%Y-%m-%d")


# Znalezienie najstarszej wspólnej daty
start_date <- max(min(bae$Data), min(lmt$Data), min(rtx$Data))

# Filtrowanie danych do najstarszej wspólnej daty
bae <- subset(bae, Data >= start_date)
lmt <- subset(lmt, Data >= start_date)
rtx <- subset(rtx, Data >= start_date)

# Sprawdzenie brakujących wartości dla każdego zestawu danych
any_na_bae <- anyNA(bae)
any_na_lmt <- anyNA(lmt)
any_na_rtx <- anyNA(rtx)

# Wyświetlenie wyników
cat("Czy są brakujące wartości w danych dla BAE Systems:", any_na_bae, "\n")
cat("Czy są brakujące wartości w danych dla LockHeadMartin:", any_na_lmt, "\n")
cat("Czy są brakujące wartości w danych dla RTX:", any_na_rtx, "\n")


#wybranie kolumn Data i zamkniecie
bae <- bae[,c(1,5)] 
colnames(bae) <- c("data","BAE Systems")

lmt <- lmt[,c(1,5)] 
colnames(lmt) <- c("data","LockHeadMartin")

rtx <- rtx[,c(1,5)] 
colnames(rtx) <- c("data","RTX")


#Połączenie w jedną tablicę
trzyspolki <- merge(merge(bae, lmt, by = "data"), rtx, by = "data", all = FALSE)
head(bae)
head(lmt)
head(rtx)
tail(trzyspolki)

# Wyznaczenie logarytmicznych stóp zwrotu dla każdej kolumny osobno
bae_return <- diff(log(bae$`BAE Systems`)) * 100
lmt_return <- diff(log(lmt$LockHeadMartin)) * 100
rtx_return <- diff(log(rtx$RTX)) * 100

# Tworzenie obiektów zoo lub ts
bae_return_zoo <- zoo(bae_return, order.by = bae$data[-1])
lmt_return_zoo <- zoo(lmt_return, order.by = lmt$data[-1])
rtx_return_zoo <- zoo(rtx_return, order.by = rtx$data[-1])

# Połączenie obiektów zoo
trzyspolki_return <- merge(merge(bae_return_zoo, lmt_return_zoo,all=FALSE), rtx_return_zoo, all = FALSE)

# Statystyki opisowe
summary(trzyspolki_return)

# Wykres
plot(trzyspolki_return)

# Korelacja
cor(trzyspolki_return)


##Średnie i kurtozy LockHeadMartin
lmt_M1   = moment(lmt_return, order = 1, central = FALSE, na.rm = TRUE) #średnia i pomijaj brakujące dane
lmt_M2   = moment(lmt_return, order = 2, central = TRUE, na.rm = TRUE) #wariancja
lmt_M3   = moment(lmt_return, order = 3, central = TRUE, na.rm = TRUE) #3ci moment centralny
lmt_M4   = moment(lmt_return, order = 4, central = TRUE, na.rm = TRUE) #4-ty moment centralny

lmt_mu  = lmt_M1; lmt_mu               #średnia
lmt_sig = sqrt(lmt_M2); lmt_sig         #odchylenie std. (miara zmienności), pierwiastek z wariancji
lmt_S0   = lmt_M3/(lmt_sig^3); lmt_S0      #skośność - trzeci moment centralny dzielimy podzielony przez odchylenie do 3
lmt_K0   = lmt_M4/(lmt_sig^4); lmt_K0      #kurtoza, rozkład normalny ma kurtozę =3, wieksza kurtoza onzacza wyzsze prawdopodobienstow odchylen

##Średnie i kurtozy RTX
rtx_M1   = moment(rtx_return, order = 1, central = FALSE, na.rm = TRUE) #średnia i pomijaj brakujące dane
rtx_M2   = moment(rtx_return, order = 2, central = TRUE, na.rm = TRUE) #wariancja
rtx_M3   = moment(rtx_return, order = 3, central = TRUE, na.rm = TRUE) #3ci moment centralny
rtx_M4   = moment(rtx_return, order = 4, central = TRUE, na.rm = TRUE) #4-ty moment centralny

rtx_mu  = rtx_M1; rtx_mu               #średnia
rtx_sig = sqrt(rtx_M2); rtx_sig         #odchylenie std. (miara zmienności), pierwiastek z wariancji
rtx_S0   = rtx_M3/(rtx_sig^3); rtx_S0      #skośność - trzeci moment centralny dzielimy podzielony przez odchylenie do 3
rtx_K0   = rtx_M4/(rtx_sig^4); rtx_K0      #kurtoza, rozkład normalny ma kurtozę =3, wieksza kurtoza onzacza wyzsze prawdopodobienstow odchylen

##Średnie i kurtozy BAESystems
bae_M1   = moment(bae_return, order = 1, central = FALSE, na.rm = TRUE) #średnia i pomijaj brakujące dane
bae_M2   = moment(bae_return, order = 2, central = TRUE, na.rm = TRUE) #wariancja
bae_M3   = moment(bae_return, order = 3, central = TRUE, na.rm = TRUE) #3ci moment centralny
bae_M4   = moment(bae_return, order = 4, central = TRUE, na.rm = TRUE) #4-ty moment centralny

bae_mu  = bae_M1; bae_mu               #średnia
bae_sig = sqrt(bae_M2); bae_sig         #odchylenie std. (miara zmienności), pierwiastek z wariancji
bae_S0   = bae_M3/(bae_sig^3); bae_S0      #skośność - trzeci moment centralny dzielimy podzielony przez odchylenie do 3
bae_K0   = bae_M4/(bae_sig^4); bae_K0      #kurtoza, rozkład normalny ma kurtozę =3, wieksza kurtoza onzacza wyzsze prawdopodobienstow odchylen


#Histogramy

#Wygładzony histogram (wykres gęstości) + porównanie z rozkładem normalnym
#BAE Systems
r1 <- bae_return_zoo
ggplot(data.frame(r1), aes(x = r1)) +
  theme_bw() +
  geom_density(aes(fill = "Bae System"), colour = "green", size = 0.01) +
  stat_function(fun = function(x) dnorm(x, mean = bae_mu, sd = bae_sig), color = "blue", size = 1) +
  labs(fill = "Legend", color = "Legend") +
  xlim(-15, 15)+
  xlab("Rozkład danych Bae System oraz rozkład normalny")+
  scale_fill_manual(values = c("Bae System" = "green"))

#LockheadMartin
r2 <- lmt_return_zoo
ggplot(data.frame(r2), aes(x = r2)) +
  theme_bw() +
  geom_density(aes(fill = "Lockhead Martin"), colour = "red", size = 0.01) +
  stat_function(fun = function(x) dnorm(x, mean = lmt_mu, sd = lmt_sig), color = "blue", size = 1) +
  labs(fill = "Legend", color = "Legend") +
  xlim(-15, 15)+
  xlab("Rozkład danych Lochead Martin oraz rozkład normalny")+
  scale_fill_manual(values = c("Lockhead Martin" = "red"))

#RTX
r3 <- lmt_return_zoo
ggplot(data.frame(r3), aes(x = r3)) +
  theme_bw() +
  geom_density(aes(fill = "RTX"), colour = "yellow", size = 0.01) +
  stat_function(fun = function(x) dnorm(x, mean = rtx_mu, sd = rtx_sig), color = "blue", size = 1) +
  labs(fill = "Legenda", color = "Legenda") +
  xlim(-15, 15)+
  xlab("Rozkład danych RTX oraz rozkład normalny")+
  scale_fill_manual(values = c("RTX" = "yellow"))



