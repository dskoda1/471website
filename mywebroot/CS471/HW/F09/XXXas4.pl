/*
        CS471 - Programming Languages
        Section: <YOUR Section number>
        Assignment #<number> due: <DATE>
        Author: <LastName>, <FirstName> (<EMail>)
        Date: <DATE>
 */
 

/* 1: Define a Prolog predicate, skipThird/2 which is true
  when its second argument is a list which is the same as the first argument 
  with every third element removed. You must use the anonymous variable ("_") 
  in place of any variable for which the replacement will not change the meaning 
  of the program. You must ensure that typing semi-colon after 
  getting an answer will not give any bogus answers, and that the program behaves
  reasonably with any of its arguments being variables. (Hint: There are 
  4 clauses.) e.g.
             ?- skipThird([1,2,3,4,5,6,7,8],X).
             X = [1, 2, 4, 5, 7, 8] ;  %NO cut  necessary for this code.
             false.
             ?- skipThird([1,2],X).
             X = [1, 2] ;
             false;
             ?- skipThird([],X).
              X = [] 

*/  

/* 2.  Define minMaxList(?(Min,Max),+Lst) to succeed if Lst is a list of numbers,
       Min is the minimum value in Lst and Max is the maximum value in Lst.
       You may use the built in predicates min and max. (DO NOT USE max_list 
       Or min_list).
       e.g.
          ?- minMaxList(MnMx, [3,4,2,55,10,33,0,100,1]).
          MnMx = (0, 100) .
    
*/
 
/* 3. Define a predicate, prod(+Lst, Prod), such that Prod is the product of all
      the values in Lst.  You may assume that Lst
      is a non empty list of numbers.
   e.g
     ?- prod( [3,4,2,5,11,33,20],P).
     P = 871200 .

*/

/** 4. prodRtoL(+L,?S).
   Given a non empty list of numbers, L, 
   S is a list of the (partial) product of the numbers in L such
   that first number in S is the product of all the number L, the second number 
   in S the prod of all the numbers in L except the first number in L, etc.
   (2 clauses)
   e.g.:
     ?- prodRtoL([1,2,3,4],S).
     S = [24, 24, 12, 4] .
*/ 

/*** 5. prodLtoR(L,S).  
   Is similar to prodRtoL(+L,?S), except that partial products
   accumulate left to right. (2 clauses)
    e.g.
     ?- prodLtoR([1,2,3,4],S).
     S = [1, 2, 6, 24] .

*/

/* 6: Define a predicate, listOfFacts(+Functor,+ListOfArgs,?Facts), where
      each term in the Fact is a term with
      one argument from the ListOfArgs and Functor is the functor.
      (See page 564 in Scott.)

      ?- listOfFacts(foo,[a,b,23,4],T).
         T = [foo(a), foo(b), foo(23), foo(4)]
	 

*/

/* 7: executeList(EList) 
      Given a list of predicates, executeList(Elist) succeeds only if
      each of the predicates in the list succeeds. Note: the scope
      of variables names is the entire list. You can apply each predicate
      at the prompt to see how they work.  Make up your own. 

   e.g.
    ?- executeList([=(A,99),is(B,+(5,94)),C=abc,C @< abcd,A=B]).
    A = 99 
    B = 99
    C = abc

    ?- executeList([=(A,99),is(B,+(5,95)),C=abc,C @< abcd,A=B]).
    false.
    ?- executeList([=(A,99),is(B,+(5,95)),write(B),C=abc,C @< abcd,A=B]).
    100
    false.
    (2 clauses)
*/

/* 8. A binary tree is either a node structure or an empty atom.  node is a triple,
       node(Value,Ltree,Rtree).   Below are a list of clauses representing 
       different binary search trees.  (Assuming unique values, BST is a binary 
       tree if the value at the node is greater than all the values in the left 
       subtree and less than all the values in the right subtree.) (3 clauses)

        tree1(node(33,empty,empty)).
        tree2(node(33,node(22,empty,empty),empty)).
        tree3(node(3,node(2,empty,empty),node(10,node(5,empty,empty),empty))).
        tree4(node(10, node(5, node(1,empty,empty), node(8,empty,empty)), 
                    node(13,empty,empty))).
        tree5(node(15,L,R)):-tree4(L),tree2(R).

    Write a procedure, memberBST, such that memberBST(E,BSTree) succeeds if 
    E is an element in the BSTree.  You may assume that BSTree is always a 
    binary search tree. You can use the following querys to test your procedure:
    
      ?- tree4(T),memberBST(8,T).
      T = node(10, node(5, node(1, empty, empty), node(8, empty, empty)), node(13, empty, empty)) . 
      ?-  tree4(T),memberBST(1,T).
      T = node(10, node(5, node(1, empty, empty), node(8, empty, empty)), node(13, empty, empty)) .
      ?- tree4(T),memberBST(11,T).
      false.
*/


