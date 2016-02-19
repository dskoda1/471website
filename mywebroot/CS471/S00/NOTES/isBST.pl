% node(Value,Leftsubtree,Rightsubtree).
node(_,_,_).


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



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  insert at leaf
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


insert( X,empty,node(X,empty,empty) ).

/*  No duplicate "keys"  */
insert(X, node(Left,X,Right), node(Left,X,Right) ).


% search for "correct" leaf to insert after....

insert( X, node(Root,Left,Right),node(Root,Left1,Right)) :-
   Root > X,            
   insert(X, Left,Left1).

insert( X, node(Root,Left,Right), node(Root,Left,Right1)) :-
   X > Root,   
   insert(X, Right, Right1).













