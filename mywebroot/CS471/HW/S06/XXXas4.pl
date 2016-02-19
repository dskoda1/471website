/*******************************************************************
        CS471 - Programming Languages
        Section: <YOUR Section number>
        Assignment #<number> due: <DATE>
        Author: <LastName>, <FirstName> (<EMail>)
        Date: <DATE>
*/
/* In class
   Define a predicate simplify(Var, Value, Vars) that given a list Vars of variables and their values unifies the Value with the current value of Var.  Vars has the form [x/5, y/10], where x is an atomic representing a variable and '/' is the separator for the associated numerical value.  {Hint try using member and pattern matching} {Include this rule in problem 3 below.}
  ?- Vars=[x/5, y/10], simplify(x,VX,Vars), simp(y,VY,Vars).
  Vars = [x/5, y/10]
  VX = 5
  VY = 10
  Yes

      
*/

simplify(Var,Value,Vars):-atom(Var),member(Var/Value,Vars).
/*Inclass: Complete predicate simplify(Exp, Value, Vars), which simplifies an algebraic expression 
        to its value given a list of values for each variable.  The algebraic expression consists 
        of variable with operators +, - and *. Here are two test queries:
          ?- simplify(plus(times(x,y),times(3 ,minus(x,y))),V,[x/4,y/2]).
          V = 14
          Yes
          ?- simplify(times(2,plus(a,b)),Val,[a/1,b/5]).
          Val = 12
          YES

 
*/



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



/* There are two programming problems due before class on Wed.  There is one challenge
   problem.
*/


/* 1: Below are 3 structures that representation expression trees using Prolog.
        (Op is any Prolog operator.)

     expTree(Op,Lt,Rt).
     expTree(const,Value).
     expTree(Op,T).

    Write a Prolog program:
         eval(Tree,Value).
     which succeeds if Value is the result of computing the expressions represented by an 
     expression tree.  For example:

     ?- eTree4(T),eval(T,V).
     T = expTree(float, expTree(sin, expTree(/, expTree(const, pi), expTree(const, 2))))
     V = 1.0
     yes

     ?- eTree1(T),eval(T,V).
     T = expTree(+, expTree(const, 5), expTree(*, expTree(const, 3), expTree(const, 2)))
     V = 11

    Below are some trees you can use for testing.
*/
eTree1(expTree('+',
	expTree(const, 5),
	expTree('*',
	     expTree(const, 3),
	     expTree(const, 2)
	 )
     )
 ).


eTree2(expTree('*',
	expTree('-', 
	     expTree(const, -3),
	     expTree(const, 2)
	 ),

	expTree('+', 
	     expTree(const, 3),
	     expTree('-',
		 expTree(const, 2)
		)
	   )
	 )
 ).

eTree3(expTree('*',
	expTree('min', 
	     expTree(const, -3),
	     expTree(const, 2)
	 ),

	expTree('+', 
	     expTree(const, 3),

	     expTree('-',
		 expTree(const, 2)
		)
	   )
	 )
 ).


eTree4(expTree(float,
	expTree('sin',
	     expTree('/',
		 expTree(const, pi),
		 expTree(const, 2)
		 )
	    )
	  )

      ).

 /* Famous code originally written in Pascal by Wirth to print 
     a representation of a tree "sideways"
*/
showE(Tree) :- write('Tree =' ), nl,nl, showEHp(Tree,0).

%%     Helper procedure for displaying tree.

showEHp(expTree(const, Value),Indent):-
     tab(Indent + 2), write(Value),nl. % display root value if this tree

showEHp(expTree(Op, L, R),Indent):-
    name(Op,S),length(S,Len),
    Ind2 is Indent + Len +1 ,  % Indentions of L for subtree 
			       %(ok to use 2 instead of Len)
    showEHp(R, Ind2),           % Display right subtree
    tab(Indent), write(Op),nl, % display root value if this tree
    showEHp(L,Ind2).            % Display left subtree

showEHp(expTree(Op, U),Indent):-
    name(Op,S),length(S,Len),
    Ind2 is Indent + Len + 1,  % OK to us a constant instead of Len
    showEHp(U, Ind2),           % Display right subtree (for unary operator)
    tab(Indent), write(Op),nl. % display root value if this tree

/************ answer ***************/ 


/* 2:  Syntax-Directed Differentiation:  A motivating example illustrating the 
         power of pattern matching in Prolog.
         Consider the following rules for symbolic differentiation
         (U, V are mathematical expressions, x is a variable):

        dx/dx = 1
        d(C)/x = 0.
        d(Cx)/x = C               (C is a constant)
        d(-U)/dx = -(dU/dx)
        d(U+V)/dx = dU/dx + dV/dx
        d(U-V)/dx = dU/dx - dV/dx
        d(U*V)/dx = U*(dV/dx) + V*(dU/dx)
        d(U^n)/dx = nU^(n-1)*(dU/dx)

        These rules can easily be translated into Prolog, for instance,
        the second rule can be defined as
                 d(C,x,0):-integer(C).
          and the fourth rule can be defined as
                   d(U+ V ,x, DU+ DV)):-d(U,x,DU),d(V,x,DV).

         Write the remaining rules. Here is a test query:

            ?- d(3*(x +2*x*x),x,Result).
            Result = 3* (1+ (2*x*1+x* (2*1+x*0)))+ (x+2*x*x)*0 ;
            NO

        Keep in mind, though, that terms such as U+V are still trees with the functor at the root, 
        and that evaluation of such terms requires additional processing .  See next problem.
*/



/* 3: Challenge- Define the predicate, compute, that uses the result from differentiation and
                 a list of values for each variable and computes the resulting value. e.g.

         ?- d(3*(x +2*x*x),x,Result), VarValue=(x/3), compute(Result,Value,VarValue).
            Result = 3* (1+ (2*x*1+x*2))+ (x+2*x*x)*0
            VarValue = (x/3)
            Value = 39

*/
