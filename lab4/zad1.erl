-module(zad1).
-export([pole/1]).
-export([objetosc/1]).
-export([len/1]).
 
pole({kwadrat,X,Y}) ->  X*Y;
pole({kolo,X}) -> 3.14*X*X;
pole({trojkat, X, H}) -> X*H/2;
pole({trapez, A, B, H}) -> (A+B) * H / 2;
pole({szescian, A, B, C}) -> A*B*C;
pole({kula, R}) -> 4*3.14*R*R;
pole({stozek, R, L}) -> 3.14*R(R+L).

objetosc({szescian, A, B, C}) -> (2*A*B) + (2*A*C) + (2*B*C);
objetosc({kula, R}) -> 4/3*3.14*R*R*R;
objetosc({stozek, R, H}) -> 1/3*3.14*R*R*H.

% dlugosc listy

len(list).

