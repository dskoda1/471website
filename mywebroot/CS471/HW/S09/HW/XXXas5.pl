/*******************************************************************
        CS471 - Programming Languages
        Section: <YOUR Section number>
        Assignment #<number> due: <DATE>
        Author: <LastName>, <FirstName> (<EMail>)
        Date: <DATE>
*/



/*   Do not turn in for grading:
     Using help() or XPCE browsers  --
     What are the 3 representation of integers used in the SWIPL's prolog?
     What is a rational number in SWIPL?
     What is the meaning of the following operators:
       / , // , rdiv , mod , rem , truncate , round 


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




/* 2: Syntax-Directed Differentiation:  A motivating example illustrating the 
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





/* 3: Define the predicate, 'evaluate', that uses the result from 
      differentiation (above) and a list of values for each variable and 
      computes the resulting value. e.g.

    ?- d(3*(x +2*x*x),x,Result), VarValue=[x/3], evaluate(Result,Value,VarValue).
    Result = 3* (1+ (2*x*1+x*2))+ (x+2*x*x)*0
    VarValue = [x/3]
    Value = 39
*/




/* 4: Assume your have a list of  nested lists of numbers.  If a list of numbers
     is empty then the value (sum) is 0. Define a predicate totalSum/2 that
     returns the sum of all numbers.  
     ?- totalSum([2,[1,2,[1,[2]]],[3],[[[],[1,2,3],[5]]]],S).
     S = 22 
     Yes
    This can be done in 3 clauses.

*/


/* Use the following to solve problem 5.
*/

coin(dollar, 100).
coin(half, 50).
coin(quarter, 25).
coin(dime,10).
coin(nickel,5).
coin(penny,1).

/* 5: 
      Write a predicate change/2 that given the change amount, computes the ways 
      in which we can give change.  Use USA's  coin denominations, 
      represented by the "coin" facts from the first prolog assignment.
      
      The predicate "change" is such that an positive integer S, 
      change(S,T) "returns" a list of tuples, T, where the tuple contains the
      name of the denomination (Name,Count), 
      the atom Name of the denomination and integer Count that gives 
      the number of coins of each denomination in D that add up to S.
      For example::
        ?- change(127,L).
        L = [ (dollar, 1), (quarter, 1), (penny, 2)] 
        Yes
        ?- change(44,L).
        L = [ (quarter, 1), (dime, 1), (nickel, 1), (penny, 4)] ;
        L = [ (quarter, 1), (dime, 1), (penny, 9)] ;
        L = [ (quarter, 1), (nickel, 3), (penny, 4)] ;
        L = [ (quarter, 1), (penny, 19)] ;
        L = [ (dime, 4), (penny, 4)] ;
        L = [ (nickel, 8), (penny, 4)] ;
        L = [ (penny, 44)] ;
        No
      
      The Coin Changing is an interesting problem usually studied in
      Algorithms.  http://condor.depaul.edu/~rjohnson/algorithm/coins.pdf has a 
      nice discussion.
      Think about --- 
         1) How could we generalize this problem to handle different 
            denominations?  
         2) What are the different techinques to find the change with the
            fewest number of coins ?         
         3) What happens if the order of the "coin" facts change? 
      

*/


