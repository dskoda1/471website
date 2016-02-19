
> module Haskell2F12
>     where

 Problem 1: Thompson 10.3
  In lab you did the following problem:
  Problem 4: Thompson 10.3
  Define a function composeList which composes a list of functions 
  into a single function.
  What is the effect of your function on an empty list of functions?
  Define composeList using primitive recursion.
  
Redo the definition. The definition should use a 'fold' and it 
   should be only be one line AND no explicit arguments (i.e. complete
   composeHOF = ?????).
    


Problem 2:  In http://bingweb.binghamton.edu/~head/CS471/HW/Haskell1F12.html
  problem 2 you wrote a function. thue, to create the next thue value. In Haskell 
  Lab 2 you used the circular list idea demonstrated in fibSeq to define a 
  sequence of thue elements.  
  a) Redefine thue using 'map' instead of primitive recursion. My solution 
     was  coded using (++), map, lambda expression and mod.  Call this
     function thueMap
  b) Redefine thueSeq  using map instead of list comprehension -- Call this
     function thueMapSeq
 
     *Haskell2F12> thueMap [0,1,1,0,1,0,0,1]
      [0,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0]
     *Haskell2F12> take 4 thueMapSeq 
      [[0],[0,1],[0,1,1,0],[0,1,1,0,1,0,0,1]]


Problem 3:  (Thompson 17.23 )   --> harder 
Define the list of numbers whose only prime factors are 2, 3, and 5, the
so-called Hamming numbers:


   ...> take 15 hamming
   [1,2,3,4,5,6,8,9,10,12,15,16,18,20,24]


 You may consider using any combinition of the following techiques
       to express your solution  list comprehension notation, 
       and/or explicit recursion, and/or local definitions .  You may include your
       merge defined in a previous HW.

(Hint: Apply the circular list idea demostrated in fibSeq
  (http://bingweb.binghamton.edu/%7Ehead/CS471/NOTES/HASKELL/4hF02.html)) 
           



Problem 4: (Thompson 10.13)  -- not to bad
  Find functions f1 and f2 so that
 
   s4 =  map f1 . filter f2

  has the same effect as
  
> p4 = filter (>0) . map (+1)

 Replace f1 and f2 with your solution in the code for s4.

  ....> p4 [-4,4, -3,3,12,-12]
  [5,4,13]
  (99 reductions, 153 cells)
  ....> s4 [-4,4, -3,3,12,-12]
  [5,4,13]
  (90 reductions, 137 cells)

   

Problem 5.   Not to bad
Using higher order functions (map, fold or filter) and if necessary lambda
expressions. Write a definition for f1 and f2 so the following evaluation 
is valid:  (hint: a lambda expressions could be useful).

     f1 (f2 (*) [1,2,3,4]) 5  ~> [5,10,15,20]

     Main> f1 ( f2 (*) [1,2,3,4]) 5
     [5,10,15,20]
     (77 reductions, 123 cells

_________________________
Answer: 



Problem 6:  Not to bad

Define sumH using a HOF :

The harmonic series is the following infinite series:
                            1   1   1   1               1
                      1 +   - + - + - + - + ...   + ... - ..
                            2   3   4   5               i
(http://en.wikipedia.org/wiki/Harmonic_series_(mathematics))
We wrote a function sumHarmonic such that sumHarmonic i is the sum of the first i
terms of this series.  

Rewrite the definition from hw 10 problem 6 using either foldr or foldl. (i.e. figure out 
what ??? should be.  You can use a lambda abstraction in your definition.)
  sumH = foldr ??? 0
or 
  sumH = foldl ??? 0
 
   ...> sumH [1..20]
   3.597739657143682


Problem 7: Write new definitions of this function:

> f = \xs -> [ x * (mod x 5) | x <- xs, x > 5 ]

    *Haskell2F12> f [1,22,60,6,35,14,56]
     [44,0,6,0,56,56]
 
   a. (easy) called fr, using explicit recursion and pattern-matching, without guards. 



  b. (easy) called fr2, using explicit recursion and guards, without pattern-matching.
      You can use 'null' to test for an empty list
 

 c. called fHOF, using higher-order functions, function composition, lambda expressions and
   function application (NO explicit recursion). 


Problem 8.
Using an  HOF (map, fold and/or filter) define flattenT that returns a list of
value in each tuple.  

8a) not too bad
    The output should be in the same order as the values appear in the 
     original list.
e.g.

   ...> flattenT  [(1,2), (3,4), (11,21),(-5,45)] 
   [1,2,3,4,11,21,-5,45]



8b) not too bad.. 
   flattenR is the same as 10a, however, the values appear in the reverse order
   from the original list.
e.g.
   ...> flattenR  [(1,2), (3,4), (11,21),(-5,45)] 
   [45,-5,21,11,4,3,2,1]


 

