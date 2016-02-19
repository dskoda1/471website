/*******************************************************************
        CS471 - Programming Languages
        Section: <YOUR Section number>
        Assignment #<number> due: <DATE>
        Author: <LastName>, <FirstName> (<EMail>)
        Date: <DATE>
*/

%%%%%  Code for you to experiment with

fill(X,N,L) :- length(L,N), append([X],Lx,L), append(Lx,[X],L). 

/***  
    Binary Tree problems
    Some tree and code examples

***/


*****************************************************************************
    The purpose of this assignment is to re-enforce your understanding of 
    recursive data structures.  Provided is the "node" functor, 
    which search a BST and succeeds if the element is a member of the BST,
    "show", a pretty print of a tree, and some examples of trees (test data).  
 ****************************************************************************/

/******************************************************************************/
% You are to add these procedures.  I have provided some sample code and
% example of data type for both binary trees and expression trees.
% 1) Write a procedure, isMember(M,BSTree), that succeeds 
%     if M is in the binary search BSTree.
% 2) Write a procedure, isBinaryTree(Tree), that succeeds 
%     if Tree is a binary tree
% 3) Write a procedure, isBST(Tree), that succeeds 
%     if Tree is a binary search tree.
% 4) Write of procedure that unifies Height with the height of Tree.
% 5) Write subtractionOfNodeValues(Tree) that computes the
%     subtraction of the node values assuming 
%     preorder traversal of expression tree (abstract tree).  <<< changed
% 6 and 7) print and evaluate an expression tree.
/*********************************************************************/    

% A tree is either a "node" or "empty"
% "node" is a triple and "empty" is an atom.

% node(Value,Leftsubtree,Rightsubtree).

% Example of binary tree using about definition.

% node(10, node(5, node(1,empty,empty), node(8,empty,empty)), node(13,empty,empty))).

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
tree6(node(-5,L,R)):-tree2(L),tree3(R).
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


/****  
    Problems to code
****/

% 1: isMember(E,Tree). 
% precondition Tree is a binary search tree.
%Students do not have to use cuts




%2 isBinaryTree(Tree).




%3.  isBST(BinaryTree).





%4 height(BinaryTree,Height).
% The height of a Leaf is 0 the height of a node is the 1 + MaximumHeightOf(left tree,right tree)





%5 subtractionOfNodeValues(IntegerTree,Sum)

/*
   ?- tree3(T),subtractionOfNodeValues(T,S).
   T = node(3, node(2, empty, empty), node(10, node(5, empty, empty), empty))
   S = -4
   yes 
*/


% 6&7:  Expression Tree
% Op is any Prolog operator
%    Lv is the left value, Rv is the right value.
% exp(const, V) represents the constant with the value V.


%Three types of expression trees.

%exp(Op,Lt,Rt).
% exp(const,Value).
% exp(Op,T).


% constant trees for testing your code.  For example:
% ?- tree1(T), show(T).
% or
% ?- tree2(T), eval(T,Value).

tree1(exp('+',
	exp(const, 5),
	exp('*',
	     exp(const, 3),
	     exp(const, 2)
	 )
     )
 ).


tree2(exp('*',
	exp('-', 
	     exp(const, -3),
	     exp(const, 2)
	 ),

	exp('+', 
	     exp(const, 3),
	     exp('-',
		 exp(const, 2)
		)
	   )
	 )
 ).

tree3(exp('*',
	exp('min', 
	     exp(const, -3),
	     exp(const, 2)
	 ),

	exp('+', 
	     exp(const, 3),

	     exp('-',
		 exp(const, 2)
		)
	   )
	 )
 ).


tree4(exp(float,
	exp('sin',
	     exp('/',
		 exp(const, pi),
		 exp(const, 2)
		 )
	    )
	  )

      ).




%6. showE(Tree)


% Pretty Print of tree.  Show the tree "sideways"


% Helper procedure for displaying tree.



%7. eval(Tree,Value).



/*  *******************  Example Output  **********************
?- tree4(T),eval(T,V).
T = exp(float, exp(sin, exp(/, exp(const, pi), exp(const, 2))))
V = 1.0
yes

?- tree1(T),eval(T,V).
T = exp(+, exp(const, 5), exp(*, exp(const, 3), exp(const, 2)))
V = 11

***********************   End   ************************/






