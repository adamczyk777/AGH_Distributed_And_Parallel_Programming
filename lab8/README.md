* Utwórz potok 3 procesów przekazujących sobie dane Producent–>Pośrednik–>Konsument. Producent wysyła N losowych wartości. Funkcja kończy się po odebraniu przez Konsumenta przesłanych wartości.
* Dopisz panel (wg przykładu Panel) prezentujący działanie modelu Producent-Konsument.
* Napisz program przetwarzający dane ze strumienia (listy) przez jeden z N procesów:
    *  Generator_danych –> N-procesów_przetwarzających –> Bufor_odbiorczy

* Zapisz funkcję sortującą współbieżnie listę
     * z podziałem na N procesów i scalaniem
    * przez rekurencyjne współbieżne scalanie
Porównaj czas sortowania listy sekwencyjnie i współbieżnie.