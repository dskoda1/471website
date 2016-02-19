/*******************************************************************
        CS471 - Programming Languages
        Section: <YOUR Section number>
        Assignment #<number> due: <DATE>
        Author: <LastName>, <FirstName> (<EMail>)
        Date: <DATE>
*/


/*Wed class: Complete predicate simplify(Exp, Value, Vars), which simplifies an 
           algebraic expression to its value given a list of values for each 
           variable.  The algebraic expression consists of variable with 
           operators +, - and *. Here are two test queries:
          ?- simplify(plus(times(x,y),times(3 ,minus(x,y))),V,[x/4,y/2]).
          V = 14
          Yes
          ?- simplify(times(2,plus(a,b)),Val,[a/1,b/5]).
          Val = 12
          Yes
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



/* 1: Below are 3 structures that representation expression trees using Prolog.
      (Op is any Prolog operator. Solutions requires only 3 clauses)

     expTree(Op,Ltree,Rtree).
     expTree(const,Value).
     expTree(Op,Tree).

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
          and the fifth rule can be defined as
                   d(U+ V ,x, DU+ DV)):-d(U,x,DU),d(V,x,DV).

         Write the remaining rules. Here is a test query:

            ?- d(3*(x +2*x*x),x,Result).
            Result = 3* (1+ (2*x*1+x* (2*1+x*0)))+ (x+2*x*x)*0 ;
            NO

        Keep in mind, though, that terms such as U+V are still trees with the
        functor at the root, and that evaluation of such terms requires 
        additional processing .  See next problem.  (Solution needs one clause
        for each rule above.)
*/



/* 3: Define the predicate, compute, that uses the result from 
        differentiation and a list of values for each variable and 
        computes the resulting value. e.g.

    ?- d(3*(x +2*x*x),x,Result), VarValue=(x/3), compute(Result,Value,VarValue).
    Result = 3* (1+ (2*x*1+x*2))+ (x+2*x*x)*0
    VarValue = (x/3)
    Value = 39
*/



%4: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %    powerset(+Set,-PowerSet).
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
/*  Define a procedure powerset(+Set,-PowerSet),given a Set, represented by
    a list, it creates the powerset of Set. e.g. 

  ?- powerset([],X).
  X = [[]]
  ?- powerset([1],X).
  X = [[],[1]]  % order of sets not important
  ?- powerset([a,b],P).
  P = [[a,b], [a], [b], []]      
 
  % order of sets not important  
       ?- powerset(S,[[a],[b],[a,b],[]]).
  % May run out of stack ... 
  % Your code does not need to work for this query.
       ?- powerset([a,b],[[a],[b],[a,b],[]]).
  %  may run out of stack ... YOUr code does not need
  %  to work for this query.
  
  There are a number of different approaches.  The maximum number of lines of
  code needed is 4.  Some solutions require only 3.
****/




