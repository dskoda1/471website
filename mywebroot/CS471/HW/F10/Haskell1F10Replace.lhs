> module Haskell1F10
>     where
       
  
++++++++++++++++ ANSWERS +++++++++++++++++++++++
Problem 1:
Write a Haskell script which implements Ackermann's function as defined in 
homework 1 problem 6.  Name your script "ack".  
You may use guards, and/or pattern matching and/or if expressions in
your definition.  Predict the inferred type of ack.  Check you guess.


Problem 2: 
Implement Newton's method for calculating the square root of N. 
Your definition should include a user defined (input) "guess" value and a
user defined "nearEnough" value.  "nearEnough" is use to determine
when the guess is close enough to the square root.  (guess*guess = number)

e.g. 
   Haskell1F10> newtonAppr 144 1 0.1             
   12.000545730742438 
   Haskell1F10> newtonAppr 144 1 0.0001
   12.0000000124087
   Haskell1F10> newtonAppr 144 1 0.000000000000001
   12.0
   Haskell1F10> newtonAppr 5e+30 1 1000000000000000000000000000000  
   2.317148867384728e15
   Haskell1F10> newtonAppr 5e+30 1 100000000000000000000000000    
   2.2360684271923805e15



Problem 3: Define the function "while" such that  "while pred xs" returns the 
longest initial segment of the list xs all of whose elements satisfy the 
Boolean-valued function pred . For example,
             ...> while even [2, 4, 8, 3, 4, 8, 6] 
             [2, 4, 8]
             ...> while odd [2,3,4]
             []
             ...> while ((1 ==).fst) [(1,4),(1,2),(4,5)]
             [(1,4),(1,2)]




Problem 4: Define a recursive style function 'sumDig n' such that sumDig returns
the sum of the digits of the number 'n'.  You should use the following 
operators: if expression, "+", mod and div. This can be done in one line of code.
   For example::  
    Haskell1F10> sumDig 1234
    10
    Haskell1F10> sumDig 9991234
    37
    Haskell1F10> sumDig 246135
    21


 




Problem 5: Thompson 10.3 (Done in Lab)
  Define a primitive recursive function composeList which composes 
  a list of functions into a single function.
  What is the effect of your function on an empty list of functions?
  Rewrite this using only function(HOF) application.
  
 
    Haskell2F10> composeList [ (*) 2, (*) 2] 2
    8
   (26 reductions, 32 cells)
    Haskell2F10> composeList [ (-) 3 , (*) 2, (+)5 ] 7 
    -21

    


B. Redo the definition. The definition should use a 'fold' and it 
   should be only be one line AND no explicit arguments (i.e. complete
   composeHOF = ?????).
    




Problem 6: (from http://en.wikipedia.org/wiki/Thue%E2%80%93Morse_sequence )
"In mathematics, the Thue–Morse sequence, or Prouhet–Thue–Morse sequence, is a 
binary sequence that begins:

    0 1 10 1001 10010110 1001011001101001...."
...
"Characterization using bitwise negation

The Thue–Morse sequence in the form given above, as a sequence of bits, 
can be defined recursively using the operation of bitwise negation. So, the 
first element is 0. Then once the first 2n elements have been specified, 
forming a string s, then the next 2n elements must form the bitwise negation of 
s. Now we have defined the first 2n+1 elements, and we recurse.

Spelling out the first few steps in detail:

    * We start with 0.
    * The bitwise negation of 0 is 1.
    * Combining these, the first 2 elements are 01.
    * The bitwise negation of 01 is 10.
    * Combining these, the first 4 elements are 0110.
    * The bitwise negation of 0110 is 1001.
    * Combining these, the first 8 elements are 01101001.
    * And so on.
So
    * T0 = 0.
    * T1 = 01."
    
Define a primitive recursive function 'thue' given the nth thue element returns
the next thue element.  The elements will be represented as a list of 0s and 1s.
e.g.
   Haskell2F10> thue [0,1,1,0]
   [0,1,1,0,1,0,0,1]


Problem 7:

Using the circular list idea demostrated in fibSeq
  (http://bingweb.binghamton.edu/%7Ehead/CS471/NOTES/HASKELL/4hF02.html)
  Define thueSeq to be a sequence of thue elements.
  You should use list comprehension.
e.g.
  Haskell2F10Sol> take 5 thueSeq
  [[0],[0,1],[0,1,1,0],[0,1,1,0,1,0,0,1],[0,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0]]
  


Problem 8:  (List comprehension)
(Only use list comprehension notation )
(From Thompson 17.23)  Give a definition of the function

    factor :: Integral a => a -> [a]

which returns a list containg the factors of a positive integer.  For instance

    factors 12 = [1,2,3,4,6,12]


 
Problem 9:
Define a primitive recursive function 'merge' that given two sorted lists returns 
a sorted list with all the unique elements from lists.  
e.g.
   Haskell2F10> merge [1,8,9,100] [3,7,9,99,100]    
   [1,3,7,8,9,99,100]




Problem 10:  (Thompson 17.23 )
Define the list of numbers whose only prime factors are 2, 3, and 5, the
so-called Hamming numbers:


   ...> take 15 hamming
   [1,2,3,4,5,6,8,9,10,12,15,16,18,20,24]


 You may consider using any combinition of the following techiques
       to express your solution  list comprehension notation, 
       and/or explicit recursion, and/or local definitions .

(Hint: Apply the circular list idea demostrated in fibSeq
  (http://bingweb.binghamton.edu/%7Ehead/CS471/NOTES/HASKELL/4hF02.html)) 
           



Problem 11. 
Using higher order functions (map, fold or filter) and if necessary lambda
expressions. Write a definition for f1 and f2 so the following evaluation 
is valid:  (hint: a lambda expressions could be useful).

     f1 (f2 (*) [1,2,3,4]) 5  ~> [5,10,15,20]

     Main> f1 ( f2 (*) [1,2,3,4]) 5
     [5,10,15,20]
     (77 reductions, 123 cells


Problem 12: (Thompson 10.13)
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



Problem 12:A (Done in Lab) Define sumHarmonic using a simple recursive style:

The harmonic series is the following infinite series:
                            1   1   1   1               1
                      1 +   - + - + - + - + ...   + ... - ..
                            2   3   4   5               i
(http://en.wikipedia.org/wiki/Harmonic_series_(mathematics))
Write a function sumHarmonic such that sumHarmonic i is the sum of the first i
terms of this series. For example, sumHarmonic 4 ~> 1 + 1 + 1 + 1 ~> 2.08333...
                                                        2   3   4
sumHarmonic has type  Fractional a => a -> a.




B: Rewrite the definition using either foldr or foldl. (i.e. figure out what ???
should be.  You can use a lambda abstraction in your definition.)
  sumH = foldr ??? 0
or 
  sumH = foldl ??? 0
  
   ...> sumHarmonic 20
   3.59773965714368
   ...> sumH [1..20]
   3.59773965714368



