# Temat 9. Strumienie

## Tematyka
* pojęcie strumienia
* zapis do strumienia - atrybuty Write i Output
* odczyt ze strumienia - atrybuty Read i Input
* przykłady użycia [Strumienie](http://home.agh.edu.pl/~jpi/download/ada/KursAdaStrumienie.zip)
## Uwagi do przykładów
* jeśli dostępny jest plik projektu (.gpr), to kompilacja komendą: gnatmake -P nazwa_projektu.gpr
* komunikacja przez 'sockety' może wymagać zróżnicowania numerów portów dla każdej pary sensor-kontroler; dla laboratoriów w konfiguracji serwer+terminale; wszystkie programy uruchamiane są na jednym komputerze - serwerze (linux)

## Zadania
1. Napisz i użyj procedury wysyłające i odbierające ze strumienia macierze liczb rzeczywistych.
2. Napisz program wyznaczający czas przesyłania i odbioru danych przekazywanych przez strumienie na socketach.