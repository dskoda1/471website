/* 1: Define a predicate "simplity/3" that succeeds if the last arguement is 
      a list with items with the form Var:Value,  
      the first argument is a "var" atom in the list and 
      the second argument is the var's Value.  Requires only one clause.
      (hint::member, atom).
      ?- simplify(b,Value,[a:100,b:(-5)]).
      Value = -5
      ?- simplify(b,Value,[a : 1,b : 5]).
      Value = 5 .
      */
      
      
/* 2: Now extend predicate "simplity/3" to  evaluates an algebraic expression.
   The algebraic expression consists of variable with operators 'plus', 
   'minus' and 'times'. Here are two test queries:
          ?- simplify(plus(times(x,y),times(3 ,minus(x,y))),V,[x:4,y:2]).
          V = 14
          ?- simplify(times(2,plus(a,b)),Val,[a:1,b:5]).
          Val = 12
          ?- simplify(times(2,plus(a,b)),Val,[a:1,b:(-5)]).
          Val = -8 .
    Requires only 5 more clauses.  You may use "number" in one of your clauses.      
*/

simplify(Var,Value,Vars):-atom(Var),member(Var:Value,Vars).
simplify(plus(A, B),CV,Vars):-simplify(A,AV,Vars),simplify(B,BV,Vars),CV is AV+BV.
simplify(minus(A,B),CV,Vars):-simplify(A,AV,Vars),simplify(B,BV,Vars),CV is AV-BV.
simplify(times(A,B),CV,Vars):-simplify(A,AV,Vars),simplify(B,BV,Vars),CV is AV*BV.
simplify(Num,Num,Vars):-number(Num).

/* 3: (Do not turn in.)
   Given the 4 logically equivalent predicates try to predict the outcome of 
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


