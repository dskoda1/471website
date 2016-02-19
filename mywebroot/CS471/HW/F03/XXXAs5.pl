:-dynamic
start/1,
final/1,
delta/3.

/* To use retract and asserta dynamically we need to declare them dynamic and give some
 * dummy functors.
***************/
start(empty).
final(empty).
delta(empty,empty,empty).

/*******************************************************************
        CS471 - Programming Languages
        Section: <YOUR Section number>
        Assignment #<number> due: <DATE>
        Author: <LastName>, <FirstName> (<EMail>)
        Date: <DATE>
*/

%%%%%  Code for you to experiment with

subList1(S,L):-append(_,S,P),append(P,_,L).
subList2(S,L):-append(P,_,L),append(_,S,P).
subList3(S,L):-append(S,_,T),append(_,T,L).
subList4(S,L):-append(_,T,L),append(S,_,T).


fill(X,N,L) :- length(L,N), append([X],Lx,L), append(Lx,[X],L). 



% 1. append3DL ... ONE Fact




%2. powerset(+Set,-PowerSet) -- you may use append and a "helper" predicate.




%3. countLists(NestedLst, NumList).  (Use only addition and recursion and two facts)
%  ?- countLists([1,[1,2],2,[a,b,c,[c,d],f],3,[1,2]], S).
%  S = 5
%  ?- countLists([[[a],[]],[b,c,[d],e,f,[abc],e],[1,2,3]],S).
%  S = 8 ;
%  ?- countLists([[[a]]],S).
%  S = 3



%4. Knapsack Problem --- See Other file.


%5.  Code to add rules for a FSM.  You will need to add 
%    start, final and delta rules dynamically.
%    addStart(S), addFinal(S) and addDelta(From,Alphabet,To)
%    I have provided addStart(S).  You will need to use the functor names
%    final and delta.

addStart(S):-asserta(start(S)).

%6. FSM
% accept(Str), deltaHat(Q,Str,Final).


% 7. Declarative Square Root for Integers:




%7B: sort(UnSorted,Sorted).

% 8. Newton's algorithm for finding the square root.
% You will have to define a helper predicate that will help improve each guess.
% The idea is to improve the answer(guess) until it is close enough 
% so that its square differs from the radicand by less than a predetermined 
% tolerance (for this code use  0.0001).
% 
% squareRt(X,Root)





% 9&10:  Expression Tree
% Op is any Prolog operator
%    Lv is the left value, Rv is the right value.
% exp(const, V) represents the constant with the value V.


%Three types of expression trees.

% exp(Op,Lt,Rt).
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




% 9. show(Tree)




%10. eval(Tree,Value).





/*  *******************  Example Output  **********************
?- tree4(T),eval(T,V).
T = exp(float, exp(sin, exp(/, exp(const, pi), exp(const, 2))))
V = 1.0
yes

?- tree1(T),eval(T,V).
T = exp(+, exp(const, 5), exp(*, exp(const, 3), exp(const, 2)))
V = 11

***********************   End   ************************/






