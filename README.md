Część 1 zaliczenia [30 punktów] – 3. zjazd (SZ)
Polecenie identyczne dla każdej grupy:
1.	Wybierz 3 instrumenty, dla których przeprowadzasz analizę (np. akcji, korzystając ze strony stooq.pl)  - LockheadMartin, RTX i BaeSystems - trzeba jeszcze potwierdzić u prowadzącej
2.	Napisz kod, który wczytuje dane dot. ceny wybranych instrumentów. Oceń kompletność zbioru danych. -Tutaj trzeba jeszcze ocenić czy nie brakuje czegoś. Daty są wyrównane (też do sprawdzenia)
3.	Wyznacz szeregi dziennych logarytmicznych stóp zwrotu. - Chyba DONE? Nie wiem czy powinno być w postaci listy czy szeregu czasowego
4.	Dla wyznaczonych stóp zwrotu podaj podstawowe statystyki opisowe (średnia, odchylenie standardowe, maksimum, minimum, mediana). -DONE
5.	Przedstaw uzyskane szeregi czasowe w postaci wykresu/wykresów. - Trzeba je zrobić ładniej
6.	Oceń korelację między stopami zwrotu różnych instrumentów. 
7.	Wyznacz skośność i kurtozę dla stóp zwrotu z każdego z instrumentów. -DONE
8.	Przedstaw histogramy i oceń zgodność z rozkładem normalnym. 

7.04 – termin przesłania pierwszej pracy domowej



14.06 – przesłanie drugiej pracy domowej

Część 2 zaliczenia [55 punktów] – na koniec semestru
Dla każdej grupy do wyboru jeden z tematów:

A.	Analiza strategii inwestycyjnych 
a.	Rozważamy zbiór spółek z pierwszej części pracy.
b.	Wygeneruj i omów dowolny wykres / wskaźnik z zakresu analizy technicznej (np. w pakiecie quantmod) [10]
c.	Zaproponuj 2 warianty strategii inwestycyjnej [30], np. momentum, MACD, analiza zmian z ostatnich X sesji itp. – omów kluczowe parametry i założenia swojej strategii, a także przedstaw jej skuteczność w wybranym horyzoncie inwestowania. 
d.	Rozważ 2 inne horyzonty inwestycji [10]
B.	Analiza ryzyka związanego z inwestycją 
a.	Rozważamy zbiór spółek z pierwszej części pracy. Dla każdej ze spółek policz miary VaR na podstawie symulacji historycznej oraz analizy parametrycznej dla rozkładu normalnego [25] 
b.	Dokonaj analizy historycznej oraz parametrycznej dla rozkładu normalnego VaR dla portfela, w którym każda ze spółek stanowi co najmniej 20% wartości portfela [10] 
c.	Przeprowadź JEDNĄ z dodatkowych analiz: (i) backtesting, (ii) stress-testing, (iii) Expected Shortfall. [15]
C.	Model CAPM 
a.	Rozważamy zbiór spółek z pierwszej części pracy. Oszacuj model jednoczynnikowy (Sharpe’a) [15] i dokonaj jego wszechstronnej weryfikacji: 
b.	Sprawdź statystyczną istotność zmiennej oraz oceń poziom ryzyka związanego z każdą z analizowanych spółek (czy beta = 1, <1, >1?) [15] 
c.	Przeprowadź test trzech hipotez: [20]
i.	model jednoczynnikowy jest prawdziwy w każdym okresie; 
ii.	model CAPM jest prawdziwy w każdym okresie; 
iii.	parametry beta są stabilne w czasie. 
D.	Prognozowanie (ARIMA lub SARIMA) 
a.	Rozważamy zbiór spółek z pierwszej części pracy.
b.	Oceń czy szeregi cen wybranych instrumentów są stacjonarne (ew. ustal stopień zintegrowania) [15] 
c.	Wygeneruj obiekt, w którym usuniesz ostatnie 30 obserwacji, a następnie na jego podstawie oszacuj model ARIMA. Uzasadnij dobór parametrów p, q oraz d. [20] 
d.	Policz błędy prognozy ex post i oceń jakoś prognoz z otrzymanego modelu [15]
E.	Modelowanie zmienności kursów walutowych (czy np. indeksów giełdowych) za pomocą modelu klasy GARCH
a.	Rozważamy zbiór spółek z pierwszej części pracy. 
b.	Oceń ryzyko występowania zjawiska grupowania wariancji reszt w modelu objaśniającym stopy zwrotu – na podstawie wykresu oraz testu Engle’a efektów ARCH [15]
c.	Oszacuj i omów model ARMA(p,q)-GARCH(r,m). Omów wyniki testów diagnostycznych [20]
d.	Wyznacz prognozę zmienności z modelu na co najmniej 30 dni w przód [15]
F.	Model analizujący wartość kredytów w gospodarce (analizy makroostrożnościowe) 
a.	Wybierz kraj z pliku dane_dodatkowe_cgaps.xlsx. 
i.	Sprawdź stacjonarność szeregu odchyleń kredytu od trendu H-P
ii.	Wybierz postać funkcyjną dla szeregu (poziomy, przyrosty, logarytmy) [15] 
b.	Zaproponuj 1 dodatkową zmienną objaśniającą do modelu (stopa procentowa lub inna) i dodaj ją do bazy danych [5] 
c.	Oszacuj 3 modele: AR, DL oraz ADL. Dokonaj weryfikacji liczby opóźnień (funkcja autokorelacji reszt, test Ljunga-Boxa, kryterium Akaike). Sprawdź istotność opóźnień oraz własności składnika losowego Wybierz 1 model i uzasadnij swój wybór. [20]
d.	Podsumuj wnioski płynące z modelu [10] – analiza mnożników. 
G.	Wykorzystanie modelu regresji logistycznej do oceny zdolności kredytowej. 
a.	Wylosuj 500 obserwacji ze zbioru credit_data.xls - niech to będzie zbiór treningowy oraz 100 obserwacji z pozostałych - niech to będzie zbiór testowy. [5]
b.	Dla wylosowanego zbioru treningowego oszacuj model logitowy (dla "creditability" i wybranych zmiennych objaśniających). Policz i zinterpretuj efekty krańcowe, zliczeniowe R2 i pseudo R2. [15]
c.	Dokonaj predykcji na danych testowych. Narysuj i omów krzywą ROC. [15]
d.	Stwórz tabelę klasyfikacyjną dla progu alpha = 0.5. Oblicz wrażliwość i specyficzność dla tej tabeli. [10]
e.	Policz AUC wraz z 90% bootstrapowym przedziałem ufności. [5]
