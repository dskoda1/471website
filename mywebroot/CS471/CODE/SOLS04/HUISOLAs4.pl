/*
        CS471 - Programming Languages
        Section: <YOUR Section number>
        Assignment #<number> due: <DATE>
        Author: <LastName>, <FirstName> (<EMail>)
        Date: <DATE>
*/
/* Purpose:  Really understand recursion
             Use append (problems 3-7 use append)
             Converting functions to a prolog relation
             Using unification 
             See dynamic execution
*/


%1 Ackermann's function as defined in the written part of this homework
/*
ack( m,n ) = 2n     if m = 0 
ack( m,n ) =  0     if m >=1 and n = 0  
ack( m,n ) = 2     if m >=1 and n = 1  
ack( m,n ) = ack( m-1, ack( m, n-1 ) )     if m >=1 and n >=2  
*/

ack( 0,N,M ):-M is N + N. 
ack( M,0,0 ):-M >=1.  
ack( M,1,2 ):-M >=1.  
ack( M,N,X):-M >=1,N >=2, M1 is M-1, N1 is N-1, ack( M, N1,Y), ack( M1, Y,X).    


%2 (easy- ONE relation)
/* Define a predicate append3DL  that concatenates three difference lists:

    ?- append3DL( [z,y|A] - A, [x,w | B] -B, [u,v | C] - C, What).
  What = [z, y, x, w, u, v | _n] - _n
  yes
*/ 
appendDL(L-M, M-N, L-N).

append3DL(L-M, M-N, N-O, L-0).

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
concatList([H],H).
concatList([A|T],L):-concatList(T,L1),append(A, L1, L).



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
concatListR([H],H).
concatListR([A|T],L):-concatListR(T,L1),append(L1, A, L).




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
concatRtoL([[]],[[]]).
concatRtoL([A],[A]).
concatRtoL([A|As],[B|Bs]):-concatList([A|As],B),concatRtoL(As,Bs).


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
  ?- concatLtoR(L,[[1], [a, b, c, 1], [100, 9, a, b, c, 1]]).
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


concatLtoR([[]],[[]]).
concatLtoR([A],[A]).
concatLtoR(A,B):-append(As,[A1],A), concatListR(A,B1),concatLtoR(As,Bs),append(Bs,[B1],B).

conc(A,As,A1):-append(As,[A1],A).

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

concatALL(A,B):-flatten(A,B).




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
executeList([]).
executeList([A|As]):- call(A),executeList(As).



subList1(S,L):-append(P,T,L),append(H,S,P).
subList2(S,L):-append(H,S,P),append(P,T,L). 
subList3(S,L):-append(S,ST,T),append(H,T,L).
subList4(S,L):-append(H,T,L),append(S,ST,T). 


