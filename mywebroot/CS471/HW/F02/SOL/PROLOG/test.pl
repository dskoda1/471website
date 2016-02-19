/*
E => (EBE)|(UE)|C|V.
B => and| or| implies| iff.
U => not.
C=> false|true.
V=> p|q|r.
*/

partition(List,L1,L2):-append(L1,L2,List),length(L1,A),length(L2,B),B=<A.
part(Lst,L1,L2):-length(Lst,Len),Len1 is Len//2,
	Len2 is Len - Len1,
	length(L1,Len1),
	length(L2,Len2),
	append(L1,L2,Lst).




partition2([],[],[]).
partition2([H|T],{H|T2],L3):-partition2(T,L3,T2).

fill(Len,E):-length(Lst,Len),append(Lst,[E],[E|Lst]).


