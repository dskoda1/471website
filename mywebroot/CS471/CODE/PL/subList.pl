subList1(S,L):-append(H,S,P),append(P,T,L). 
subList2(S,L):-append(P,T,L),append(H,S,P).
subList3(S,L):-append(S,ST,T),append(H,T,L).
subList4(S,L):-append(H,T,L),append(S,ST,T).


