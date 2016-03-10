/* Fall 2003 Homework 3 */
/* The purpose is this assignment is
   1) reenforce recursive programming
   2) reenforce the use of the list data structure in Prolog
   3) use of pattern recognition in programming

   This assignment is not intended to be hard, however many will need
   time to absorb how easy it really is.  Most of the code need only be
   two lines and maximum number of lines is at MOST 3 lines.
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




/* 2: Write a predicate, left(E,L), which succeeds only if E is the left
      element of the of a tuple L with arity 2. i.e.
   
      ?- left(e,(e,5)).
      yes
      ?- left(e,x(e,e,e)).
      no
      ?- left(e,(5,e)).
      no
  */



/* 3:  Define the relation
          zip(Z,X,Y).
         were Z is unified with zip(X,Y)
	 */
	 


/* 4: Write a predicate, "first(F,L)" that succeeds if F is the first element 
      in list L.
*/



/* 5: Write a predicate "end(E,L)" that succeeds if E is the last element 
      in the list.
*/




/* 6: Write a procedure maxList(-Max,+List), where Max is the
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



/* 7: Below is a recursive technique for computing the square of a number 
      using addition.
        square(x)= x+x + square(x-1)-1 for x > 0
        square(x) = x for x = 0 
      
      Write a recursive program in prolog using this algorithm.
*/





/* 8: Define the "prefix" predicate so that "prefix(X,Y)" says that 
      X is a list that is a prefix of Y.  That is, each element of X 
      unifies with the corresponding element of Y, but Y may contain 
      additional elements after that.  Check that your predicate works 
      when X is uninstantiated: given a query like "prefix(X,[1,2,3]), it 
      should find all the prefixes of the list [1,2,3].
*/




/* 9: Write a predicate ordered(L) that succeeds if and only if the 
      list of numbers, L is in non-decreasing order --each element is 
      less than or equal to the next.
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











