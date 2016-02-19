/* CS471 - Sept, 2003 5:20pm */

% Below I will get a singleton error because variable names appear only once.

node(Value,Leftsubtree,Rightsubtree).

% A tree is either a "node" or "empty"
% "node" is a triple and "empty" is an atom.

% A binary search tree representation below.
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
notBtree(node(3,empty,empty,empty)).

notBST(node(1,L,R)):- tree2(L), tree3(R).
notBST2(node(6,node(4,empty,node(7,empty,empty)),empty)).
















