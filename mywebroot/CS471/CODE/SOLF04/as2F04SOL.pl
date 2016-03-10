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

 */ 

/* 1 Write a Prolog representation of the directed graph found at
     http://bingweb.binghamton.edu/~head/CS471/HW/hw2F04.html
     (See Chapter 1 of Lu and Mead for how to represent directed graphs).
*/

edge(a,b).
edge(a,d).
edge(b,c).
edge(e,a).
edge(f,d).
edge(f,c).
edge(d,e).


/* 2 Write Prolog rule(clause) that succeeds if there is a path of at least
     length 2 including the edge (use exercise 1's graph).
 */

pathLen2(edge(X,Y)) :-edge(X,Y),edge(Y,Z).
pathLen2(edge(X,Y)) :-edge(Z,X),edge(X,Y).


/* 3 Write a set of clauses, path(X,Y), which succeeds if there is a
     path from X to Y. 
 */
/* answer in assigned tutorial.  */

/* 4 Write a Prolog rule(clause) which convert the directed graph above to an
     undirected graph.  For example both queries will be successful.
    ?- edge(a,b).
    ?- edge(b,a).
 */


/* 5 point(X,Y) is the structure which represents a point.  Write a fact
     "origin" which succeeds if both X and Y are zero.
    i.e. 
      ?- origin(P).
    succeeds if P is a point with x = 0 and y = 0.
 */

origin(point(0,0)).

/* 6 Define a relation "inside(p,r)" which is true if and only if
     point p lies inside a circle or radius r.
     This relation can be defined as:
       inside(point(x,y),r) if and only if x^2 + y^2 < r^2 
 */


inside(point(X,Y),R) :- R2 is R*R, S is X*X + Y*Y, S<R2.

/* 7 The ternary relation "collinear(p1,p2,p3)", is true if and only if
      p1, p2, and p3 lie on a straight line.  One definition is as follows:
      collinear(point(x1,y1), point(x2,y2), point(x3, y3)) 
        if and only if
             (x1-x2)(y2-y3) equals (y1-y2)(x2-x3)
 */

collinear(point(X1,Y1),point(X2,Y2),point(X3,Y3)):-
	C is (X1-X2)*(Y2-Y3),
	C is (Y1-Y2)*(X2-X3).

/* 8: Write a predicate such that the query,
         ordered(L),
       succeeds if and only if the 
      list of numbers, L, is in non-decreasing order --each element is 
      greater than or equal to the next.  Will your code work with 
      Strings?

      Answer can have the addition base case "ordered([])." 
 */
  
order([H1,H2|T]):-H1 > H2, order([H2|T]).
order([H]).
order([]).




/* 9: Use the ideas in problem 8, to write a program
      such that the query orderedAtoms(L) 
      succeeds if and only if the list of atoms, L, is in 
      non-decreasing order --each element is greater than (lexical order) 
      or equal to the next.   
      Solution can have an addition base case "orderedAtom([])."

 */


orderAtom([H1,H2|T]):-H1 @> H2, order([H2|T]).
orderAtom([H]).
orderAtom([]).


/* 10: Define the "prefix" predicate so that "prefix(X,Y)" says that 
      X is a list that is a prefix of Y.  That is, each element of X 
      unifies with the corresponding element of Y, but Y may contain 
      additional elements after that.  Check that your predicate works 
      when X is uninstantiated: given a query like "prefix(X,[1,2,3]), it 
      should find all the prefixes of the list [1,2,3].
 */

prefix([],_).
prefix([H|P],[H|T]):- prefix(P,T).



/* 11: Use the ideas from problem 8 to write a program, 
       such that the query orderedLocation(Lst, Loc) 
       always succeeds.  If the Lst, a list of numbers, is ordered in 
       non-increasing order then Loc must unify with the atom 'ordered'. 
       If the Lst is not ordered then Loc will unify with the first 
       number that breaks the "rule".
 */

orderedLocation([H1,H2|T], Loc):- 
	H1 > H2,  
	orderedLocation([H2|T],Loc).
orderedLocation([H1,H2|T], H2):- 
	H1 < H2.
orderedLocation([], ordered).
orderedLocation([X], ordered).


/* 12: Program exercise 1.1 page 30 in prolog. i.e
       
       ?- numDigit(100,N).
*/ 

numDigit(X,1):- X < 10.
numDigit(X,N):- 
	Xnx is X /10,
	numDigit(Xnx,Nx),
	N is Nx + 1.



/* 13: Ackermann's functions as defined in written question 4.
*/

ack(0,N,A):- A is 2 *N.
ack(M,0,0):- M>0 .
ack(M,1,2):- M>0.
ack(M,N,A) :- M1 is M -1, N1 is N-1, ack(M,N1,An), ack(M1,An,A).




/* 14  Define a predicate, listOfTerms(ListOfArgs,Name, ListOfResults), 
     where each term in the ListOfResults is a term with one argument 
     from the ListOfResults and the functor name is the Name.
            Type "help" in Swipl
               help(functor).
               help(=..)
               help(arg).
            for information on the built-in predicates functor,=.., arg.

            ?- listOfTerms([a,b,23,4],foo,T).
          T = [foo(a), foo(b), foo(23), foo(4)]
          Yes
 */

% two possible solutions

listOfTerms([],N,[]).
listOfTerms([H|T],N,[F|TF]):- functor(F,N,1),
                         arg(1,F,H),
			 listOfTerms(T,N,TF).

listOf([],_,[]).
listOf([H|T],N,[F|TF]):- F=..[N,H], listOf(T,N,TF).
