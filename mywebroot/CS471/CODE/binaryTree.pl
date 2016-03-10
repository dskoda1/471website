% Bratko, "Prolog Programming For AI",  pages 217-230
% Binary Trees:

% in(+E, +Tree): E in binary dictionary Tree
in(X, t(_,X,_)).
in(X, t(Left,Root,_)) :-
   Root > X,                     % Root greater than X
   in(X,Left).                      % Search left subtree

in(X, t(_,Root,Right)) :-
   X > Root,                     % X greater than Root
   in(X,Right).                     % Search right subtree


%addleaf(+Tree,+X,-NewTree)
%   insert X as a leaf into binary dictionary Tree gives NewTree
addleaf( nil,X,t(nil,X,nil) ).

addleaf( t(Left,X,Right), X, t(Left,X,Right) ).

addleaf( t(Left,Root,Right), X, t(Left1,Root,Right)) :-
   Root > X,            
   addleaf(Left,X,Left1).

addleaf( t(Left,Root,Right), X, t(Left,Root,Right1)) :-
   X > Root,   
   addleaf(Right,X,Right1).


% del(+Tree, +X, -NewTree):
%     deleting X from binary dictionary Tree gives NewTree
del(t(nil,X,Right), X, Right).

del(t(Left,X,nil), X, Left).

del(t(Left,X,Right), X, t(Left,X,Right1) ):-
   delmin(Right, Y, Right1).

del(t(Left,Root,Right), X, t(Left1,Root,Right) ):-
   Root > X,            
   del(Left,X,Left1).

del( t(Left,Root,Right), X, t(Left,Root,Right1)) :-
   X > Root,            
   del(Right,X,Right1).

% delmin(+Tree, +Y, -NewTree):
%  delete minimal item Y (left most node of Tree) in binary dictionary Tree
%  producing NewTree
delmin(t(nil,X,Right), Y, Right).

delmin(t(Left,Root,Right), Y, t(Left1,Root,Right) ):-            
   delmin(Left,X,Left1).

% add(+Tree, +X, -NewTree):
%  inserting X at any level of binary dictionary Tree gives NewTree

add(Tree, X, NewTree) :-                     % Add X as new root
   addroot(Tree, X, NewTree).

add(t(Left,Y,Right), X, t(Left1,Y,Right)):-   % Insert X into left Subtree
   Y > X,
   add(Left,X,Left1).

add(t(Left,Y,Right), X, t(Left,Y,Right1)):-   % Insert Y into right Subtree
   X > Y,            
   add(Right,X,Right1).

% addroot(Tree, X, NewTree): inserting X as the root into Tree gives NewTree

addroot( nil,X,t(nil,X,nil) ).   % Insert into empty Tree

addroot( t(Left,Y,Right), X, t(Left1,X,t(Left2,Y,Right))) :-
   Y > X,            
   addroot(Left,X,t(Left1,X,Left2)).


addroot( t(Left,Y,Right), X, t( t(Left,Y,Right1), X, Right2)) :-
   X > Y,            
   addroot(Right,X,t(Right1,X,Right2)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% For your own experimentation try the following...  (See Bratko p223)
% Do Not Turn In  (answers are in Bratko)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1) Define the procedure
%     height(+BinaryTree, -Height)
%   to compute the height of a binary tree.  Assume that the height of the
%   empty tree is 0, and that of a one element tree is 1.

%2) Define the relation
%     linearize( +Tree, -List)
%   to collect all the nodes in Tree into a list.

%3) Define the relation
%     maxelement(D,Item)
%  so that Item is the largest element stored in the binary dictionary D.
%

% Try this set of Queries:
% 1?- add(nil,3,D1), add(D1,5,D2), add(D2,1,D3),
%           add(D3,6,D), add(DD,5,D), asserta(tree(D)), asserta(tree(D1)).
% 2?- tree(X), del(X,5,NewTree), add(NewTree,8,NewTree2).
% What happens when you ask for another solution?
% 3?- tree(X), in(5,X).
% 4?- in(5,tree(X)).
% What is the matter with query 4?


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Structured Data and Doing Data Abstractions Bratko page 98-104
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% family(person(Father),person(Mother),[person(Child)...]).
% person(GivenName,SurName,dob(Day,Month,Year),Workstatus).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

family(
      person(tom, fox, dob(7,may,1950), works(suny, 25000) ),
             person(mary,fox,dob(9,may,1951),works(ibm,50000)),
             [ person(pat, fox, dob(5,may,1973), student(hs) ),
              person(jim,fox,dob(5,may,1973),student(hs)) ] ) .

family(
      person(tom,jones,dob(7,may,1940),unemployed),
              person(mary,jones,dob(9,may,1945),works(ibm,50000)),
              [person(pat,english,dob(5,may,1965),works(kmart,10000)),
               person(sally,jones,dob(5,may,1970),student(bcc))]).

family(
      person(jim,jones,dob(15,june,1960),works(nyseg,45000)),
              person(alice,jones,dob(9,nov,1959),houseperson),
              [ person(billy,jones,dob(5,may,1985),student(preschool))] ).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Try these queries:
% ?- family(person(_,jones,_,_),_,_).
% ?- family(person(GivenName,jones,_,_),_,_).
% ?- family(Husband,_,_).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




