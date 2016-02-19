/*******************************************************************
        CS471 - Programming Languages
        Section: <YOUR Section number>
        Assignment #<number> due: <DATE>
        Author: <LastName>, <FirstName> (<EMail>)
        Date: <DATE>
*/



% 1: GIVEN:
% Expression Tree representation.

% Op is any Prolog operator
%    Lv is the left value, Rv is the right value.
% exp(const, V) represents the constant with the value V.


%Three types of expression trees.

%exp(Op,Lt,Rt).
% exp(const,Value).
% exp(Op,T).


%Write 
%  eval(Tree,Value).
% which succeeds if Value is the result of computing the expressions represented by Tree



/*  *******************  Example Output  **********************
?- eTree4(T),eval(T,V).
T = exp(float, exp(sin, exp(/, exp(const, pi), exp(const, 2))))
V = 1.0
yes

?- eTree1(T),eval(T,V).
T = exp(+, exp(const, 5), exp(*, exp(const, 3), exp(const, 2)))
V = 11
************************************************************/

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







