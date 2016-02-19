> module Haskell3S05SOL
>     where


Purpose:  Re-enforce programming recursive functions,
          experience functions as first class citizens,           
          practice with lambda expressions
          practice list comprehension notation

      
Notes:
     Below you will see some sample output with reductions.  
     You can set Hugs to show your reductions by 

     ...>:set +s

     There are stubs for your code and type declarations in this file
     THEREFORE when you load this present file into HUGS.     

Problem 1:
  (See html for details)
  Horner's rule is an algorithm to evaluate a polynomial without 
  requiring the computation of arbitrary powers of x. 
  We can represent the coefficients of a polynomal 
     cn x^n + cn-1 x^(n-1) +...+ c0 using a 
     coef = [ c0, c1, .. cn ].

i.e.
  Haskell3S05SOL> horner [9,0,1] 3
  18
  Haskell3S05SOL> horner [9,-6,1] 2
  1



Write a haskell script using primative recursion
that will evaluate a polynomial given the 

CODE HERE:




Problem 2:
Redo problem one using a HOF (fold, map or filter) and a lambda expression.
  i.e:
  
  Haskell3S05SOL> hornerHOF 2 [9,-6,1]
  1
  Haskell3S05SOL> hornerHOF 3 [9,0,1]
  18


  > hornerHOF x = ??



Problem 3.

Define a function that computes the value of e^x using the series expansion

       e^x = 1 + x + (x^2 / 2!) + ( x^3 / 3!) + ... + ( x^n / n!) + ...

  You may or may not find use for
  the below functions:
       powersOf and fact; 
  and the Prelude function: 
       sum, zip, zipWith, and takeWhile;
  in your definitions.  You should use "where clause" to
  promote readability of your code. Your solution should discard all 
  terms of the series smaller than 0.000001.  


> powersOf x = iterate (\n -> n * x) 1.0

> fact  = 1.0:[ n*f | (n,f) <- zip [1.. ] fact ]


I have implemented 2 different solutions e2X 
and a more efficient version eToX.  
    ...> eToX 3.5
    33.1154
    (492 reductions, 824 cells)
    ...> e2X 3.5
    33.1154
    (6544 reductions, 8402 cells)
    ...> eToX 5.1
    164.022
   (622 reductions, 1039 cells)
    Main> e2X 5.1
    164.022
    (10586 reductions, 13562 cells)





Problem 4:  (List comprehension)
(Only use list comprehension notation.)
(From Thompson 17.23)  Give a definition of the function

    factors :: Integral -> [Integral]

which returns a list containg the factors of a positive integer.  For instance

    factors 12 = [1,2,3,4,6,12]





Problem 5: You may also consider using factors but is not required. 
            You may consider using any combinition of the following techiques
            to express your solution
              list comprehension notation, or HOF or explicit recursion, or
               local definitions  
            (Thompson 17.25 )

Define the list of numbers whose only prime factors are a, b, and c , the
so-called Hamming numbers:




Problem 6. (One line wonder is possible)
Using the ideas presented in computing the nth Fibonacci
number with infinite list structures 
(http://bingweb.binghamton.edu/~head/CS471/NOTES/HASKELL/4hSpr01.html#Fib) 
define 

   which calculates a running sum, i.e.
   [ a0, a0 + a1, a0 + a1 + a2, ...

   from a list, [a0, a1, a2, ...

   ...> runningSum [1,2,3,4,5]
   [1,3,6,10,15]

You solution can use nested definitions, however it can be done in one line.





Problem 7:
Define a function replicate which given a list of numbers returns a 
list with each number duplicated its value.  Use only list comprehension
notation in your solution.  i.e.

  ..> replicate [5,1,3,2,8,1,2]
  [5,5,5,5,5,1,3,3,3,2,2,8,8,8,8,8,8,8,8,1,2,2]




















