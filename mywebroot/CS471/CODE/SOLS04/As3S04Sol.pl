%1.
average(X,Y,A):- A is (X+Y)/2.
%2.
pairwiseAverage([],_,[]).
pairwiseAverage([X|Xs],Y,[A|As]):- 
    average(X,Y,A), 
    pairwiseAverage(Xs,Y,As).
%3.
% -3 if no pattern matching.

flip(pair(A,B),pair(B,A)).

%4.  zip(Z,Xs,Ys).
% -1 point if missing a base case
% -2 points if no pattern matching.
zip([],[],_).
zip([],_,[]).
zip([(X,Y)|Zs],[X|Xs],[Y|Ys]):- zip(Zs,Xs,Ys).

%5. endSum(S,L).

endSum(S,[_|T]):-endSum(S,T).
endSum(S,[(X,Y)]) :- S is X + Y.

%6.  minMaxList(-(Min,Max),+List)

minMaxList((V,V),[V]).
minMaxList((Min,Max),[V|Vs]):- minMaxList((MinVs,MaxVs),Vs),
	Min is min(MinVs,V),
	Max is max(MaxVs,V).


%7.  -2 points for no pattern matching 
has2([2|T]).
has2([_|T]):-has2(T).


/* 8: Define the "prefix" predicate so that "prefix(X,Y)" says that 
      X is a list that is a prefix of Y.  That is, each element of X 
      unifies with the corresponding element of Y, but Y may contain 
      additional elements after that.  Check that your predicate works 
      when X is uninstantiated: given a query like "prefix(X,[1,2,3]), it 
      should find all the prefixes of the list [1,2,3].
*/

prefix([],L).
prefix([H|T],[H|LT]):-prefix(T,LT).


/* 9: Write a predicate ordered(L) that succeeds if and only if the 
      list of numbers, L is in non-increasing order --each element is 
      less than or equal to the next.

Answer can have the addition base case "ordered([])." 
*/

ordered([_]).
ordered([F,S|T]):- F >= S, ordered([S|T]).

/* 10: Define a predicate, listOfFacts(Functor,ListOfArgs,ListOfTerms), where
      each term in the ListOfTerms is a term with
      one argument from the ListOfTerms and the name is the functor.
      Type "help" in swipl
         help(functor).
         help(=..)
         help(arg).
      for information on the built-in predicates functor,=.., arg.

      ?- listOfFacts(foo,[a,b,23,4],T).
         T = [foo(a), foo(b), foo(23), foo(4)]
	 Yes

*/
listOfFacts(_,[],[]).
listOfFacts(N,[H|T],[F|TF]):- functor(F,N,1),
                         arg(1,F,H),
			 listOfFacts(N,T,TF).

listOf(_,[],[]).
listOf(N,[H|T],[F|TF]):- F=..[N,H], listOf(N,T,TF).


