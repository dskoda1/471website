/* Fall 2003 Homework 3 */
/* The purpose is this assignment is
   1) reenforce recursive programming
   2) reenforce the use of the list data structure in Prolog
   3) use of pattern recognition in programming

   This assignment is not intended to be hard, however many will need
   time to absorb how easy it really is.  Most of the code need only be
   two lines and maximum number of lines is at MOST 4 lines.
*/

/* 1. Write a procedure, addValue(A,L,R),
      such that every element in R is A more than the corresponding
      element in L. i.e.
      ?-addValue(3,[1,2,4],X).
      X = [4,5,7]
      yes
      ?- addValue(3,X,[3,4]).
      You will get an error...Arguments are not sufficiently instantiated.

*/

addValue(_,[],[]).
addValue(A,[H|T],[RH|RT]):- RH is A + H, addValue(A,T,RT).


/* 2: Write a predicate, left(E,L), which succeeds only if E is the left
      element of the of a tuple L . i.e.
  */

left(E,(E,R)).

/* 3:  Define the relation
          zip(Z,X,Y).
         were Z is unified with zip(X,Y)
	 */
	 
zip(X,Y,zip(X,Y)).

/* 4:   Define a predicate zipLists(L,M,P), where it succeeds if  P is a list of tuples, 
	the first element is from the L and the second is from the corresponding element 
        in list M.

      ?- zipLists([1,5,9],[a,5,z],P).
      P = [zip(1,a),zip(5,5),zip(9,z)]
      yes
      ?- zipLists([1,5],[a,b,c],P).
      P = [zip(1,a),zip(5,b)].
      yes
      ?- zipLists([1,5,99],[a,c],P).
      P = [zip(1,a),zip(5,c)]
*/ 

zipList([],[],[]).  //Not necessary  
zipList([],_,[]).  
zipList(_,[],[]).
zipList([H|T],[N|M],[zip(H,N)|Zt]):-zipList(T,M,Zt).



/* 5. Write a procedure maxList(-Max,+List), where Max is the
      maximum value found in List. Assume list has at least one number.
      You might want to use the built-in predicate, max(+expr,+expr).
   Some experiments:
      ?- X is max(4,6).
      ?- X is max(4*3,10*30).
   Your results should be:
      ?-  maxList(Max,[1,5,33,2,6]).
      Max = 33
      yes

*/

maxList(M,[M]).
maxList(M,[H|T]):- maxList(MR,T), M is max(H,MR).

/* 6: Below is a recursive technique for computing the square of a number using addition.
       square(x)= x+x + square(x-1)-1 for x > 0
       square(x) = x for x = 0 
      
      Write a recursive program in prolog using this algorithm.
*/

square(0,0).
square(N,S):- N1 is N-1, square(N1,S1), S is N+N+S1-1.



/* 7: Define the "prefix" predicate so that "prefix(X,Y)" says that X is a list that
      is a prefix of Y.  That is, each element of X unifies with the corresponding element
      of Y, but Y may contain additional elements after that.  Check that your
      predicate works when X is uninstantiated: given a query like "prefix(X,[1,2,3]), it 
      should find all the prefixes of the list [1,2,3].
*/

prefix([],L).
prefix([H|T],[H|LT]):-prefix(T,LT).


/* 8: Write a predicate ordered(L) that succeeds if and only if the list of numbers, L
      is in non-decreasing order --each element is less than or equal to the next.
*/



/* 9: Define a predicate, funmap(Functor,ListOfArgs,ListOfTerms), where
      each term in the ListOfTerms is a term with
      one argument from the ListOfTerms and the name is the functor.
      Type "help" in swipl
         help(functor).
         help(=..)
         help(arg).
      for information on the built-in predicates functor,=.., arg.

      ?- funmap(foo,[a,b,23,4],T).
         T = [foo(a), foo(b), foo(23), foo(4)]
	 Yes

*/
funmap(_,[],[]).
funmap(N,[H|T],[F|TF]):- functor(F,N,1),
                         arg(1,F,H),
			 funmap(N,T,TF).

/* 10: Given a list of predicates, applylist(L) succeeds only if
      each of the predicates in the list succeeds. Note: the scope
      of variables names is the entire list. You can apply each predicate
      at the prompt to see how they work.  Make up your own.

   i.e.
    ?- applylist([=(A,5),is(B,+(4,5)),C is max(5,2),A=C]).
    A = 5
    B = 9
    C = 5
    yes
    ?- applylist([=(A,5),is(B,+(4,5)),C is max(9,2),A=C]).
    no
  */

applylist([H|T]):-H,applylist(T).
applylist([]).












