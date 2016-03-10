:-dynamic
start/1,
final/1,
delta/3.
/* In order to use dynamic we it seems we need some functors defined that
we will dynamically retract and asserta.
***************/

start(empty). 
final(empty). 
delta(empty,empty,empty). 


/*
        CS471 - Programming Languages
        Section: <YOUR Section number>
        Assignment #<number> due: <DATE>
        Author: <LastName>, <FirstName> (<EMail>)
        Date: <DATE>
*/

subList1(S,L):-append(_,S,P),append(P,_,L).
subList2(S,L):-append(P,_,L),append(_,S,P).
subList3(S,L):-append(S,_,T),append(_,T,L).
subList4(S,L):-append(_,T,L),append(S,_,T).

fill(X,N,L) :- length(L,N), append([X],Lx,L), append(Lx,[X],L).	



% 1. append3DL ...



% 2. powerset(+Set,-PowerSet) -- you may use append and a "helper"
% predicate. The base case is provided.


powerset([],[[]]).


% From assignment 4

myMerge([],L2,L2).
myMerge(L1,[],L1).
myMerge([H1|T1],[H2|T2],[H1|Mt]):-H1@=<H2,myMerge(T1,[H2|T2],Mt).
myMerge([H1|T1],[H2|T2],[H2|Mt]):-H2@<H1,myMerge([H1|T1],T2,Mt).




%3 partition(+Lst, -Part1, -Part2).



%4 mergesortX(+UnsortedLst, -Sorted).


%5. singleList(NestedLst, SingleLst).  (Use only append and recursion)


%6. genPyth(N).	 
% Hints: There are two different approaches.  
% One way is to use Backtracking and the ideas about "for" loops.
% Another is to Tail recursion.
% Both solutions require many rules. 


%7.  add new rules
% addStart(S)
% addFinal(S)
% addDelta(From,A,To)


%8. FSM 

% These are examples of rules to a FSM to do parity.
% final(q0).
% final(q1).
% delta(q0,0,q1).
% delta(q0,1,q3).
% delta(q1,0,q0).
% delta(q1,1,q2).
% delta(q2,0,q3).
% delta(q2,1,q1).
% delta(q3,0,q2).
% delta(q3,1,q0).

% start(q0).

% accept(Str)
% deltaHat(State, String, State).


% 9:  Expression Tree
% Op is any Prolog operator
%    Lv is the left value, Rv is the right value.
% exp(const, V) represents the constant with the value V.

%Two examples of expression trees.

% exp(Op,Lt,Rt).
% exp(const,Value).
% exp(Op,T).

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


/*  *******************************************************************

?- tree4(T),eval(T,V).
 
T = exp(float, exp(sin, exp(/, exp(const, pi), exp(const, 2))))
V = 1.0
yes

?- tree1(T),eval(T,V).
T = exp(+, exp(const, 5), exp(*, exp(const, 3), exp(const, 2)))
V = 11
*/


% Pretty Print of tree.  Show the tree "sideways"

show(Tree) :- write('Tree =' ), nl,nl, showHp(Tree,0).

% Helper procedure for displaying tree.
