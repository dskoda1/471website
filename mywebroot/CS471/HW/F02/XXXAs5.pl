/*
        CS471 - Programming Languages
        Section: <YOUR Section number>
        Assignment #<number> due: <DATE>
        Author: <LastName>, <FirstName> (<EMail>)
        Date: <DATE>
*/


Written question.

% 1.sublist... Explain what is going on.

subList2(S,L):-append(H,S,P),append(P,T,L).
subList1(S,L):-append(P,T,L),append(H,S,P).
subList3(S,L):-append(S,ST,T),append(H,T,L).
subList4(S,L):-append(H,T,L),append(S,ST,T).


%1. grammar from HW2 



% 2. append3DL ...



% 3. numOfAtoms(Lst, NofAtoms).
%      ?-numOfAtoms([1,[a,s,d],[s,s,[1,4,5],[d,f,g]],[x,c,v]],NA)
%      NA = 15
%      ?- numOfAtoms([[],[1,[a,s,d],[s,s,[1,4,5],[d,f,g]],[]],[x,c,v]],NA).
%      NA = 15 





% 4. Parity FSM 






% 5:% Op is either the operator times or plus, 
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



% show(ExpTree).
% eval(ExpTree,Value).