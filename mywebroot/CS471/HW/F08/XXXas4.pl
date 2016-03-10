/*
        CS471 - Programming Languages
        Section: <YOUR Section number>
        Assignment #<number> due: <DATE>
        Author: <LastName>, <FirstName> (<EMail>)
        Date: <DATE>
 */

/* Purpose:
   * to reenforce search order.
   * to reenforce recursive programming
   * to reenforce the use of the list data structure in Prolog
	1) For some of the problems below you need only generate a correct
      result from the query without requesting alternative results. 
      You may use cuts but it is not required.   
 */


/* 1:(Variation From Learn Prolog NOW! exercise 3.2)
   Define a predicate equal_to/2 that takes two numerals in the
   notation that "we' introduced in this lecture (3.1.3(
  (http://www.coli.uni-saarland.de/~kris/learn-prolog-now/html/node27.html#subsec.l3.ex3)
  (i.e. 0, succ(0),succ(succ(0)) ...) as arguments and decides whether 
   the first one is equal to the second one. E.g:

    ?-  equal_to(succ(succ(0)),succ(succ(succ(0)))).
    No
    ?- equal_to(succ(succ(succ(0))),succ(succ(succ(0)))).
    Yes
  (2 clauses)
*/




%2:  : (From Learn Prolog NOW! exercise 3.3)
% Binary trees are trees where all internal nodes have exactly two
% children. The smallest binary trees consist of only one leaf node. We
% will represent leaf nodes as leaf(Label). For instance, leaf(3) and
% leaf(7) are leaf nodes, and therefore small binary trees. Given two
% binary trees B1 and B2 we can combine them into one binary tree using
% the predicate tree: tree(B1,B2). So, from the leaves leaf(1) and
% leaf(2) we can build the binary tree tree(leaf(1), leaf(2)). And from
% the binary trees tree(leaf(1), leaf(2)) and leaf(4) we can build the
% binary tree tree(tree(leaf(1), leaf(2)), leaf(4)).

% Now, define a predicate swap/2, which produces a mirror image of the
% binary tree that is its first argument. For example:
/****
    ?- swap(tree(tree(leaf(1), leaf(2)), leaf(4)),T).
    T = tree(leaf(4), tree(leaf(2), leaf(1))).
    yes
   (2 clauses)
   
  t1 and t2 are functors of trees.   
***/

t1( tree(leaf(4), tree(leaf(2), leaf(1)))).
t2( tree(leaf(-1), tree(tree(leaf(2),leaf(-3)), tree(leaf(5),leaf(4))))).


/* 3: Using the definition in problem 2 of a binary tree, construct a sum of 
      of the leaf values.   
     sumtree/2 should use a infix search to calculate the sum. e.g.

     ?- t2(T), sumtree(T,S).
     T = tree(leaf(-1), tree(tree(leaf(2), leaf(-3)), tree(leaf(5), leaf(4)))),
     S = 7
    
    (2 clauses)*/


/* 4: Using the definition of a binary tree in problem 2, construct the
      subtraction of the leaf values.
      minustree/2 should use an infix search to calculate the total. e.g.

      ?- t2(T), minustree(T,S).
      T = tree(leaf(-1), tree(tree(leaf(2), leaf(-3)), tree(leaf(5), leaf(4)))),
      S = -5
      
      (2 clauses)

*/



