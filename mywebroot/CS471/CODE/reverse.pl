% question 1
even(X):- Y is X mod 2, Y=0.


% question 2.
sublist(L,S):- append(_,L2,L),append(S,_,L2).


% question 3
myreverse([], []).
myreverse([Head|Tail],Result) :- myreverse(Tail, ReversedTail),
	                         append(ReversedTail,[Head],Result).


%q3 more efficent...

% reverse(List,ReversedList) <- ReversedList is List reversed.
% Iterative version.

reverseE(List,RList) :- reverseE(List,[],RList).

% length(SufixList,LengthofPrefix,LengthofList) <- 
%         LengthofList is LengthofPrefix + length of SufixList

reverseE([],RL,RL).
reverseE([Element|List],RevPrefix,RL) :- 
		reverseE(List,[Element|RevPrefix],RL).