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
   * to reenforce the coding of trees 
   
	1) For some of the problems below you need only generate a correct
      result from the query without requesting alternative results. 
      You may use cuts but it is not required.
 */
 

/* *1:(Variation From Learn Prolog NOW! exercise 3.2)
   Define a predicate equal_to/2 that takes two numerals in the
   notation that "we' introduced in this lecture (3.1.3(
   http://www.learnprolognow.org/html/node27.html#subsec.l3.ex3
  (i.e. 0, succ(0),succ(succ(0)) ...) as arguments and decides whether 
   the first one is greater than the second one. E.g:

    ?-  equal_to(succ(succ(0)),succ(succ(succ(0)))).
    No
    ?- equal_to(succ(succ(succ(0))),succ(succ(succ(0)))).
    Yes
  (2 clauses)
*/



/* **2:  : (From Learn Prolog NOW! exercise 3.3)
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
  binary tree that is its first argument. 
  For example:
    ?- swap(tree(tree(leaf(1), leaf(2)), leaf(4)),T).
    T = tree(leaf(4), tree(leaf(2), leaf(1))).
    yes
   (2 clauses)
   
   t1 and t2 data samples (functors with tree structures).
      
***/

t1( tree(leaf(4), tree(leaf(2), leaf(1)))).
t2( tree(leaf(-1), tree(tree(leaf(2),leaf(-3)), tree(leaf(5),leaf(4))))).


/* **3. A binary tree is either a node structure or an empty atom.  node is a triple,
          node(Value,Ltree,Rtree).   Below are a list of clauses representing 
          different binary search trees.  (Assuming unique values, BST is a 
          binary tree if the value at the node is greater than all the values in 
          the left subtree and less than all the values in the right subtree.)

   tree1(node(33,empty,empty)).
   tree2(node(33,node(22,empty,empty),empty)).
   tree3(node(3,node(2,empty,empty),node(10,node(5,empty,empty),empty))).
   tree4(node(10, node(5, node(1,empty,empty), node(8,empty,empty)), node(13,empty,empty))).
   tree5(node(15,L,R)):-tree4(L),tree2(R).

    Write a procedure, memberBST, such that memberBST(E,BSTree) succeeds if E is 
    an element in the BSTree.  You may assume that BSTree is always a binary 
    search tree. You can use the following querys to test your procedure:
     ?- tree4(T),memberBST(8,T).
     T = node(10, node(5, node(1, empty, empty), node(8, empty, empty)), node(13, empty, empty)) 
     Yes
     ?-  tree4(T),memberBST(1,T).
     T = node(10, node(5, node(1, empty, empty), node(8, empty, empty)), node(13, empty, empty)) 
     Yes
     ?- tree4(T),memberBST(11,T).
     No
     
     (3 clauses)
*/


%  functors of structures of BST which you can use to test your code.

tree1(node(33,empty,empty)).
tree2(node(33,node(22,empty,empty),empty)).
tree3(node(3,node(2,empty,empty),node(10,node(5,empty,empty),empty))).
tree4(node(10, node(5, node(1,empty,empty), node(8,empty,empty)), node(13,empty,empty))).
tree5(node(15,L,R)):-tree4(L),tree2(R).
notBtree(node(3,empty,empty,empty)).



/* *4:Define a predicate, listOfTerms(ListOfArgs,Name, ListOfResults), 
     where each term in the ListOfResults is a term with one argument 
     from the ListOfResults and the functor name is the Name.

          ?- listOfTerms([a,b,23,4],foo,T).
          T = [foo(a), foo(b), foo(23), foo(4)]
          Yes
     (see page 577 in Scott) Can be done in 2 clauses.
 */



/* *5: Given a list of predicates, applylist(L) succeeds only if
      each of the predicates in the list succeeds. Note: the scope
      of variables names is the entire list. You can apply each predicate
      at the prompt to see how they work.  Make up your own. (2 clauses)

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



/* **6: Write a predicate filter/3 such that filter(L1,L2,L3), where L1, L2, and L3 
   are lists, means that L3 consists of those elements of L1 that are not 
   elements of L2, in the same order as they are in L1.
     For example:
     ?- filter([1,2,3,4,5,6,7,8,9],[3,6],X).
     X = [1, 2, 4, 5, 7, 8, 9] 
     Yes
     
    Hint: Use the predefined predicate member/2. Here is the help entry:
    member(Elem, List)
       Succeeds when Elem can be unified with one of the members                                
       of List.
      The predicate can be used with any instantiation pattern.
      It is OK for filter to work only one way, from L1 and L2 to L3.
      By using a cut we can guarentee only correct solutions.  e.g.
        without the cut --
           ?- filter([1,2,3,4,5,6,7,8,9],[3,6],X).
           X = [1, 2, 4, 5, 7, 8, 9] ;
           X = [1, 2, 4, 5, 6, 7, 8, 9] ;
           X = [1, 2, 3, 4, 5, 7, 8, 9] ;
           X = [1, 2, 3, 4, 5, 6, 7, 8, 9] ;
           No
      The same code with a well placed 'cut' will return only the
      correct solution. e.g. 
      
       ?- filter([1,2,3,4,5,6,7,8,9],[3,6],X). X =
        [1, 2, 4, 5, 7, 8, 9] ; 
        No
      (3 clauses)
*/




/* **7: Assume your have a list of lists of numbers and if a nested list is empty
     the value is 0.  Define a procedure sumofList/2, which computes the sum of 
     all the values.  This can be done in 3 clauses. 
     e.g.
     ?- sumofList([[1,2],[3,4,5],[0],[100,200]],S).
     S = 315 
     yes
     ?- sumofList([[1,2],[3,4,5],[],[100,200]],S).
     S = 315 
     yes

*/