%5: 
% "Send more money" is a well-known puzzle. Each of the letters
% D,E,M,N,O,R,S and Y represents a different digit. Moreover, when each
% letter is mapped to its corresponding digit the equation SEND + MORE =
% MONEY holds. Below is a very naive . Since there are 8 letters to be
% solved, it simply explore the 10*9*...*3 mappings of letters to
% digits. 
% A little insight can simplify things. Clearly, SEND < 9999 and 
% MORE < 9999. Thus MONEY < 19998 and hence M = 1. 
% Now we have SEND + 1ORE = 1ONEY. Again SEND < 9999 
%  and now 1ORE < 1999 so 1ONEY < 11998. Since M is already bound to 1, 
%  O must be bound to 0. A little more thought shows that S must be
%  bound to 8 or 9, and that N = E + 1. Using these insights to reduce
%  the number of solutions that must be explored, write a Prolog
%  predicate soln([D,E,M,N,O,R,S,Y]) that solves this puzzle by binding
%  the correct digits to each of the variables in the list. (Modified 
%  from http://www.cs.wisc.edu/~fischer/)
% (1 clause with multiple subgoals.  You do not need assign_digits you should
%   use 'select' directly)

solvSlow( [D,E,M,N,O,R,S,Y]) :-
	Lst = [S,E,N,D,M,O,R,Y],
	Digits = [0,1,2,3,4,5,6,7,8,9],
	assign_digits(Lst, Digits),
	M > 0, 
	S > 0,
	1000*S + 100*E + 10*N + D +
	1000*M + 100*O + 10*R + E =:=
	10000*M + 1000*O + 100*N + 10*E + Y,
	write(Lst).


assign_digits([], _List).
assign_digits([D|Ds], List):-
        select(D, List, NewList),
        assign_digits(Ds, NewList).

% --------------------------


/*6: Write a procedure unique which removes duplicate elements
     from a list.  You may use a built predicate or additional
     user defined helper predicate.
      Example:
             ?- unique([a,c,x,a,g,c,d,a], A).
             A = [a,c,x,g,d]
             Yes
     (2 clauses)
*/



/* 7: Ackermann's functions as defined homework 1 problem 9.
*/



%8. sumR(+N,?S).
/* Given a number, N, S is a list of the sum of the numbers from N
   down to 0 suchthat first number in S is the sum of all the number from N to 0, 
   the second number in S the sum of all the numbers from N-1 down to 0
    etc.
   For example:
     ?- sumR(6,S).
     S = [21, 15, 10, 6, 3, 1, 0] 
     Yes
   2 clauses
*/ 



%9. sumL(N,S).  
/* Is simular to sumRtoL(+N,?S), except that sum totals 
   accumulate left to right. e.g. The first value in S will be N,
   the second value will be N + N-1, etc.

     ?-sumL(6,S). 
     S = [6, 11, 15, 18, 20, 21, 21] 
 
    It would be helpful to overload sumL/2 and include the following
    clause:
    
       sumL(N,Lst):-sumL(N,N,Lst).
       
    2 additional clauses.

*/



/* 10:  Syntax-Directed Differentiation:  A motivating example illustrating the 
         power of pattern matching in Prolog.
         Consider the following rules for symbolic differentiation
         (U, V are mathematical expressions, x is a variable):

        dx/dx = 1
        d(C)/x = 0.
        d(Cx)/x = C               (C is a constant)
        d(-U)/dx = -(dU/dx)
        d(U+V)/dx = dU/dx + dV/dx
        d(U-V)/dx = dU/dx - dV/dx
        d(U*V)/dx = U*(dV/dx) + V*(dU/dx)
        d(U^n)/dx = nU^(n-1)*(dU/dx)

        These rules can easily be translated into Prolog, for instance,
        the second rule can be defined as
                   d(C,x,0):-number(C).
          and the fifth rule can be defined as
                   d(U+ V ,x, DU + DV)):-d(U,x,DU),d(V,x,DV).

         Write the remaining rules. Here is a test query:

            ?- d(3*(x +2*x*x),x,Result).
            Result = 3* (1+ (2*x*1+x* (2*1+x*0)))+ (x+2*x*x)*0 ;
            NO

        Keep in mind, though, that terms such as U+V are still trees with the
        functor at the root, and that evaluation of such terms requires 
        additional processing .  See next week's assignment.
        1 clause for each definition.
*/




/*11: Write a predicate called reduce( Expr, Value) which reduces a numerical 
     Expr to its value.  You should only need is, pattern matching and recursion.  
     The following rule will be the base case.  Since +,* and - have special 
     meaning for the predicate 'is', atoms are used to represent the corresponding
     operator.  Operations are in prefix notation.
                    reduce(N,N):-number(N).
    Here are two test queries: 
    ?- reduce(times(3,plus(5,times(minus( 4,2),3))), Value).
    Value = 33
    Yes
    ?- reduce( times(3, plus(5 , times( minus( 4.5,2), 3))), Value).
    Value = 37.5
    Yes  
   (4 clauses).

*/



/* 12:Define a program --  numOfAtomsInNestedLists(+Lst,?NofAtoms),
 *  that counts all the atoms and numbers in all the nested lists.  
 *  YOU may assume the elements in Lst(or lists in Lst)
 *  contain either atoms, numbers or lists but not complex terms.
 *    ?-numOfAtomsInNestedLists([1,[a,s,d],[s,s,[1,4,5],[d,f,g]],[x,c,v]],NA)
 *    NA = 15
 *    ?- numOfAtomsInNestedLists([[],[1,[a,s,d],[s,s,[1,4,5],[d,f,g]],[]],[x,c,v]],NA).
 *    NA = 15 
 *
 *    You only need recursion, addition and pattern matching.  
 *    3 clauses.
*/




