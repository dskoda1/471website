/*******************************************************************
        CS471 - Programming Languages
        Section: <YOUR Section number>
        Assignment #<number> due: <DATE>
        Author: <LastName>, <FirstName> (<EMail>)
        Date: <DATE>
*/
/* :-set_prolog_flag... allows all elements of a long list to be 
   displayed by typing "w" at the end of the displayed list(see problem 3)
*/

:-set_prolog_flag( prompt_alternatives_on, groundness).



/* 1: (From Learn Prolog NOW! exercise 3.3)
      Binary trees are trees where all internal nodes have exactly two
      children. The smallest binary trees consist of only one leaf node. We
      will represent leaf nodes as leaf(Label). For instance, leaf(3) and
      leaf(7) are leaf nodes, and therefore small binary trees. Given two
      binary trees B1 and B2 we can combine them into one binary tree using
      the predicate tree: tree(B1,B2). So, from the leaves leaf(1) and
      leaf(2) we can build the binary tree tree(leaf(1), leaf(2)). And from
      the binary trees tree(leaf(1), leaf(2)) and leaf(4) we can build the
      binary tree tree(tree(leaf(1), leaf(2)), leaf(4)).

     Now, define a predicate swap/2, which produces a mirror image of the
     binary tree that is its first argument. For example:
  
       ?- swap(tree(tree(leaf(1), leaf(2)), leaf(4)),T).
       T = tree(leaf(4), tree(leaf(2), leaf(1))).
       (2 clauses)
       ?- t1(T1),swap(T1,T).
       T1 = tree(leaf(4), tree(leaf(2), leaf(1))),
       T = tree(tree(leaf(1), leaf(2)), leaf(4)).

      t1 and t2 are functors with "tree" arguments which you can use for testing.   

  */

t1( tree(leaf(4), tree(leaf(2), leaf(1)))).
t2( tree(leaf(-1), tree(tree(leaf(2),leaf(-3)), tree(leaf(5),leaf(4))))).


/* 2: Define a procedure singleLst, such that singleLst(LstOfLsts,SingleLst) 
      succeeds if all elements in all the lists of LstOfLsts are in SingleLst and
      in the same order.  You may assume the elements in LstOfLst contain only
      lists of atoms and terms and the elements in SingleLst are just atoms
      and terms. e.g.

      ?- singleLst([[1,2],[a,s,b],[1,2]],SingleLst). 
      SingleLst = [1, 2, a, s, b, 1, 2].
      ?- singleLst([[1,2],[a],[],[1,2],[]],SingleLst).
      SingleLst = [1, 2, a, 1, 2].

     2 clauses -- the only buildin predicate you may use is append.
 */
 

                                   
/** 3: Define a procedure unNested, such that unNested(LstOfNestedLsts,UnNestedLst) 
     succeeds if UnNestedLst is a list with only atoms and numbers and
     the numbers and atoms are elements of nested list in LstOfLsts and these
     elements occur in the same in both lists. e.g. 
       ?- unNested([1,[1,3,2,[a,b,c],[x,[y],[]],[a]],[x,y,z]],U).
       U = [1, 1, 3, 2, a, b, c, x, y|...] [write] %(user types "w" here) 
       U = [1, 1, 3, 2, a, b, c, x, y, a, x, y, z] 
 
   (Order of clauses is important. Only 3 clauses necessary. The only builtin
   predicate you may use is "append")
     
*/



/* Assigned hw4 # 11 Syntax-Directed Differentiation:
   My solution  
*/

d(x,x,1).
d(C,x,0):-number(C).
d(C*x,x,C):-number(C).
d(-U, X, -DU) :- d(U, X, DU).
d( U + V, x, RU + RV ):-d(U,x,RU), d(V,x,RV).
d( U - V, x, RU - RV ):-d(U,x,RU), d(V,x,RV).
d(U * V,x, U * DV + V * DU):- d(U,x,DU), d(V,x,DV).
d(U^N, x, N*U^N1*DU) :- integer(N), N1 is N-1, d(U, x, DU).



/* 4: In homework 4 you programmed Syntax-Directed Differentiation.
      Define the predicate, 'evaluate', that uses the result from 
      differentiation and a list of values for each variable and 
      computes the resulting value. e.g.

    ?- d(3*(x +2*x*x),x,Result), VarValue=(x/3), evaluate(Result,Value,VarValue).
    Result = 3* (1+ (2*x*1+x*2))+ (x+2*x*x)*0
    VarValue = (x/3)
    Value = 39
    ?- d(3*(x +2*x^2),x,Result), VarValue=(x/3), evaluate(Result,Value,VarValue).
    Result = 3* (1+ (2* (2*x^1*1)+x^2*0))+ (x+2*x^2)*0,
    VarValue = x/3,
    Value = 39 ;
    false.
*/


/* 5. Do exercise 11.14 page 572.  You may have use two functors.
      One for the outer loop and one for the inner loop. 
      
      ?- insertionSort([3,10,9,2,1,5],Sorted).
      Sorted = [1, 2, 3, 5, 9, 10] .
*/


/* 6: Define a predicate
         subsum(+Set, +Sum, ?SubSet)
      so that Set is a list of numbers, and the sum of the numbers in SubSet is
      Sum. e.g.
        ?- subsum([5,12,10,2,1,7,4],12, SSet).
        SSet = [5, 2, 1, 4] ;
        SSet = [5, 7] ;
        SSet = [12] ;
        SSet = [10, 2] ;
        SSet = [1, 7, 4] ;
        false.

     (3 clauses). 
*/


     

