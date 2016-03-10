mys(N, E,L):- length(L,N), append([E], A, L), append(A,[E],L).


simp(Var,Value,Vars):-atom(Var),member(Var/Value,Vars).

/*Inclass: Not done...
           Complete predicate simplify(Exp, Value, Vars), which simplifies an 
           algebraic expression to its value given a list of values for each 
           variable.  The algebraic expression consists of variable with 
           operators +, - and *. Here are two test queries:
          ?- simplify(plus(times(x,y),times(3 ,minus(x,y))),V,[x/4,y/2]).
          V = 14
          Yes
          ?- simplify(times(2,plus(a,b)),Val,[a/1,b/5]).
          Val = 12mys
          Yes
*/

simplify(plus(A, B),CV,Vars):-simplify(A,AV,Vars),simplify(B,BV,Vars),CV is AV+BV.
simplify(minus(A,B),CV,Vars):-simplify(A,AV,Vars),simplify(B,BV,Vars),CV is AV-BV.
simplify(times(A,B),CV,Vars):-simplify(A,AV,Vars),simplify(B,BV,Vars),CV is AV*BV.
simplify(Num,Num,Vars):-number(Num).
simplify(Var,Value,Vars):-atom(Var),member(Var/Value,Vars).

/* Do not turn in.  Try to predict the outcome of 
   ?- subList1(X,[a]),fail.
   ?- subList2(X,[a]),fail.
   ?- subList3(X,[a]),fail.
   ?- subList4(X,[a]),fail.
   Try to understand why some produce "ERROR: Out of global stack"

*/ 
subList1(S,L):-append(_,S,P),append(P,_,L).
subList2(S,L):-append(P,_,L),append(_,S,P).
subList3(S,L):-append(S,_,T),append(_,T,L).
subList4(S,L):-append(_,T,L),append(S,_,T).

/* Using writes to see the backtracking */

subList1w(S,L):-write('1-1'),append(_,S,P),write(' 1-2'),write(P),append(P,_,L).
subList2w(S,L):-write('2-1'),append(P,_,L),write(' 2-2'),write(P),append(_,S,P).
subList3w(S,L):-write('3-1'),append(S,_,T),write(' 3-2'),write(T),append(_,T,L).
subList4w(S,L):-write('4-1'),append(_,T,L),write(' 4-2'),write(T),append(S,_,T).


