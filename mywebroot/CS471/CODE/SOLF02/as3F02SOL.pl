/*      as3F02SOL.pl
        CS471 - Programming Languages
        Section: <YOUR Section number>
        Assignment #<number> due: <DATE>
        Author: <LastName>, <FirstName> (<EMail>)
        Date: <DATE>
*/

%1. mkTuple(X, Y, P).
% CODE to follow:

mkTuple(X, Y, (X,Y)).


%2. mkZip(Z,X,Y).

mkZip(zip(X,Y), X, Y).


%3. addV(V,Lst,RLst).

addV(_,[],[]).
addV(V,[H|T],[RH|RT]) :- RH is H + V, addV(V,T,RT).



%4. hasDuplicate(Lst).

hasDuplicate([H|T]) :- member(H,T).
hasDuplicate([_|T]) :- hasDuplicate(T).


%5.   secondElement(Lst, Element).

secondElement([_, E|_],E).

%6.   isIncreasing(Lst).

isIncreasing([]).
isIncreasing([_]).
isIncreasing([F,S|T]):- F<S, isIncreasing([S|T]).


%7.   tupleLists(L, M, P).

tupleLists([],_,[]).
tupleLists(_,[],[]).
tupleLists([H|T],[J|K],[(H,J)|L]):- tupleLists(T, K, L).


%8.   numOfElements(LstOfLsts, Number).
numOfElements([],0).
numOfElements([H|T],Nx):- length(H,L), numOfElements(T,N), Nx is L+N.


%9. funmap(Functor,ListOfArgs,ListOfTerms).
funmap(_,[],[]).
funmap(F,[A|AT],[T|R]):- T=..[F,A], funmap(F,AT,R).



%10. applylist(L)

applylist([]).
applylist([H|T]):- H, applylist(T).
