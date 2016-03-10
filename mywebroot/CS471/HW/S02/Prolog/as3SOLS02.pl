/*
        CS471 - Programming Languages
        Section: <YOUR Section number>
        Assignment #<number> due: <DATE>
        Author: <LastName>, <FirstName> (<EMail>)
        Date: <DATE>
*/

%1. pair(X,Y,P)

pair(X,Y,(X,Y)).


%2a. averIT(+X,+Y,?A)

averIT(X,Y,A):- A is (X+Y)/2.

%2b. averIT((+X,+Y),?A)

averIT((X,Y),A):- A is (X+Y)/2.



%2c. averIT([+X,+Y],?A)
averIT([X,Y],A):- A is (X+Y)/2.

%3. secondE(Lst1,Lst2)

secondE([_,S|_],[_,S|_]). 


%4. maxList(Max,+Lst).

maxList(M,[M]).
maxList(M,[H|T]):- maxList(Mxt,T), M is max(Mxt,H). 



%5. lenList(LstofLsts, Len)

lenList([],0).
lenList([H|T],L):- lenList(T,Lxt), length(H,Lh), L is Lxt + Lh.


%6. sameLen(Lst1ofLsts, Lst2ofLsts).
sameLen(Lst1,Lst2):- lenList(Lst1,Len1),lenList(Lst2,Len2),Len1=Len2.



%7. zip(Z,X,Y)

zip(zip(X,Y),X,Y).



%8. zipList(Lst1,Lst2,ZLst).

zipList([],_,[]).
zipList(_,[],[]).
zipList([H1|T1],[H2|T2],[(H1,H2)|P]):-zipList(T1,T2,P).


 
%9. predList(LstofLst,LstofPred).

predList([Hlst|Tlst],[Hpred|Tpred]):- Hpred =.. Hlst, predList(Tlst,Tpred).

predList([],[]).



%10.applylist(Lst).

applylist([]).
applylist([H|T]):-H,applyList(T).

 


