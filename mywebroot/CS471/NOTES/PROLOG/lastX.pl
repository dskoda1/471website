permute( [ ], [ ] ).
permute(L, [ X| Y] ) :- select( L, X, T ), permute( T, Y ).

select([ X  |  Y ], X, Y ).
select([ X | Y ],  Z,  [  X | T ] ) :- select( Y, Z, T).

selectR([ X | Y ],  Z,  [  X | T ] ) :- selectR( Y, Z, T).
selectR([ X  |  Y ], X, Y ).


isorder([A,B|T]):- A =< B, isorder([B|T]).
isorder([A]).
isorder([]).

sortLst(Lst,SLst):-permute(Lst,SLst),isorder(SLst).

mys(A,N,Lst):-length(Lst,N),append([A],L,Lst),append(L,[A],Lst).


?- permute([a,b,c],L).
L = [a, b, c] ;
L = [a, c, b] ;
L = [b, a, c] ;
L = [b, c, a] ;
L = [c, a, b] ;
L = [c, b, a] ;
false.
?- select([a,b,c],X,Y).
X = a,
Y = [b, c] .

?- selectR([a,b,c],X,Y).
X = c,
Y = [a, b] 
