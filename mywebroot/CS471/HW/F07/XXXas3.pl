/*
        CS471 - Programming Languages
        Section: <YOUR Section number>
        Assignment #<number> due: <DATE>
        Author: <LastName>, <FirstName> (<EMail>)
        Date: <DATE>
 */

/* Purpose:
 * to practice writing relations in Prolog
 * to practice letting Prolog solve queries 
 *            by writing just facts
 *            by writing clauses
 * to understand unification, the "is" predicate
 * to reenforce recursive programming
 * to reenforce the use of the list data structure in Prolog
 * to reenforce the difference between atoms and strings
 
   This assignment is not intended to be hard, however many will need
   time to absorb how easy it really is.  Most of the code need only be
   two lines and maximum number of lines is at MOST 3 lines.
   
   Example of using help in Swipl.
   At the prompt type:
           ?- help(functor).
           ?- help(=..)
           ?- help(arg).
 */ 

/* 1: Page 5, problem 1 in "Prolog: A Tutorial Introduction" By Lu & Mead.
   Write a prolog program that describes the graph stucture in the tutorial.
   Also include a predicate, len3(NodeA,NodeB), which defined 'path of length 3'
   relation.  You should use tedge in your solution.
   e.g.
     ?- len3(a,d).
     Yes

*/




/* 2: Write a set of clauses, path(X,Y), which succeeds if there is a
     path from X to Y. 
 */


/* 3: Write a Prolog rule(clause) which convert the directed graph above to an
     undirected graph.  For example both queries will be successful.
    ?- udirectededge(a,b).
    ?- udirectededge(b,a).
 */


/* 4: point(X,Y) is the structure which represents a point.  Write a fact
     "origin" which succeeds if both X and Y are zero.
    e.g. 
      ?- origin(P).
    succeeds if P is a point with x = 0 and y = 0.
 */



/* 5: Define a relation "inside(p,r)" which is true if and only if
     point p lies inside a circle or radius r.
     This relation can be defined as:
       inside(point(x,y),r) if and only if x^2 + y^2 < r^2 
 */



/* 6: The ternary relation "collinear(p1,p2,p3)", is true if and only if
      p1, p2, and p3 lie on a straight line.  One definition is as follows:
      collinear(point(x1,y1), point(x2,y2), point(x3, y3)) 
        if and only if
             (x1-x2)(y2-y3) equals (y1-y2)(x2-x3)        
      e.g.
      ?- collinear(point(1,1),point(2,2),point(3,3)).
      Yes
 */




/* 7: Define the "prefix" predicate so that "prefix(X,Y)" says that 
      X is a list that is a prefix of Y.  That is, each element of X 
      unifies with the corresponding element of Y, but Y may contain 
      additional elements after that.  Check that your predicate works 
      when X is uninstantiated: given a query like "prefix(X,[1,2,3]), it 
      should find all the prefixes of the list [1,2,3] (after each result
      use ":" instead of return).
      e.g.
       ?- prefix(X,[a,b,c]).
       X = [] ;
       X = [a] ;
       X = [a, b] ;
       X = [a, b, c] ;
       No
*/




/* 8: Define the "firstLast(List1,List2)" predicate, that succeed if 
      the first element in List1 is the last element of List2.
      You should use recursion for this solution.
      e.g.
        ?- firstLast([1,2,3],[a,b,1]).
        Yes
        ?- firstLast([1,2,3],[a,b]).
        No

*/

    

/* 9: Convert the "power" program given in exercise 1 homework 1.
       e.g.
       ?- power(2,5,R).
       R = 32 
       Yes

*/ 







/* 10: Ackermann's functions as defined in the first assignment.
*/




/* 11:Define a predicate, listOfTerms(ListOfArgs,Name, ListOfResults), 
     where each term in the ListOfResults is a term with one argument 
     from the ListOfResults and the functor name is the Name.

          ?- listOfTerms([a,b,23,4],foo,T).
          T = [foo(a), foo(b), foo(23), foo(4)]
          Yes
     (see page 577 in Scott)
 */


