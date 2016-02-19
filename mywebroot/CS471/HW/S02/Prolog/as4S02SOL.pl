/*
        CS471 - Programming Languages
        Section: <YOUR Section number>
        Assignment #<number> due: <DATE>
        Author: <LastName>, <FirstName> (<EMail>)
        Date: <DATE>
*/


%1 deleteE(+E,+Lst1, -Lst2).
% This will only work if E and Lst1 are given.


deleteE(H,[H|T],R):- deleteE(H,T,R).
deleteE(H,[H2|T],[H2|R]):- deleteE(H,T,R).
deleteE(H,[],[]).



%2 bagToSet(Bag,Set).

bagToSet([],[]).
bagToSet([BH|BT],[BH|ST]):- deleteE(BH,BT,R), bagToSet(R,ST).


%  Thanks to Ming Tang

bagToSet2([X|[]],[X]).
bagToSet2([H|T],R) :- member(H,T), bagToSet2(T,R).
bagToSet2([H|T],[H|R]) :- bagToSet2(T,R).


%3 palindrome(List).

palindrome([]).
palindrome([_]).
palindrome(L):-append([First|Middle],[First],L),palindrome(Middle).



%4 myMerge(+Lst1, +Lst2, -Result).

myMerge([],Lst2,Lst2).
myMerge(Lst1,[],Lst1).
myMerge([H|T],[H2|T2],[H|R]):- H@<H2, myMerge(T,[H2|T2],R).
myMerge([H|T],[H2|T2],[H2|R]):- H2@<H, myMerge([H|T],T2,R).



%5 partition(+Lst, -Part1, -Part2).
partition([F,S],[F],[S]).
partition([F,S,Th],[F],[S,Th]).
partition([F,S|Tail],[F|T1],[S|T2]):- partition(Tail,T1,T2).


%6 mergesortX(+UnsortedLst, -Sorted).

mergesortX([],[]).
mergesortX([E],[E]).
mergesortX(UnSort, Sort):- partition(UnSort,L1,L2),
	mergesortX(L1,S1),
	mergesortX(L2,S2), 
	myMerge(S1,S2,Sort).

%7 mapcolor...Many possible solutions

adj(red,blue).
% adj(blue,red).  Can use instead of neighbor...
adj(red,pink).
% adj(pink,red).
adj(red,black).
% adj(black,red).
adj(blue,pink).
% adj(pink,blue).
adj(blue,black).
% adj(black,blue).
adj(pink,black).
% adj(black,pink).
neighbor(X,Y):- adj(X,Y).
neighbor(X,Y):- adj(Y,X).

% A can be a neighbor of D or not depending how you look at the map
mapcolor(A,B,C,D,E,F):-
	neighbor(A,B),
	neighbor(B,C),
	neighbor(B,D),
	neighbor(B,E),
	neighbor(C,D),
	neighbor(D,E),
	neighbor(D,F),
	neighbor(E,F).
    


%8 ack ...  easy

ack(0,N,R):- R is N + 1.
ack(M,0,R):- Mx is M -1, ack(Mx,1,R).
ack(M,N,R) :- Mx is M -1, Nx is N-1, ack(M,Nx,Rn), ack(Mx,Rn,R).











