/*
        CS471 - Programming Languages
        Section: <YOUR Section number>
        Assignment #<number> due: <DATE>
        Author: <LastName>, <FirstName> (<EMail>)
        Date: <DATE>
*/
subList1(S,L):-append(H,S,P),append(P,T,L).
subList2(S,L):-append(P,T,L),append(H,S,P).
subList3(S,L):-append(S,ST,T),append(H,T,L).
subList4(S,L):-append(H,T,L),append(S,ST,T).


fill(X,N,L) :- length(L,N), append([X],Lx,L), append(Lx,[X],L). 



% 1. grammar for HW2 

s --> [1], s, [0].
s --> [+],[1],[=], [1].

% 2. append3DL ...

append3DL(A-B, B-C, C-D, A-D).

% 3. numOfAtoms(Lst, NofAtoms).
%      ?-numOfAtoms([1,[a,s,d],[s,s,[1,4,5],[d,f,g]],[x,c,v]],NA)
%      NA = 15
%      ?- numOfAtoms([[],[1,[a,s,d],[s,s,[1,4,5],[d,f,g]],[]],[x,c,v]],NA).
%      NA = 15 




numOfAtoms([H|T],NA):- 
	numOfAtoms(H,NH), 
	numOfAtoms(T,NT), 
	NA is NH + NT.

numOfAtoms([],0).
numOfAtoms(E,1).


% 4. FSM 

final(q0).
final(q1).
delta(q0,0,q1).
delta(q0,1,q3).
delta(q1,0,q0).
delta(q1,1,q2).
delta(q2,0,q3).
delta(q2,1,q1).
delta(q3,0,q2).
delta(q3,1,q0).

start(q0).

accept(Str):-start(S),deltaHat(S,Str,F),final(F).
deltaHat(Q,[],Q).
deltaHat(Q,[C|CS],F):- delta(Q,C,N),deltaHat(N,CS,F).





% 5:  Expression Tree
% Op is either the operator times or plus, 
%    Lv is the left value, Rv is the right value.
% exp(const, V) represents the constant with the value V.

exp(Op,Lv,Rv). 
exp(const,V).

%Two examples of expression trees.

tree1(exp(plus,
	exp(const, 5), 
	exp(times, 
	     exp(const, 3), 
	     exp(const, 2)
	 )
     )
 ).


tree2(exp(times,
	exp(times, 
	     exp(const, -3), 
	     exp(const, 2)
	 ),

	exp(plus, 
	     exp(const, 3), 
	     exp(const, 2)
	 )
     )
 ).



% Pretty Print of tree.  Show the tree "sideways"

show(Tree) :- write('Tree =' ), nl,nl, showHp(Tree,0).

% Helper procedure for displaying tree.

showHp(exp(const, Value),Indent):-
     tab(Indent + 2), write(Value),nl. % display root value if this tree
 
showHp(exp(Value, L, R),Indent):-
    Ind2 is Indent + 2,  % Indentions of 2 for subtree
    showHp(R, Ind2),      % Display right subtree
    tab(Indent), write(Value),nl, % display root value if this tree
    showHp(L,Ind2).       % Display left subtree



eval(exp(plus,X,Y),Value) :-
  eval(X,XValue),
  eval(Y,YValue),
  Value is XValue + YValue.

eval(exp(times, X,Y) ,Value) :-
  eval(X,XValue),
  eval(Y,YValue),
  Value is XValue * YValue.

eval(exp(const,X),X).





