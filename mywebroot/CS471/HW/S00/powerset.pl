%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    powerset(+Set,-PowerSet).
%    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

powerset([],[[]]).
powerset([X|T],P):- powerset(T,PT),addXtoPowersetOfPT(X,PT,P).

addXtoPowersetOfPT(X,[],[]).
addXtoPowersetOfPT(X,[Set|ST],[[X|Set],Set|PT]):- addXtoPowersetOfPT(X,ST,PT).
