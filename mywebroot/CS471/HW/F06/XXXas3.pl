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
 */


/* 1: Do exercise 11.14 page 585 by completing insertsionSortEX. You may 
      have use two functors. One for the outer loop and one for the inner loop.
*/

insertionSort(Input,Sorted):-insertionSortEx(Input,[],Sorted).


/* 2: Do exercise 11.15 page 585.  You should NOT use 'length'.  You may
      assume the first call to quicksort does not "worry" about the length
      of the input list.
**/  



/* 3: Define predicates and/2(done in class), or/2(done in class), nand/2, nor/2, xor/2, 
      and equ/2 (for logical equivalence) which succeed or fail 
      according to the result of their respective operations; e.g.
      and(A,B) will succeed, if and only if both A and B succeed. 
      Note that A and B can be Prolog goals (not only the constants 
      true and fail).
      A logical expression in two variables can then be written in 
      prefix notation, as in the following example: and(or(A,B),nand(A,B)).
**/



/* 4: Write a procedure build(+Lst,?ConsLsts), such that
      each element in Lst is "cons" to the next list element of ConsLst.  
      The last element of ConsLst is the list with the last element of Lst. 
     e.g.
           ?-build([1,3,a,c],LstOfLsts).
	   LstOfLsts = [[1, 3, a, c], [3, a, c], [a, c], [c]]
           Yes
   
*/




/*5: Define a relation "subset(?Lst, ?Subset)", which
     when given Lst, a list of elements proceded by [], builds a list
     of subsets of the elements.  
     The order of the subsets will be the empty set (represented by
     []), a list with the first element, the next subset will be a list
     with the second element followed by the first element, etc. 
     When given Subset in the order described above will build Lst with
     the first element [], followed by the unique elements in Subset.
     YOU should not use 'append' in your solution.
    e.g.
      ?- subset([[],1,2,3],S).
      S = [[], [1], [2, 1], [3, 2, 1]] 
      Yes
      ?- subset(X,[[], [1], [2, 1], [3, 2, 1]]).
      X = [[], 1, 2, 3] 
      Yes
*/



/* 6: Define a procedure countAtoms, such that countAtoms(+LstOfLstsOfAtoms,?Count) 
      calculates the number of all the atoms in each list.
      e.g.
      ?- countAtoms([[a,[b,c,[a,x,t]],[1,[],[2,3]]],[x,[y],a]],C).
      C = 12
      Yes
      ?- countAtoms([[a,[b,c,[a,x,t]],[a,b,c,1,2,3]],[x,y,a]],C).
      C = 15
      Yes

*/



/*7: Write a predicate called reduce( Expr, Value) which reduces a numerical 
     Expr to its value.  You should only need is, pattern matching and recursion.
     The following rule will be the  base case.  Since +,* and - have special 
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
*/





/*  8. Design and test 'memberSeq(E,Seq)' that succeeds if E is an element 
       of the sequence, Seq.
     e.g.
        ?- memberSeq(a,(1,2,3,a,4,5)).
        Yes
        ?-  memberSeq(a,X).
        X = a;
        X = a, _G198 ;
        X = _G197, a ;
        X = _G197, a, _G201 
        Yes
        ?-memberSeq(a,(a)).
        Yes
**/ 


/* 9.  Design and test , 'seqAppend(SeqA, SeqB, Seq)' which is intended to 
       produce a sequence Seq.
      Seq has all the elements of SeqA followed by all the elements of SeqB.  Remember that
      the smallest sequence has ONE element.
      e.g.
           ?- seqAppend((1,4,7,5),(a,z,w),A).
           A = 1, 4, 7, 5, a, z, w 
           Yes
           ?-  seqAppend(A,B,(1,4,7,5,a,z,w)).
           A = 1, 4, 7, 5, a, z
           B = w ;
           A = 1, 4, 7, 5, a
           B = z, w ;
        ...
**/




/* 10. A binary tree is either a node structure or an empty atom.  node is a triple,
       node(Value,Ltree,Rtree).   Below are a list of clauses representing different binary
       search trees.  (Assuming unique values, BST is a binary tree if the value at the 
       node is greater than all the values in the left subtree and less than all the 
       values in the right subtree.)

        tree1(node(33,empty,empty)).
        tree2(node(33,node(22,empty,empty),empty)).
        tree3(node(3,node(2,empty,empty),node(10,node(5,empty,empty),empty))).
        tree4(node(10, node(5, node(1,empty,empty), node(8,empty,empty)), 
                    node(13,empty,empty))).
        tree5(node(15,L,R)):-tree4(L),tree2(R).

    Write a procedure, memberBST, such that memberBST(E,BSTree) succeeds if E is an element
    in the BSTree.  You may assume that BSTree is always a binary search tree. You can use
    the following querys to test your procedure:
      ?- tree4(T),memberBST(8,T).
      T = node(10, node(5, node(1, empty, empty), node(8, empty, empty)), node(13, empty, empty)) 
      Yes
      ?-  tree4(T),memberBST(1,T).
      T = node(10, node(5, node(1, empty, empty), node(8, empty, empty)), node(13, empty, empty)) 
      Yes
      ?- tree4(T),memberBST(11,T).
      No
*/


% Some test data.

tree1(node(33,empty,empty)).
tree2(node(33,node(22,empty,empty),empty)).
tree3(node(3,node(2,empty,empty),node(10,node(5,empty,empty),empty))).
tree4(node(10, node(5, node(1,empty,empty), node(8,empty,empty)), node(13,empty,empty))).
tree5(node(15,L,R)):-tree4(L),tree2(R).
notBtree(node(3,empty,empty,empty)).

