/*      9/21/ 12:20 pm
        CS471 - Programming Languages
        Section: <YOUR Section number>
        Assignment #<number> due: <DATE>
        Author: <LastName>, <FirstName> (<EMail>)
        Date: <DATE>
*/


%1 ack ---



%2 countChar( String, Char, Count)




%3 countOcc(String, CharList,CountList).


%4 palindrome(List).



%5  accumProd(+Lst, RprodLst).


%6 lastElement(Lst,E)


%7 Binary Tree Stuff



/*****************************************************************************
    The purpose of this assignment is to re-enforce your understanding of 
    recursive data structures.  Provided is the "node" functor, "treeMember",
    which search a BST and succeeds if the element is a member of the BST,
    "show", a pretty print of a tree, and some examples of trees (test data).  
 ****************************************************************************/

/******************************************************************************/
% You are to add three procedures
% 1) Write a procedure, isBinaryTree(Tree), that succeeds if Tree is a binary tree.
% 2) Write a procedure, isBST(Tree), that succeeds if Tree is a binary search tree.
% 3) Write a procedure, sumTree(Tree,Sum) if Tree is number binary tree Sum is the sum of all the values.
/*********************************************************************/    

% Below I will get a singleton error because variable names appear only once.

% node(Value,Leftsubtree,Rightsubtree).
node(_,_,_).

% A tree is either a "node" or "empty"
% "node" is a triple and "empty" is an atom.

% A binary search tree representation below.
% node(10, node(5, node(1,empty,empty), node(8,empty,empty)), node(13,empty,empty))).

% Searching the a binary search tree.

treeMember(E, node(E,_,_)):-!.
treeMember(E, node(N,L,_)):- E < N, !, treeMember(E,L).
treeMember(E, node(_,_,R)):- treeMember(E,R).


% Pretty Print of tree.  Show the tree "sideways"

show(Tree) :- write('Tree =' ), nl,nl, showH(Tree,0).

% Helper procedure for displaying tree.

showH(empty, _).  % Do not display empty trees.
showH(node(Value, L, R),Indent):-
    Ind2 is Indent + 2,  % Indentions of 2 for subtree
    showH(R, Ind2),      % Display right subtree
    tab(Indent), write(Value),nl, % display root value if this tree
    showH(L,Ind2).       % Dispaly left subtree


/*****************************************************/
% Some test data.

tree1(node(33,empty,empty)).
tree2(node(33,node(22,empty,empty),empty)).
tree3(node(3,node(2,empty,empty),node(10,node(5,empty,empty),empty))).
tree4(node(10, node(5, node(1,empty,empty), node(8,empty,empty)), node(13,empty,empty))).
tree5(node(15,L,R)):-tree4(L),tree2(R).
notBtree(node(3,empty,empty,empty)).

notBST(node(1,L,R)):- tree2(L), tree3(R).
notBST2(node(6,node(4,empty,node(7,empty,empty)),empty)).

/******************************************************/
    % To test the following relations
    % query as follows:
    % ?- tree1(X),treeMember(5,X).
    % ?- tree4(X),treeMember(8,X).
    % ?- notBST(X),treeMember(3,X).
    % ?- tree5(X),treeMember(3,X).
    % ?- tree5(X), show(X).
/*****************************************************/











