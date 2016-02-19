> module Haskell3S10 
>  where

1 a) (T9:11) How would you define the sum of the squares of the natural numbers 
     1 to n using map and foldr? (Complete this definition -- > sumSq n = ???) 

      Haskell3S10SOL> sumSq 4
      30

b) How would you define the sum of the squares of a list of natural numbers 
   using map and foldr and (.).  You should NOT have explicit arguments.  
   (Complete this definition -- > sumSq2 = ???) 


   Haskell3S10SOL> sumSq2 [1,5,2]
   30




May use foldr foldr1 foldl foldl2

Problem 2: 
  2a: Use map to define a  lengths that takes a list of lists and
  returns a list of corresponding langths. i.e. (Complete this definition
  > lengths =???)

  Haskell3S10> lengths [[12,4,5,6],[1,2,4],[1,2]]
  [4,3,2]
  



 
 2b: Use map and a "fold" to define  sumLengths that takes a
  list of lists and returns the sum of all their lengths. i.e.
  
  Haskell3S10> sumlengths [[12,4,5,6],[1,2,4],[1,2]]
  9

   (Complete this definition > sumlengths = ???)



Problem 3. 
Using higher order functions (map, fold or filter) and if necessary lambda
expressions. Write a definition for f1 and f2 so the following evaluation 
is valid:  (hint: a lambda expressions could be useful).

     f1 (f2 (*) [1,2,3,4]) 5  ~> [5,10,15,20]

     Main> f1 ( f2 (*) [1,2,3,4]) 5
     [5,10,15,20]
     (77 reductions, 123 cells

_________________________
Answer: 




Problem 4: (Thompson 10.13)
  Find functions f1 and f2 so that
 
   s4 =  map f1 . filter f2

  has the same effect as
 

> p4 = filter (>0) . map (+1)

 
  ....> p4 [-4, 4, -3,3,12,-12]
  [5,4,13]
  (99 reductions, 153 cells)
  ....> s4 [-4, 4, -3,3,12,-12]
  [5,4,13]
  (90 reductions, 137 cells)

_________________________
Answer: 




Problem 5: Thompson 10.3
    Redo problem 1 homework 11 using one of the fold's.  You may also use
    compose and id.
 
 
Problem 6: Write new definitions of this function:

> f = \xs -> [ x + 5 | x <- xs, x > -1 ]
   
   Haskell3S10SOL> f [1,20,-3,15,2]
   [6,25,20,7]

a. Use explicit recursion and pattern-matching, without guards-- OR --
   using explicit recursion with guards but without pattern-matching.  You
   may use explicit arguments.




b. Use higher-order functions, function composition, lambda expressions and
   function application (NO explicit recursion). (i.e. fHOF = ???)

    Haskell3S10SOL> fHOF [1,20,-3,15,2]
    [6,25,20,7]



Problem 7:
Using a fold in your solution:

a) Define  "allTrue" to evaluate a list of expression of Bools to True if all 
   the expression in a list are true.  Provide two test cases.  Do not have an
   explicit parameters.  (i.e. allTrue = ???)



b)  Define "noneTrue"  which evaluates to True if none of the boolean 
    expression in a list are true. Provide two test cases. Do not have an
    explicit argument.  (i.e. noneTrue = ???) (Hint: You should use compose to 
    "glue" some of the functions so you don't need explicit parameters.)
    



Problem 8:
a) Define a function replicate which given a list of numbers returns a 
list with each number duplicated its value.  Use only list comprehension
notation in your solution.  i.e.
  ..> replicate [5,1,3,2,8,1,2]
  [5,5,5,5,5,1,3,3,3,2,2,8,8,8,8,8,8,8,8,1,2,2]
  


b) Redo this problem using a fold, map and take.


