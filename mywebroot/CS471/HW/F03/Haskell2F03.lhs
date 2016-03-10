You do not have include above the "+++++" line in your hard copy.
DONT forget to put you name after the "++++++" below

Purpose:  Introduce Haskell by programming simple recursive functions 
          and to experience the literal style of programming. 
          Using different number types in haskell.


Note: In the homework file put only one space between ">" and the code.  
Do not use a tab...  JUST one SPACE.


++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

YOUR NAME, EMAIL

> module Haskell2F03
>     where

 

Note: 
I have put in the ">" where your code should be place.  Sometimes
I have indicated the first line of the code for you to complete
       > function arg = '?'


Problem 1: (code is very easy but typing will require thinking)
  ( Some terms:
      A function exhibits 'parmetric polymorphism' if it has a type that contains
        one or more type variables.
      A type with a type variables like 
          Eq a => a -> a -> Bool
        is called a 'polytype'.
  )
 Write a Haskell function definition for each of the following functions.
 Try to predict polytype Haskell infer for each function.  Then check your prediction 
 using the ":t" command.  You need only turn in your code.  NOTE: each definition is only ONE 
 Line of code.

   a) fa(x) = 1
   b) fb(x,y) = 1
   c) fc(x) = x
   d) fd(g) = g(1)
   e) fe(g, x) = g(x)
   f) ff(g,x,y) = g(x,y)
   g) fg(g,h,x)= g(h(x))
   i) f(g,x) = g( g(x))  --- BECAREFUL  

You should be writing curried functions. For example the code for 3a is:
Challenge use (.) (composition) in problems g and i.


> fa x = 1
> 



Problem 2:  Use list comprehension notation in your code.   Define "sumPair lst" to return a list of the sum of 
each pair in lst.  Challenge try using uncurry as part of your answer. 
i.e.   

   Haskell2F03> sumPair [(3,4),(-2,3),(88,-5)]
   [7,1,83]



> sumPair :: Num a => [(a,a)] -> [a]
> sumPair lst = '?'


Problem 3: Use list comprehension notation in your code. Define "functionPair lst fun" to return a list
of Nums.  fun :: Num a=> a -> a -> a, lst:: [(a,a)] and the each value is the result of appling the function, 
fun, to each elements in the list of pairs.
i.e.

  Haskell2F03> functionPair [(3,4),(-2,3),(88,-5)] (*)
  [12,-6,-440]
  Haskell2F03> functionPair [(3,4),(-2,3),(88,-5)] mod
  [3,1,-2]

> functionPair lst fun = '?'



Problem 4: Use list comprehension notation in your code. Define "functLstPair  lst funLst" to return a list
of Nums.  fun :: Num a=>[( a -> a -> a)], lst:: [(a,a)] and the each value is the result of apply very function in
funLst to the every elements in the list of pairs. 
  i.e.

   Haskell2F03> functLstPair [(3,4),(-2,3),(88,-5)] [(*), (-), mod]
   [12,-6,-440,-1,-5,93,3,1,-2]




> functLstPair lst fun = '?'