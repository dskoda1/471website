/*
        CS471 - Programming Languages
        Section: <YOUR Section number>
        Assignment #<number> due: <DATE>
        Author: <LastName>, <FirstName> (<EMail>)
        Date: <DATE>
*/

%1.  product(+Lst,Prod) 
% CODE to follow:
% We can assume that the empty list has no product.

product([H|T],P):- product(T,P1), P is P1 * H.
product([E],E).



%2. prodV(V,Lst,RLst)

prodV(_,[],[]).
prodV(F,[H|T],[P|RT]):- P is H*F, prodF(F,T,RT).


%3. zipIt(Z,X,Y)

zipIt(zip(X,Y),X,Y).

%4 zipLstW4(E,Lst,Zlst)

zipLstW4(_,[],[]).
zipLstW4(E,[H|T],[zip(E,H)|ZT]):-zipLstW4(E,T,ZT).




%5 zipLst5(E,Lst,Zlst)
zipLstW5(_,[],[]).
zipLstW5(E,[H|T],[Z|ZT]):-zipIt(Z,E,H),zipLstW5(E,T,ZT).


%6 subSeq(Slst,Lst)
subSeq([],_).
subSeq([S|ST],[S|LT]) :- subSeq(ST,LT).
subSeq(S,[_|LT]):- subSeq(S, LT).



%7. hasDouble(Lst).
hasDouble([(X,X)|_]).
hasDouble([_|T]):-hasDouble(T).


%8.   secondtoLast(Lst, Element).
secondtoLast([S,_],S).
secondtoLast([_|T],S):-secondToLast(T,S).

secondtoLast2([S,_],S).
secondtoLast2([_,F,S|T],S):-secondToLast2([F,S|T],S).



%9.   countElements(LstOfLsts, Number).
countElements([],0).
countElements([H|T],Nx):- length(H,L), countElements(T,N), Nx is L+N.


%10. mapFun(Functor,ListOfArgs,ListOfTerms).
mapFun(_,[],[]).
mapFun(F,[A|AT],[T|R]):- T=..[F,A], mapFun(F,AT,R).



%11. appPred(L)

appPred([]).
appPred([H|T]):- H, appPred(T).
