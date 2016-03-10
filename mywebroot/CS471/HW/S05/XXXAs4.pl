/*******************************************************************
        CS471 - Programming Languages
        Section: <YOUR Section number>
        Assignment #<number> due: <DATE>
        Author: <LastName>, <FirstName> (<EMail>)
        Date: <DATE>
*/


/***  
    Binary Tree example
    Some tree and code examples

***/


% A tree is either a "node" or "empty"
% "node" is a triple and "empty" is an atom.

% node(Value,Leftsubtree,Rightsubtree).
% empty.

% Example of binary tree using about definition.

% node(10, node(5, node(1,empty,empty), node(8,empty,empty)), 
           node(13,empty,empty))).

/*****************************************************/
% Some test data.

tree1(node(33,empty,empty)).
tree2(node(33,node(22,empty,empty),empty)).
tree3(node(3,node(2,empty,empty),node(10,node(5,empty,empty),empty))).
tree4(node(10, node(5, node(1,empty,empty), node(8,empty,empty)), node(13,empty,empty))).
tree5(node(15,L,R)):-tree4(L),tree2(R).
tree6(node(-5,L,R)):-tree2(L),tree3(R).

/******************************************************/
    % To test the following relations
    % query as follows:
    % ?- tree1(Tree),isMember(5,Tree).
    % ?- tree4(X),isMember(8,X).
    % ?- tree5(X),isMember(3,X).
   
/*****************************************************/


% 1: isMember(E,Tree). 
% precondition Tree is a binary search tree.
% Students do not have to use cuts





% 2:  Expression Tree
% Op is any Prolog operator
%    Lv is the left value, Rv is the right value.
% exp(const, V) represents the constant with the value V.


%Three types of expression trees.

%exp(Op,Lt,Rt).
% exp(const,Value).
% exp(Op,T).


% constant trees for testing your code.  For example:
% ?- eTree1(T), show(T).
% or
% ?- eTree2(T), eval(T,Value).

eTree1(exp('+',
	exp(const, 5),
	exp('*',
	     exp(const, 3),
	     exp(const, 2)
	 )
     )
 ).


eTree2(exp('*',
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

eTree3(exp('*',
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


eTree4(exp(float,
	exp('sin',
	     exp('/',
		 exp(const, pi),
		 exp(const, 2)
		 )
	    )
	  )

      ).




% Pretty Print of tree.  Show the tree "sideways"

showE(Tree) :- write('Tree =' ), nl,nl, showEHp(Tree,0).

% Helper procedure for displaying tree.

showEHp(exp(const, Value),Indent):-
     tab(Indent + 2), write(Value),nl. % display root value if this tree

showEHp(exp(Op, L, R),Indent):-
    name(Op,S),length(S,Len),
    Ind2 is Indent + Len +1 ,  % Indentions of L for subtree 
			       %(ok to use 2 instead of Len)
    showEHp(R, Ind2),           % Display right subtree
    tab(Indent), write(Op),nl, % display root value if this tree
    showEHp(L,Ind2).            % Display left subtree

showEHp(exp(Op, U),Indent):-
    name(Op,S),length(S,Len),
    Ind2 is Indent + Len + 1,  % OK to us a constant instead of Len
    showEHp(U, Ind2),           % Display right subtree (for unary operator)
    tab(Indent), write(Op),nl. % display root value if this tree





%2. eval(Tree,Value).



/*  *******************  Example Output  **********************
?- eTree4(T),eval(T,V).
T = exp(float, exp(sin, exp(/, exp(const, pi), exp(const, 2))))
V = 1.0
yes

?- eTree1(T),eval(T,V).
T = exp(+, exp(const, 5), exp(*, exp(const, 3), exp(const, 2)))
V = 11

***********************   End   ************************/

%3 regularEx(Lst).
/* Using the ideas presented on slides 15-19 
(http://dingo.sbs.arizona.edu/~sandiway/ling388n/lecture6.ppt) 
Write a recognizer/generator for the regular expression:
      (ab+a)|(ba+b)

i.e.
   1 ?- regularEx([a,b,b,b,b,a]).
   Yes
   2 ?- regularEx([a,b,b,b,b]).
   No
   3 ?- regularEx([b,a,a,a,a,a,a,b]).
   Yes
   4 ?- regularEx([X,Y,Z]).
   X = a
   Y = b
   Z = a ;

   X = b
   Y = a
   Z = b ;
   NO

    5 ?- regularEx(X).
    X = [a, b, a] ;
    X = [a, b, b, a] ;
    X = [a, b, b, b, a] ;
    X = [a, b, b, b, b, a] ;
    X = [a, b, b, b, b, b, a] ;
    X = [a, b, b, b, b, b, b, a] ;
    etc
 The order of your causes is important.
*/


