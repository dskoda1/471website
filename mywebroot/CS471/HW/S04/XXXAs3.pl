/* Spring 2004 Homework 3 */
/* The purpose is this assignment is
   1) reenforce recursive programming
   2) reenforce the use of the list data structure in Prolog
   3) use of pattern recognition in programming

   This assignment is not intended to be hard, however many students will need
   time to absorb how easy it really is.  Most of the code need only be
   two lines and maximum number of lines is at MOST 3 lines.
*/

/* 1. Define a prolog program (rule), average(X,Y,A),

      such that A is the average of X and Y.  i.e.
      ?- average(3,4,R).
      R = 3.5
      Yes
      ?- average(-3,0,A).
      A = -1.5
      Yes
      ?- average(-3,0,-1.5).
      Yes
      ?- average(-3,X,-1.5).
      ERROR: Arguments are not sufficiently instantiated
      ^  Exception: (8) -1.5 is (-3+_G162)/2 ? creep

*/


/* 2. Define a prolog program pairwiseAverage(X,Y,A)
      such that every element in A is the average of Y and the corresponding
      elements of X.  Use average (defined above) in your solution.i.e.
      ?- pairwiseAverage([-1,4.5,9.2], 5.5, A).
      A = [2.25, 5, 7.35]
      Yes
      ?- pairwiseAverage([1,0,9], 5, A).
      A = [3, 2.5, 7]
      Yes
*/




/* 3: Write a predicate, flip(Flip,Flop), which succeeds only if Flop has the 
      first argument last and the last argument first of the functor "pair".
      Your code should use only pattern matching for full credit.
      i.e.
      ?- flip(pair(3,abc),pair(abc,3)).
      Yes
      ?- flip(pair(3,[1,2]),X).
      X = pair([1, 2], 3)
      Yes
      ?- flip(F,pair(pair(1,2),3)).
      F = pair(3, pair(1, 2))
      Yes
      ?- flip((1,2),(2,1)).
      No
  */



/* 4:  Define the relation
          zip(Z,Xs,Ys).
       were Z is unified with a list of tuples (X,Y) where X and Y are corresponding
       elements of Xs and Ys.

       ?- zip(Z,[1,2,3],[a,b,c,d]).
       Z = [ (1, a), (2, b), (3, c)]
       Yes
       ?- zip(Z,[a,b,c,d],[1,2,3]).
       Z = [ (a, 1), (b, 2), (c, 3)]
       Yes
       ?- zip(Z,[a,b,c,d],X).
       Z = []
       X = [] ;
       Z = [ (a, _G258)]
       X = [_G258]
      Yes
  
    */
	 


/* 5: Write a predicate, "endSum(S,L)" that succeeds if the last pair 
      in list L has the sum S. i.e.

   ?- endSum(4,[(2,2),(4,5),(2,2)]).
   Yes
   ?- endSum(4,[(2,2),(4,5),(2,3)]).
   No

*/





/* 6: Write a procedure minMAxList(-(Min,Max),+List), where Max is the
      maximum value found in List and Min is the minimum value in the List. 
      Assume list has at least one number.
      You might want to use the built-in predicate, max(+expr,+expr) and min(+expr,+expr).
   Some experiments:
      ?- X is max(4,6).
      ?- X is max(4*3,10*30).
   Your results should be:
      ?- minMaxList(V,[-3,3000,29,100,-5]).
      V = -5, 3000
      Yes
      ?- minMaxList(V,[1,3,4]).
      V = 1, 4
      Yes
*/



/* 7: Define a predicate that succeeds if the number 2 is in the list.

*/





/* 8: Define the "prefix" predicate so that "prefix(X,Y)" says that 
      X is a list that is a prefix of Y.  That is, each element of X 
      unifies with the corresponding element of Y, but Y may contain 
      additional elements after that.  Check that your predicate works 
      when X is uninstantiated: given a query like "prefix(X,[1,2,3]), it 
      should find all the prefixes of the list [1,2,3].

     i.e.
     ?- prefix(P,[x,y,z]).
     P = [] ; 
     P = [x] ;
     P = [x, y] ;
     P = [x, y, z] ; 
     No

*/




/* 9: Write a predicate ordered(L) that succeeds if and only if the 
      list of numbers, L is in non-increasing order --each element is 
      greater than or equal to the next.
*/



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



