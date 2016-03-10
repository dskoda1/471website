/*
        CS471 - Programming Languages
        Section: <YOUR Section number>
        Assignment #<number> due: <DATE>
        Author: <LastName>, <FirstName> (<EMail>)
        Date: <DATE>
*/


%1 Ackermann's function as defined in the written part of the homework

ack(0,N,A):- A is 2 *N.
ack(M,0,0):- M>0 .
ack(M,1,2):- M>0.
ack(M,N,A) :- M1 is M -1, N1 is N-1, ack(M,N1,An), ack(M1,An,A).



%2  --- difference lists slide 57-- Can't do until discussed in class.

append3DL(A-B, B-C, C-D, A-D).



%3 concatList(ListOfLists,Concat) problems 3-7 info starts in Slide 48
/*  Concatentate all lists in ListOfLists (one level only) together.
   ?- concatList([[1],[a,b,c],[100,91]],C).
   C = [1, a, b, c, 100, 91]
   Yes
   ?- concatList([[1],[a,b,c],[],[100,91]],C).
   C = [1, a, b, c, 100, 91]
   Yes
   ?- concatList([[1],[a,[b],c],[],[100,91]],C).
   C = [1, a, [b], c, 100, 91]
   Yes
   ?- concatList(C,[100, 91, a, b, c, 1]).
   C = [[100, 91, a, b, c, 1]] ;
   C = [[100, 91, a, b, c, 1], []]
   Yes

*/

concatList([],[]).
concatList([H|T],C):-concatList(T,CT),append(H,CT,C).


%4 concatListR(ListOfLists, ConcatListsInreverseOrder).
/*  Concatenate all lists in ListOfLists in reverse order keeping
    the elements in each lists in the ListOfList in the same order.
    i.e.
    ?- concatListR([[1],[a,b,c],[100,91]],C).
    C = [100, 91, a, b, c, 1]
    Yes
    ?- concatListR([[1],[a,[b],c],[100,91]],C).
    C = [100, 91, a, [b], c, 1]
    Yes
    ?- concatListR([[1],[a,b,c],[],[100,91]],C).
    C = [100, 91, a, b, c, 1]
    Yes
    ?- concatListR(C,[100, 91, a, b, c, 1]).
    C = [[100, 91, a, b, c, 1]] ;
    C = [[100, 91, a, b, c, 1], []] ;
    C = [[100, 91, a, b, c, 1], [], []]
    Yes
 
    Hint order of subgoals is important.
*/

concatListR([],[]).
concatListR([H|T],C):-append(CT,H,C),concatListR(T,CT).

/* wont work...
 concatListR2([],[]).
 concatListR2([H|T],C):-concatListR2(T,CT),append(Ct,H,C).
*/



%5. concatRtoL(L,S).
/* Given a list of lists, L, S is a list of accumulated appends of 
   lists in L such that first list in S is all lists in L
   appended together in the order they appear in L, 
   the second number in S is all lists in L appended in order together  
   except the first list in L, etc.
   For example:
   ?- concatRtoL([[1],[a,b,c],[100,9]],C).
   C = [[1, a, b, c, 100, 9], [a, b, c, 100, 9], [100, 9]]
   Yes
   ?- concatRtoL([[1],[a,b,c],[],[100,9]],C).
   C = [[1, a, b, c, 100, 9], [a, b, c, 100, 9], [100, 9], [100, 9]]
   Yes
   ?- concatRtoL([],C).
   No
   ?- concatRtoL([[]],C).
   C = [[]]
   Yes
   ?- concatRtoL([[1,2],[a,[b,c]],[100,9]],C).
   C = [[1, 2, a, [b, c], 100, 9], [a, [b, c], 100, 9], [100, 9]]
   Yes
  

*/ 


concatRtoL([X],[X]).
concatRtoL([H|T],[H1,H2|TS]):-  concatRtoL(T,[H2|TS]),append(H,H2,H1).

concatRtoLHui([A],[A]).concatRtoLHui([A|As],[B|Bs]):-concatList([A|As],B),concatRtoLHui(As,Bs).


%6. concatLtoR(L,S).  
/* Is simular to concatRtoL(+L,?S), except that the accumulated appends
   are left to right. (Note to get 
      C = [[1], [a, b, c, 1], [a, b, c, 1], [100, 9, a, b, c, 1]]
   instead of 
     C = [[1], [a, b, c, 1], [a, b, c, 1], [100, 9, a, b, c|...]]
   type "w" right after
    C = [[1], [a, b, c, 1], [a, b, c, 1], [100, 9, a, b, c|...]] w
   appears as a result of your query.
   You will see: 
    C = [[1], [a, b, c, 1], [a, b, c, 1], [100, 9, a, b, c|...]] [write]
    C = [[1], [a, b, c, 1], [a, b, c, 1], [100, 9, a, b, c, 1]]
  )

  ?- concatLtoR([[1],[a,b,c],[100,9]],C).
  C = [[1], [a, b, c, 1], [100, 9, a, b, c, 1]]
  Yes
  ?- concatLtoR([[1],[a,b,c],[],[100,9]],C).  
  C = [[1], [a, b, c, 1], [a, b, c, 1], [100, 9, a, b, c, 1]]
  Yes
  ?- concatLtoR(L,[[1], [a, b, c, 1], [100, 9, a, b, c, 1]]).  %% Hui's go into loop
  L = [[1], [a, b, c], [100, 9]]
  Yes
  ?- concatLtoR([[]],C).
  C = [[]]
  Yes
  ?- concatLtoR([],C).
  No
  ?- concatLtoR([[1,2],[a,[b,c]],[100,9]],C).
  C = [[1, 2], [a, [b, c], 1, 2], [100, 9, a, [b, c], 1, 2]]
  Yes

*/

concatLtoR([H],[H]).
concatLtoR([H,H1|T],[H|TS]):- append(H1,H, Replace), concatLtoR([Replace|T],TS).
concatLtoRstud([X],[X]).
%% more work... ...
concatLtoRHui([A],[A]).concatLtoRHui(A,B):-
	append(As,[A1],A), 
	concatListR(A,B1),
	concatLtoRHui(As,Bs),
	append(Bs,[B1],B).

%7. concatALL(+NestedLists, -C).
/* Concatenate all the elements in the NestedLists 
   into a list C of only single terms.
   i.e.
   ?- concatALL([[1],[a,b,c],[],[100,91]],C).
   C = [1, a, b, c, 100, 91]
   Yes
   ?- concatALL([[1],[a,[b,[c]],[]], [[[100],91],x] ],C). 
   C = [1, a, b, c, 100, 91, x]
   Yes


  HINT: order of rules is extremely important.
*/


concatALL([],[]).
concatALL([H|T],C):-  concatALL(H,CH),
	              concatALL(T,CT),
                      append(CH,CT,C).
concatALL(X,[X]).


%8: executeList(EList) 
/*   Given a list of predicates, executeList(Elist) succeeds only if
      each of the predicates in the list succeeds. Note: the scope
      of variables names is the entire list. You can apply each predicate
      at the prompt to see how they work.  Make up your own.

   i.e.
    ?- executeList([=(A,99),is(B,+(5,94)),C=abc,C @< abcd,A=B]).
    A = 99 
    B = 99
    C = abc
    Yes
    ?- executeList([=(A,99),is(B,+(5,95)),C=abc,C @< abcd,A=B]).
    No
    ?- executeList([=(A,99),is(B,+(5,95)),write(B),C=abc,C @< abcd,A=B]).
   100
   No

*/

executeList([H|T]):-H,executeList(T).
executeList([]).




