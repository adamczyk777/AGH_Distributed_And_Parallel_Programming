-module(zad2).
-export([len/1]).

% list length
len([]) -> 0;
len(L) -> len(L, 0).
len([_|L], Count) -> len(L, Count+1);
len([], Count) -> Count.