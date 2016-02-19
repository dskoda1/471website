/*******************************************************************
        CS471 - Programming Languages
        Assignment #<number> due: <DATE>
        Author: <LastName>, <FirstName> (<EMail>)
        Date: <DATE>
*****************************************************************/

/* The only built-predicates you may use are:
     is, //, /, +, -, ^, *,=.., 
     atom, is_list, functor, arg, integer, number, member, append
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

   ?- eTree1(T),eval(T,V).
   T = expTree(+, expTree(lit, 5), expTree(*, expTree(lit, 3), expTree(lit, 2)))
   V = 11

   Below are trees you can use for testing.
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

eval(expTree(Op,ExpTree), Value):-
	eval(ExpTree,LValue), 
	OpExpTree=..[Op,LValue],
	Value is OpExpTree.

eval(expTree(Op,LExpTree,RExpTree),Value):-
	eval(LExpTree,LValue), 
	eval(RExpTree,RValue),
	OpExpTree=..[Op,LValue,RValue],
	Value is OpExpTree.
	
eval(expTree(lit,V),V). 


/* 2: In the last homework we had the following problem:
Syntax-Directed Differentiation:  A motivating example illustrating the 
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
                   d(C,x,0):-number(C).
          and the fifth rule can be defined as
                   d(U + V ,x, DU + DV)):-d(U,x,DU),d(V,x,DV).

         Write the remaining rules. Here is a test query:

            ?- d(3*(x +2*x*x),x,Result).
            Result = 3* (1+ (2*x*1+x* (2*1+x*0)))+ (x+2*x*x)*0 ;
            NO

Below is my solution.

      Keep in mind, though, that terms such as U+V are still trees with the
      functor at the root, and that evaluation of such terms requires 
      additional processing which you will complete.
        
     Define the predicate, 'evaluate', that uses the result from 
     differentiation (above) and a list of values for each variable and 
     computes the resulting value. e.g.

    ?- d(3*(x +2*x*x),x,Result), VarValue = x:3 , evaluate(Result,Value,VarValue).
    Result = 3* (1+ (2*x*1+x*2))+ (x+2*x*x)*0
    VarValue = x:3
    Value = 39
    ?- d((3*x) ^ 4,x,Result), VarValue = x:2 , evaluate(Result,Value,VarValue).
    Result = 4* (3*x)^3*3,
    VarValue = x:2,
    Value = 2592 .
 */
/* 2: Following is my solution to problem 5:(Syntax-Directed Differentiation.)
   from homework assignment 4.  Keep in mind, though, that terms such as U+V 
   are still trees with the functor at the root, and that evaluation of 
   such terms requires additional processing which you will complete.
      
    Define the predicate, 'evaluate', that uses the result from 
    differentiation (below) and a list of values for each variable and 
    computes the resulting value. e.g.

    ?- d(3*(x +2*x*x),x,Result), VarValue = x:3 , evaluate(Result,Value,VarValue).
    Result = 3* (1+ (2*x*1+x*2))+ (x+2*x*x)*0,
    VarValue = x:3,
    Value = 39 .    
    ?- d((3*x) ^ 4,x,Result), VarValue = x:2 , evaluate(Result,Value,VarValue).
    Result = 4* (3*x)^3*3,
    VarValue = x:2,
    Value = 2592 .
*/
     
    


d(x,x,1).
d(C,x,0):-number(C).
d(C*x,x,C):-number(C).
d(-U, X, -DU) :- d(U, X, DU).
d( U + V, x, RU + RV ):-d(U,x,RU), d(V,x,RV).
d( U - V, x, RU - RV ):-d(U,x,RU), d(V,x,RV).
d(U * V,x, U * DV + V * DU):- d(U,x,DU), d(V,x,DV).
d(U ^ N, x, N*U ^ N1*DU) :- integer(N), N1 is N-1, d(U, x, DU).


/******************* solution **************************/

