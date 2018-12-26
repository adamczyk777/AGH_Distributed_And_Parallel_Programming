# Temat 10. Interfejs użytkownika
## Tematyka
* Wyjątki uzupełnienia.
* Wzajemne wykluczanie procedur we/wy.
* Rozszerzona obsługa terminala:
    * dla Windows pakiet NT_Console [Nt_Console](http://home.agh.edu.pl/jpi/download/ada/nt_con03.zip)
    * dla Linux'a, macOSX- kody ESC + ….;
        * w Adzie ESC ASCII.ESC, w Erlangu ESC \e
        * przykład użycia [Panel Ada](http://home.agh.edu.pl/~jpi/download/ada/KursAdaPanel.zip), [Panel Erlang](http://home.agh.edu.pl/~jpi/download/erlang/KursErlangPanel.zip)
* Inne pakiety, biblioteki
    * do Ady
        * Pakiet JEWL (tylko Windows) [JEWL](http://home.agh.edu.pl/~jpi/jewl_pl/index.htm)
        * Pakiet GtkAda [GtkAda](https://www.adacore.com/gtkada)
        * Pakiet AWS (Ada Web Server) [AWS Ada](https://www.adacore.com/gnatpro/toolsuite/ada-web-server) [AWS GitHub](https://github.com/AdaCore/aws)
    * do Erlanga
        * Pakiet wxWidgets - Erlang [wxWidgets](http://erlang.org/doc/apps/wx/chapter.html)

## Zadania
1. Dopisz panel (wg przykładu Panel) prezentujący działanie modelu Producent-Konsument.
2. Napisz program generujący i prezentujący w panelu przebieg temperatury otoczenia uwzględniający czas (dobowy) i porę roku. Wyświetlaj symulowany czas, porę roku i temperaturę. Bazuj na przykładzie - Panel.
3. Zrealizuj w Erlangu odpowiednik Panela (z wzajemnym wykluczaniem).