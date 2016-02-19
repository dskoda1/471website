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

 

/*2: Write a procedure numBinaryOp/2 which counts the number of 
     binary operators in an expTree.
      e.g.
    ?- eTree2(T),numBinaryOp(T,V).
    T = expTree(*, expTree(-, expTree(lit, -3), expTree(lit, 2)), 
        expTree(+, expTree(lit, 3), expTree(-, expTree(lit, 2))))
    V = 3 
    Yes
*/


/*3:  Write a procedure listOfOps/2 which creates a list of all the operators
      in an expTree.  The operators should be listed in pre-order. e.g.
      ?- eTree4(T),listOfOps(T,V).
      T = expTree(float, expTree(sin, expTree(/, expTree(lit, pi), 
                                                 expTree(lit, 2))))
      V = [float, sin, /] 
      ?- eTree3(T),listOfOps(T,V).
      T = expTree(*, expTree(min, expTree(lit, -3), expTree(lit, 2)), 
                     expTree(+, expTree(lit, 3), expTree(-, expTree(lit, 2))))
      V = [*, min, +, -] 
*/





/* 4: In homework 4-problem 8 you programmed Syntax-Directed Differentiation.
      You should include the code for testing.
      Define the predicate, 'evaluate', that uses the result from 
      differentiation and a list of values for each variable and 
      computes the resulting value. e.g.

    ?- d(3*(x +2*x*x),x,Result), VarValue=(x/3), evaluate(Result,Value,VarValue).
    Result = 3* (1+ (2*x*1+x*2))+ (x+2*x*x)*0
    VarValue = (x/3)
    Value = 39
*/




/*5: Do exercise 11.14 page 585.  You may have use two functors.
     One for the outer loop and one for the inner loop.
*/


/*6: Do exercise 11.15 page 585.  Follow the hint in the text book.
 */