evaluate(A+B,CV,Vars):-evaluate(A,AV,Vars),evaluate(B,BV,Vars),CV is AV+BV.
evaluate(A-B,CV,Vars):-evaluate(A,AV,Vars),evaluate(B,BV,Vars),CV is AV-BV.
evaluate(A*B ,CV,Vars):-evaluate(A,AV,Vars),evaluate(B,BV,Vars),CV is AV*BV.
evaluate(A ^ B ,CV,Vars):-evaluate(A,AV,Vars),evaluate(B,BV,Vars),CV is AV ^ BV.
evaluate(Num,Num,Vars):-number(Num).
evaluate(Var,Value,Var:Value):-atom(Var).

eval2(Num,Num,Vars):-number(Num).
eval2(Var,Value,Var:Value):-atom(Var).
eval2(EXP,CV,Vars):-
    functor(EXP,OP,NA),
    arg(1,EXP,A),
    arg(2,EXP,B),    
    eval2(A,AV,Vars),
    eval2(B,BV,Vars),
    EvalExp =.. [OP,AV,BV],
    CV is EvalExp.


/* 3: Define a predicate, sumList/2 that succeeds if the first argument is
      a list of a lists of numbers and the second argument is the sum of all
      the numbers. 
      ?- sumList([2,[1,2,[1,[2]]],[3],[[[],[1,2,3],[5]]]],S).
      S = 22 
      Challenge do it in only 3 clauses.

*/

sumList([],0).
sumList([H|T],S):- number(H), sumList(T,St), S is H+St.
sumList([H|T],S):- is_list(H), sumList(H,Sh), sumList(T,St), S is Sh+St.

/* 4: Define a predicate concatALL(+NestedLists, -C), concatenate all the 
      elements in the NestedLists into a list C of only single terms.
   i.e.
   ?- concatALL([[1],[a,b,c],[],[100,91]],C).
   C = [1, a, b, c, 100, 91].
   ?- concatALL([[1],[a,[b,[c]],[]], [[[100],91],x] ],C). 
   C = [1, a, b, c, 100, 91, x].
   ?- concatALL([[],[foo(a),[[^,=,[+]],[c]],[]], [[[+(1,2)],91],*] ],C).
   C = [foo(a), ^, =, +, c, 1+2, 91, *] .

   This can be done in only 3 clauses.... think What NOT how. 
*/

concatALL([],[]).
concatALL([H|T],C):-  concatALL(H,CH),
	                   concatALL(T,CT),
                      append(CH,CT,C).
concatALL(X,[X]).


/* 5: Below is a database of US coins. */

coin(dollar, 100).
coin(half, 50).
coin(quarter, 25).
coin(dime,10).
coin(nickel,5).
coin(penny,1).

/* 5: Write a predicate, value(Coin, Num, Amt), where Coin is the name,
      Num is how many and Amt is the total value, 
     (the value of the coin (in pennies) times the number of coins. )
     You should use the facts created in question 1 as
      as subgoal to find the value in pennies of the coin.
        ?- value(quarter,5, Amt).
        Amt = 125
        ?- value(dime,10, 100).
        Yes
        ?- value(dime,N, 100).
        ERROR: is/2: Arguments are not sufficiently instantiated
 */

value(Name,Num, Amt):- coin(Name, Value), Amt is Value * Num.

/* 6: Write a predicate change/2 that given the change amount, computes the ways 
      in which we can give change.  Use USA's  coin denominations above.
      
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
      
      The Coin Changing problem is an interesting problem usually studied in
      Algorthms.  http://condor.depaul.edu/~rjohnson/algorithm/coins.pdf is a 
      nice discussion.
      Think about 
         1) How could we generalize this problem to handle different 
            denominations?  
         2) What are the different techinques to find the change with the
            fewest number of coins ?         
         3) What happens if the order of the "coin" facts change? 

  */

change(0,[]).
change(S,[(N,C)|T]):- coin(N,V), C is S // V, C > 0 ,R is S - C * V, change(R,T).

