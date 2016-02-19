/*******************************************************************
        CS471 - Programming Languages
        Section: <YOUR Section number>
        Assignment #<number> due: <DATE>
        Author: <LastName>, <FirstName> (<EMail>)
        Date: <DATE>
*/


/* What is the prepose of "..="?

   Do not turn in.  Try to predict the outcome of 
   ?- subList1(X,[a]),fail.
   ?- subList2(X,[a]),fail.
   ?- subList3(X,[a]),fail.
   ?- subList4(X,[a]),fail.
   Try to understand why some queries produce "ERROR: Out of global stack"


*/ 
subList1(S,L):-append(_,S,P),append(P,_,L).
subList2(S,L):-append(P,_,L),append(_,S,P).
subList3(S,L):-append(S,_,T),append(_,T,L).
subList4(S,L):-append(_,T,L),append(S,_,T).

/* 1: Below are 3 structures that representation expression trees using Prolog.
        (Op is any Prolog operator.)

     expTree(Op,Lt,Rt).
     expTree(const,Value).
     expTree(Op,T).

    Write a Prolog program:
         eval(Tree,Value).
    which succeeds if Value is the result of computing the expressions 
    represented by an expression tree.  For example:

   ?- eTree4(T),eval(T,V).
   T = expTree(float, expTree(sin, expTree(/, expTree(const, pi), expTree(const, 2))))
   V = 1.0
   Yes

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
    a "sideways" representation of a binary tree.
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



/* 2:  Syntax-Directed Differentiation:  A motivating example illustrating the 
       power of pattern matching in Prolog.  Consider the following rules for 
       symbolic differentiation
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
                   d(C,x,0):-number(C).
          and the fourth rule can be defined as
                   d(U+V ,x, DU+ DV)):-d(U,x,DU),d(V,x,DV).

         Program the remaining rules. Here is a test query:

            ?- d(3*(x +2*x*x),x,Result).
            Result = 3* (1+ (2*x*1+x* (2*1+x*0)))+ (x+2*x*x)*0 ;
            NO

        Keep in mind, though, that terms such as U+V are still trees with the
        functor at the root, and that evaluation of such terms requires 
        additional processing .  See next problem.
*/



/* 3: Define the predicate, compute, that uses the result from 
      differentiation and a list of values for each variable and 
      computes the resulting value. e.g.

    ?- d(3*(x +2*x*x),x,Result), VarValue=(x/3), compute(Result,Value,VarValue).
    Result = 3* (1+ (2*x*1+x*2))+ (x+2*x*x)*0
    VarValue = (x/3)
    Value = 39
*/


