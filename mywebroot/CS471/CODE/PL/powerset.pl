%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    powerset(+Set,-PowerSet).
%    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

powerset([],[[]]).
powerset([X|T],P):- powerset(T,PT),addXtoPowersetOfPT(X,PT,P).

addXtoPowersetOfPT(X,[],[]).
addXtoPowersetOfPT(X,[Set|ST],[[X|Set],Set|PT]):- addXtoPowersetOfPT(X,ST,PT).


% Good generator, but not tail-recursive
powersetA([],[[]]).
powersetA([H|T],PowerSet):-
   powersetA(T,PowerSetOfT), % generator (GOOD)

extend_pset(H,PowerSetOfT,PowerSet). % not tail-recursive
extend_pset(_,[],[]).
extend_pset(H,[List|MoreLists],[List,[H|List]|More]):-
        extend_pset(H,MoreLists,More).


% Bad generator, tail-recursive

powerset1([],[[]]).
powerset1([H|T],PowerSet):-
       extend_pset(H,PowerSetOfT,PowerSet), % generator (BAD)
powerset1(T,PowerSetOfT). % tail-recursive

% Good generator, tail-recursive
powerset2([],PowerSet,PowerSet).
powerset2([H|T],Acc,PowerSet):-
     extend_pset(H,Acc,Acc1), % generator (GOOD)
powerset2(T,Acc1,PowerSet). % tail-recursive
