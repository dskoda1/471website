/*
        CS471 - Programming Languages
        Section: <YOUR Section number>
        Assignment #<number> due: <DATE>
        Author: <LastName>, <FirstName> (<EMail>)
        Date: <DATE>
*/


%1 ack ---

ack(0,N,A):- A is N + 1.
ack(M,0,A):- M1 is M -1, ack(M1,1,A).
ack(M,N,A) :- M1 is M -1, N1 is N-1, ack(M,N1,An), ack(M1,An,A).


%2 countChar( String, Char, Count)

countChar("",_,0).
countChar([C|T],[C],Nx):- countChar(T,[C],N), Nx is N+1.
countChar([_|T],[C],N):- countChar(T,[C],N).


%3 countOcc(String, CharList,CountList).
countOcc(_,[],[]).
countOcc(String,[C|Cs],[N|Ns]):-countChar(String,[C],N),countOcc(String,Cs,Ns).

%4 palindrome(List).

palindrome([]).
palindrome([_]).
palindrome(L):-append([First|Middle],[First],L),
	palindrome(Middle).

palindrome2(List):- rev(List,RList),
	append(List,RList,List2),
	append(List,List,List2).
rev([H],[H]).
rev([H|T],Ret):-rev(T,NL2),append(NL2,[H],Ret).


%5  accumProd(+Lst, RprodLst).
accumProd([],[]).  % just to allow empty list.
accumProd([V],[V]).
accumProd([H|T],[RH,RP|RT]):-accumProd(T,[RP|RT]),
	RH is H * RP.





%6 Binary Tree Stuff



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


isBinaryTree(empty).
isBinaryTree(node(_,Left,Right)) :- isBinaryTree(Left), isBinaryTree(Right).

isBST(empty).
% isBST(T):- isBST(T,Min,Max).
isBST(T):- isBST(T,_,_).
  
isBST(node(Root,empty,empty),Root,Root). 
isBST(node(Root,Left,Right),LMin,RMax):- 
                               isBST(Left,LMin,LMax),
			       isBST(Right,RMin,RMax),
			       LMax < Root,
			       RMin > Root.

isBST(node(Root,Left,empty),LMin,Root):- 
                               isBST(Left,LMin,LMax),
			       LMax < Root.
isBST(node(Root,empty,Right),Root,RMax):- 
			       isBST(Right,RMin,RMax),
			       RMin > Root.

sumTree(empty,0).

sumTree(node(V,LT,RT),SUM):- sumTree(LT,SL),
	sumTree(RT,SR),
	SUM is V + SL + SR.









