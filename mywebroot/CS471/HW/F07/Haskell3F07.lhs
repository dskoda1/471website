> module Haskell3F07 
>  where

Purpose:  Re-enforce programming recursive functions,
          experience functions as first class citizens,           
          practice with lambda expressions
          practice list comprehension notation
          practice HOF
  

Problem 1:  (See html for details)
  Horner's rule is an algorithm to evaluate a polynomial without 
  requiring the computation of arbitrary powers of x. 
  We can represent the coefficients of a polynomal 
     cn x^n + cn-1 x^(n-1) +...+ c0 using a 
     coef = [ c0, c1, .. cn ].
e.g.
  Haskell3S07> horner [9,0,1] 3
  18
  Haskell3F07> horner [9,-6,1] 2
  1


Write a haskell script using primative recursion
that will evaluate a polynomial given the 


Problem 2:
Redo problem one using a HOF (fold, map or filter) and a lambda expression.
  e.g.:
  
  Haskell3F07> hornerHOF 2 [9,-6,1]
  1
  Haskell3F07> hornerHOF 3 [9,0,1]
  18



 
Problem 3. 
Using higher order functions (map, fold or filter) and if necessary lambda
expressions. Write a definition for f1 and f2 so the following evaluation 
is valid:  (hint: a lambda expressions could be useful).

     f1 (f2 (*) [1,2,3,4]) 5  ~> [5,10,15,20]

     Main> f1 ( f2 (*) [1,2,3,4]) 5
     [5,10,15,20]
     (77 reductions, 123 cells


Problem 4: (Thompson 10.13)
  Find functions f1 and f2 so that
 
   s9 =  map f1 . filter f2

  has the same effect as
 

> p9 = filter (>0) . map (+1)

 
  ....> p9 [-4,4, -3,3,12,-12]
  [5,4,13]
  (99 reductions, 153 cells)
  ....> s9 [-4,4, -3,3,12,-12]
  [5,4,13]
  (90 reductions, 137 cells)


Problem 5:  (List comprehension)
(Use only list comprehension notation.)
(From Thompson 17.23)  Give a definition of the function

    factor :: Integral -> [Integral]

which returns a list containg the factors of a positive integer.  For instance

    factors 12 = [1,2,3,4,6,12]

Problem 6:     (Thompson 17.25 )
Define the list of numbers, hamming, whose only prime factors are 2, 3, and 5 , 
the so-called Hamming numbers. e.g.
   Haskell3F07> take 20 hamming
   [1,2,3,4,5,6,8,9,10,12,15,16,18,20,24,25,27,30,32,36]

You may also consider using factors but is not required. 
        You may consider using any combinition of the following techiques
        to express your solution::
               list comprehension notation, 
        and/or HOF 
        and/or explicit recursion, 
        and/or local definitions  


Problem 7:  
  Define insertP to insert an element in all the different positions in
  the input list. You should use primitive recursion and you may use
  nested definitons. e.g.

  Haskell3F07> insertP 99 [1,2,3]
  [[99,1,2,3],[1,99,2,3],[1,2,99,3],[1,2,3,99]]



Problem 8:
   Define insertM which behaves the same as insertP in problem 7 
   but use map. (You may also use nested definitions).
  

  Problem 9:  
   Define insertL which behaves the same as insertP in problem 7 but
   uses list comprehension notation as much as possible.
   (Hint: look at the LC version of fib)




Problem 10: Thompson 10.3
  Define a function composeList which composes a list of functions 
  into a single function.
  What is the effect of your function on an empty list of functions?
 
10A: Define composeList using primitive recursion.
  
 
    HaskellF07> composeList [ (*) 2, (*) 2] 2
    8
   (26 reductions, 32 cells)
    HaskellS034> composeList [ (-) 3 , (*) 2, (+)5 ] 7 
    -21
    (32 reductions, 41 cells
    HaskellF07>  composeListHOF [ (-) 3 , (*) 2, (+)5 ] 7
    -21
     (32 reductions, 41 cells)
     
     
10B: composeListHOF is a redefinition of composeList using a HOF.
    HaskellF07>  composeListHOF [ (-) 3 , (*) 2, (+)5 ] 7
    -21
    (33 reductions, 46 cells)


