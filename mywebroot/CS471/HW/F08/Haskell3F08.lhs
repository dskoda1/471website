> module Haskell3F08Sol
>    where

Due:: Tues, Dec 2 @7pm

1) Write a Haskell script to calculate the n-th tetrahedral number. 
   http://milan.milanovic.org/math/english/tetrahedral/tetrahedral.html 

   To calculate the n-th tetrahedral number:
     add the previous tetrahedral number to the sum of the numbers, 1 to n.

   The first few tetrahedral numbers are:

        1, 4, 10, 20, 35, 56, 84, 120, 165, 220, 286, 364, 455, 560, 680 ...

    This solution should use primitive recursion. You may use a local
    definition for the sum of the numbers 1 to n.




problem 2. pairWiseProdLC takes the product of each pair of numbers in a list.
   Write a non recursive definition, using list comprehension notation.
   
     ...> pairWiseProdLC [(1,2),(4,5),(7,0)]
     [2,20,0]


Problem 3. Using the circular list idea demonstrated in fibSeq
  (http://bingweb.binghamton.edu/~head/CS471/NOTES/HASKELL/4hF02.html)
   Define tetraseq which is a sequence of tetrahedral numbers.  YOU SHOULD
   NOTE USE PROBLEM in your solution.  This will be a one line wonder.
   ....> take 10 tetraseq
   [1,4,10,20,35,56,84,120,165,220]



Problem 4: Thompson 10.3
  Define a primitive recursive function composeList which composes 
  a list of functions into a single function.
  What is the effect of your function on an empty list of functions?
  Rewrite this using only function(HOF) application.
  
    Haskell3F08> :s +s
    Haskell3F08> composeList [ (*) 2, (*) 2] 2
    8
    (36 reductions, 46 cells)
    Haskell3F08> composeList [ (-) 3 , (*) 2, (+)5 ] 7 
   -21
   (42 reductions, 55 cells)
    Haskell3F08> composeListHOF [ (-) 3 , (*) 2, (+)5 ] 7
   -21
   (42 reductions, 55 cells)
   Haskell3F08> composeListHOF2 [ (-) 3 , (*) 2, (+)5 ] 7
   -21
   (42 reductions, 58 cells)

   
 > composeList [] = id
 > composeList (h:t) =  ?


 > composeListHOF  = ?


Problem 5:  (List comprehension)

(Only use list comprehension notation.)
(From Thompson 17.23)  Give a definition of the function

    factor :: Integral -> [Integral]

which returns a list contain the factors of a positive integer.  For instance

    factors 12 = [1,2,3,4,6,12]



Problem 6:  (Thompson 17.23 )

Define the list of numbers whose only prime factors are a, b, and c , the
so-called Hamming numbers:

    Haskell3F08>take 15 hamming
    [1,2,3,4,5,6,8,9,10,12,15,16,18,20,24]
    (54768370 reductions, 95472362 cells, 96 garbage collections)

 You may also consider using factors but is not required. 
 You may consider using any combination of the following techniques
       to express your solution  list comprehension notation, 
       and/or explicit recursion, and/or local definitions . 
           



Problem 7: Write new definitions of this function:

> f = \xs -> [ x * (mod x 5) | x <- xs, x > 5 ]

e.g.
    Haskell3F08> f [1,2,34,22,13,15,50,-1]
    [136,44,39,0,0]

    Haskell3F08> fr [1,2,34,22,13,15,50,-1]
    [136,44,39,0,0]
    
    Haskell3F08> fHOF [1,2,34,22,13,15,50,-1]
    [136,44,39,0,0]

 
a. using explicit recursion and pattern-matching, without guards. 
   Call it "fr"..




b. using higher-order functions, function composition, lambda expressions and
   function application (NO explicit recursion). 



Problem 8:
Sorry -- I have included the answers for 8a & 8b

a) (T9:11) How would you define the sum of the squares of the natural numbers 1 to n 
using map and folder?


> sumSq n = folder1 (+) (map (^2) [1..n])
 
b) How would you define the sum of the squares of a list of integers
using map and folder and (.).  You will have NOT explicit arguments.  

> subSq2 = (( folder1 (+)) . (map (^2)))

May use folder folder1 fold fold2

Problem 9: (Note: do not specify the argument for problem 8)
 9a: Use map to define a  lengths that takes a list of lists and
returns a list of corresponding lengths. i.e.

  Haskell4F05> lengths [[12,4,5,6],[1,2,4],[1,2]]
  [4,3,2]
  Haskell3F08Sol> lengths [[12,4,5,6],[1,2,4],[1,2],[12,3,4,5,4,5,4]]
  [4,3,2,7]
  (182 reductions, 240 cells)
SORRY-- this is the answer for 9a

> lengths = map length


 9b: Use map and a "fold" to define  sumLengths that takes a
     list of lists and returns the sum of all their lengths. i.e.
  
  Haskell3F08Sol> sumlengths [[12,4,5,6],[1,2,4],[1,2],[12,3,4,5,4,5,4]]
  16
  (152 reductions, 184 cells)

  > sumlengths = 



Problem 10. 
Using higher order functions (map, fold or filter) and if necessary lambda
expressions. Write a definition for f1 and f2 so the following evaluation 
is valid:  (hint: a lambda expressions could be useful).

     f1 (f2 (*) [1,2,3,4]) 5  ~> [5,10,15,20]

     Main> f1 ( f2 (*) [1,2,3,4]) 5
     [5,10,15,20]
     (77 reductions, 123 cells

_________________________



Problem 11: (Thompson 10.13)
  Find functions f1 and f2 so that
 
   s11 =  map f1 . filter f2

  has the same effect as
 

> p11 = filter (>0) . map (+1)

 
  ....> p9 [-4,4, -3,3,12,-12]
  [5,4,13]
  (99 reductions, 153 cells)
  ....> s9 [-4,4, -3,3,12,-12]
  [5,4,13]
  (90 reductions, 137 cells)

_________________________
Answer: 






