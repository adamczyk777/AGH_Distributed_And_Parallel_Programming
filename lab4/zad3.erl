% Min max
-module(zad3).
-export([amin/1]).
-export([amax/1]).
-export([tmin_max/1]).
-export([lmin_max/1]).
% Napisz program podający najmniejszy element listy (amin/1).
amin([]) -> null;
amin([H|L]) ->
    amin(L, H).
amin([H|L], Min) when H < Min ->
    amin(L, H);
amin([_|L], Min) ->
    amin(L, Min);
amin([], Min) ->
    Min.

% Napisz program podający największy element listy (amax/1).
amax([]) -> null;
amax([H|L]) ->
    amax(L, H).
amax([H|L], Max) when H > Max ->
    amax(L, H);
amax([_|L], Max) -> 
    amax(L, Max);
amax([], Max) ->
    Max.

% Napisz program zwracający krotkę 2-elementową z najmniejszym i największym elementem listy (tmin_max/1).
tmin_max([]) -> null;
tmin_max(L) -> {amin(L), amax(L)}.

% Napisz program zwracający listę 2-elementową z najmniejszym i największym elementem listy (lmin_max/1).
lmin_max([]) -> null;
lmin_max(L) -> [amin(L), amax(L)].