% Use the following facts for testing.

tree1(node(33,empty,empty)).
tree2(node(33,node(22,empty,empty),empty)).
tree3(node(3,node(2,empty,empty),node(10,node(5,empty,empty),empty))).
tree4(node(10, node(5, node(1,empty,empty), node(8,empty,empty)), node(13,empty,empty))).
tree5(node(15,L,R)):-tree4(L),tree2(R).
notBtree(node(3,empty,empty,empty)).


/* 9: Write a predicate called reduce( Expr, Value) which reduces a numerical 
     Expr to its value.  You should only need is, pattern matching and recursion.  
     The following rule will be the base case.  Since +,* and - have special 
     meaning for the predicate 'is', atoms are used to represent the corresponding
     operator.  Operations are in prefix notation. 
     ( 4 clauses including reduce(N,N):-number(N). )
    
     Here are two test queries: 
    ?- reduce(times(3,plus(5,times(minus( 4,2),3))), Value).
    Value = 33
    ?- reduce( times(3, plus(5 , times( minus( 4.5,2), 3))), Value).
    Value = 37.5  
*/

 
/** 10:  "Send more money" is a well-known puzzle. Each of the letters
    D,E,M,N,O,R,S and Y represents a different digit. Moreover, when each
    letter is mapped to its corresponding digit the equation SEND + MORE =
    MONEY holds. Below is a very naive . Since there are 8 letters to be
    solved, it simply explore the 10*9*...*3 mappings of letters to
    digits. 
    A little insight can simplify things. Clearly, SEND < 9999 and 
    MORE < 9999. Thus MONEY < 19998 and hence M = 1. 
    Now we have SEND + 1ORE = 1ONEY. Again SEND < 9999 
     and now 1ORE < 1999 so 1ONEY < 11998. Since M is already bound to 1, 
     O must be bound to 0. A little more thought shows that S must be
     bound to 8 or 9, and that N = E + 1. Using these insights to reduce
     the number of solutions that must be explored, write a Prolog
     predicate soln([D,E,M,N,O,R,S,Y]) that solves this puzzle by binding
     the correct digits to each of the variables in the list. (Modified 
     from http://www.cs.wisc.edu/~fischer/)
    (1 clause with multiple subgoals.)
*/

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

 
/* 11:  Syntax-Directed Differentiation:  A motivating example illustrating the 
         power of pattern matching in Prolog.
         Consider the following rules for symbolic differentiation
         (U, V are mathematical expressions, x is a variable):

        dx/dx = 1
        d(C)/dx = 0.
        d(Cx)/dx = C               (C is a constant)
        d(-U)/dx = -(dU/dx)
        d(U+V)/dx = dU/dx + dV/dx
        d(U-V)/dx = dU/dx - dV/dx
        d(U*V)/dx = U*(dV/dx) + V*(dU/dx)
        d(U^n)/dx = nU^(n-1)*(dU/dx)

        These rules can easily be translated into Prolog, for instance,
        the second rule can be defined as
                   d(C,x,0):- number(C).
          and the fifth rule can be defined as
                   d(U+ V ,x, DU+ DV)):-d(U,x,DU),d(V,x,DV).

         Write the remaining rules. Here is a test query:

            ?- d(3*(x +2*x*x),x,Result).
            Result = 3* (1+ (2*x*1+x*2))+ (x+2*x*x)*0 ;
            Result = 3* (1+ (2*x*1+x* (2*1+x*0)))+ (x+2*x*x)*0 ;
            false.   

        Keep in mind, though, that terms such as U+V are still trees with the
        functor at the root, and that evaluation of such terms requires 
        additional processing .  See next week's assignment.
        1 clause for each definition.
*/


 




