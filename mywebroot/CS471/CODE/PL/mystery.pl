% :-setenv(editor,'c:/emacs/bin/runemacs').

mys([X],X).
mys([R,H|T],X):-N is R+H, mys([N|T],X).


mysA([]).
mysA([X|Y]):-mysB(Y).
mysB([X|Y]):-mysA(Y).






