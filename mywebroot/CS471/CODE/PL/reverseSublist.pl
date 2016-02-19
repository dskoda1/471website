subList1(S,L):-append(H,S,P),append(P,T,L). 
subList2(S,L):-append(P,T,L),append(H,S,P).
subList3(S,L):-append(S,ST,T),append(H,T,L).
subList4(S,L):-append(H,T,L),append(S,ST,T).


% question 3
myreverse([], []).
myreverse([Head|Tail],Result) :- myreverse(Tail, ReversedTail),
	                         append(ReversedTail,[Head],Result).


%q3 more efficent...

% reverse(List,ReversedList) <- ReversedList is List reversed.
% Iterative version.

reverseE(List,RList) :- reverseE(List,[],RList).



