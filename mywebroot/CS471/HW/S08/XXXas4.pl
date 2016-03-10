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
 
/** 1:  Write a procedure sum which produces the sum of the
       integers from 0 up to and including its first argument.
   Example:
               ?- sum(5, S).
               S = 15
   2 clauses
*/


/** 2: Ackermann's functions as defined in homework 1. (4 clauses).
*/



/* 3:  : (From Learn Prolog NOW! exercise 3.3)
 * Binary trees are trees where all internal nodes have exactly two
 * children. The smallest binary trees consist of only one leaf node. We
 * will represent leaf nodes as leaf(Label). For instance, leaf(3) and
 * leaf(7) are leaf nodes, and therefore small binary trees. Given two
 * binary trees B1 and B2 we can combine them into one binary tree using
 * the predicate tree: tree(B1,B2). So, from the leaves leaf(1) and
 * leaf(2) we can build the binary tree tree(leaf(1), leaf(2)). And from
 * the binary trees tree(leaf(1), leaf(2)) and leaf(4) we can build the
 * binary tree tree(tree(leaf(1), leaf(2)), leaf(4)).

 * Now, define a predicate swap/2, which produces a mirror image of the
 * binary tree that is its first argument. For example:

    ?- swap(tree(tree(leaf(1), leaf(2)), leaf(4)),T).
    T = tree(leaf(4), tree(leaf(2), leaf(1))).
    yes

  2 clauses
**/




/* 4:Define a predicate, listOfTerms(ListOfArgs,Name, ListOfResults), 
     where each term in the ListOfResults is a term with one argument 
     from the ListOfResults and the functor name is the Name.

          ?- listOfTerms([a,b,23,4],foo,T).
          T = [foo(a), foo(b), foo(23), foo(4)]
          Yes
   
   2 clauses 
*/



/** 5: Given a list of predicates, applylist(L) succeeds only if
      each of the predicates in the list succeeds. Note: the scope
      of variables names is the entire list. You can apply each predicate
      at the prompt to see how they work.  Make up your own. (2 lines)

   i.e.
      ?- applylist([=(A,5),is(B,+(4,5)),C is max(5,2),A=C]).
      A = 5
      B = 9
      C = 5
      yes
      ?- applylist([=(A,5),is(B,+(4,5)),C is max(9,2),A=C]).
      no
      
   2 clauses 
  */



/** 6:Define numOfAtoms(+Lst, ?NofAtoms),
 *   that counts the number of atoms in each list in Lst.  You may use a helper 
 *   predicate (program).  Each list in Lst may contain atoms or compound terms.  
 *   Count only atoms.  You can use the built in predicate atom. 
 *   i.e.
 *     ?- numOfAtoms([[a,aa,b,zon],[a,kk,zz],[er]],N).
 *     N = 8
 *     Yes
     2 predicates and a total of 5 clauses.
*/




/* 7:Define a program --  numOfAtomsInNestedLists(+Lst,?NofAtoms),
 *   that counts all the atoms in all the nested lists.  
 *   YOU may assume the elements in Lst(or lists in Lst)
 *   contain either atoms or lists but not complex terms.
 *     ?-numOfAtomsInNestedLists([1,[a,s,d],[s,s,[1,4,5],[d,f,g]],[x,c,v]],NA)
 *     NA = 15
 *     ?- numOfAtomsInNestedLists([[],[1,[a,s,d],[s,s,[1,4,5],[d,f,g]],[]],[x,c,v]],NA).
 *     NA = 15 
 
      You only need recursion, addition and pattern matching.  
      3 clauses.
*/



/** 8:  Syntax-Directed Differentiation:  A motivating example illustrating the 
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
                   d(C,x,0):-integer(C).
          and the fifth rule can be defined as
                   d(U+ V ,x, DU+ DV)):-d(U,x,DU),d(V,x,DV).

         Write the remaining rules. Here is a test query:

            ?- d(3*(x +2*x*x),x,Result).
            Result = 3* (1+ (2*x*1+x* (2*1+x*0)))+ (x+2*x*x)*0 ;
            NO

        Keep in mind, though, that terms such as U+V are still trees with the
        functor at the root, and that evaluation of such terms requires 
        additional processing .  See next week's assignment.
        1 clause for each definition.
*/



/*9: sumR(+N,?S).
     Given a number N, S is a list of the sum of the numbers from N
     down to 0 suchthat first number in S is the sum of all the number from N 
     down to 0,the second number in S the sum of all the numbers from N-1 down 
     to 0 etc.
   For example:
     ?- sumR(6,S).
     S = [21, 15, 10, 6, 3, 1, 0] 
     Yes
     
   2 clauses
*/ 


/*10: sumL(N,S).  
      Is simular to sumRtoL(+N,?S), except that sum totals 
      accumulate left to right. e.g. The first value in S will be N,
      the second value will be N + N-1, etc.
    For example:
     ?-sumL(6,S).
     S = [6, 11, 15, 18, 20, 21, 21]
       
    It would be helpful to overload sumL/2 and include the following
    clause:
    
       sumL(N,Lst):-sumL(N,N,Lst).
       
    2 additional clauses.

*/







