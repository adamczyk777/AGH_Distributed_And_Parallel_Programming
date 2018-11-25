-module(zad4).
-export([decreasingl/1]).
-export([list_gen/1]).
-export([list_gen/2]).

% Pola z listy elementów
% Napisz program wyliczający pola figur/brył podanych jako lista krotek. Zwracana ma być lista pól.

% Lista malejąca
% Napisz program, który dla danego N zwróci listę formatu [N,N-1,…,2,1]
decreasingl(0) -> [];
decreasingl(N) ->
    decreasingl([], N).
decreasingl(L, N) when N > 0 ->
    decreasingl(L ++ [N], N-1);
decreasingl(L, 0) -> L.

% Konwerter temperatur
% Napisz konwerter temperatury pomiędzy różnymi skalami (minimum 4). 
% Temperatura podawana jest jako krotka {typ, wartość} np. {c, 22.4}, {f,0.0}. 
% Funkcja konwertująca ma przyjmować 2 parametry: 
% krotkę reprezentującą temperaturę oraz skalę docelową np. temp_conv({c,22.4},k). 
% Wartością zwracaną ma być odpowiednia krotka np. {k,233.47}.


% Generator listy o zadanej długości
% Napisz program generujący listę jedynek o zadanej długości. 
list_gen(0) -> [];
list_gen(Len) ->
    list_gen(Len, 1).
list_gen(0, _) -> [];
list_gen(Len, N) ->
    list_gen(Len, N, []).
list_gen(0, _, L) -> L;
list_gen(Len, N, L) when N > 0 ->
    list_gen(Len-1, N, L ++ [N]).

% Sortowanie
% Napisz program sortujący listę rekurencyjnie przez scalanie

% Napisz program sortujący listę metodą bąbelkową

