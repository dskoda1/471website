/*******************************************************************
        CS471 - Programming Languages
        Section: <YOUR Section number>
        Assignment #<number> due: <DATE>
        Author: <LastName>, <FirstName> (<EMail>)
        Date: <DATE>
*/




/* 1: Below are 3 structures that representation expression trees using Prolog.
        (Op is any Prolog operator.)

     expTree(Op,Lt,Rt).
     expTree(lit,Value).
     expTree(Op,T).

    Write a Prolog program:
         eval(Tree,Value).
    which succeeds if Value is the result of computing the expressions 
    represented by an expression tree.  For example:

   ?- eTree4(T),eval(T,V).
   T = expTree(float, expTree(sin, expTree(/, expTree(lit, pi), expTree(lit, 2))))
   V = 1.0
   Yes

   ?- eTree1(T),eval(T,V).
   T = expTree(+, expTree(lit, 5), expTree(*, expTree(lit, 3), expTree(lit, 2)))
   V = 11

   Below are some trees you can use for testing.
*/
eTree1(expTree('+',
	      expTree(lit, 5),
	      expTree('*',
	           expTree(lit, 3),
	           expTree(lit, 2)
	       )
       )
 ).


eTree2(expTree('*',
	expTree('-', 
	     expTree(lit, -3),
	     expTree(lit, 2)
	 ),

	expTree('+', 
	      expTree(lit, 3),
	      expTree('-',
		     expTree(lit, 2)
		   )
	   )
	 )
 ).

eTree3(expTree('*',
	expTree('min', 
	     expTree(lit, -3),
	     expTree(lit, 2)
	 ),

	expTree('+', 
	     expTree(lit, 3),
	     expTree('-',
		    expTree(lit, 2)
		    )
	     )
	 )
 ).


eTree4(expTree(float,
	   expTree('sin',
	        expTree('/',
		       expTree(lit, pi),
		       expTree(lit, 2)
		     )
	    )
	   )

 ).



/* 2A: DONE IN Ass 3 Syntax-Directed Differentiation:  
         A motivating example illustrating the 
         power of pattern matching in Prolog.
         Consider the following rules for symbolic differentiation
         (U, V are mathematical expressions, x is a variable):

        dx/dx = 1
        d(C)/x = 0.
        d(Cx)/x = C               (C is a litant)
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
        additional processing .  See next problem.
*/
% Solution %

d(x,x,1).
d(C,x,0):-number(C).
d(C*x,x,C):-number(C).
d(-U, X, -DU) :- d(U, X, DU).
d( U + V, x, RU + RV ):-d(U,x,RU), d(V,x,RV).
d( U - V, x, RU - RV ):-d(U,x,RU), d(V,x,RV).
d(U * V,x, U * DV + V * DU):- d(U,x,DU), d(V,x,DV).
d(U**N, x, N*U**N1*DU) :- integer(N), N1 is N-1, d(U, x, DU).



/* 2: Above is the programmed Syntax-Directed Differentiation.
      Define the predicate, 'evaluate', that uses the result from 
      differentiation and a list of values for each variable and 
      computes the resulting value. e.g.

    ?- d(3*(x +2*x*x),x,Result), VarValue=(x/3), evaluate(Result,Value,VarValue).
    Result = 3* (1+ (2*x*1+x*2))+ (x+2*x*x)*0
    VarValue = (x/3)
    Value = 39
*/


/* 3:Define a predicate, listOfTerms(ListOfArgs,Name, ListOfResults), 
     where each term in the ListOfResults is a term with one argument 
     from the ListOfResults and the functor name is the Name.

          ?- listOfTerms([a,b,23,4],foo,T).
          T = [foo(a), foo(b), foo(23), foo(4)]
          Yes
     (see page 577 in Scott)
 */



%4 Do exercise 11.14 page 585.  You may have use two functors.
%  One for the outer loop and one for the inner loop.


%5 Do exercise 11.15 page 585.  Follow the hint in the text book.


