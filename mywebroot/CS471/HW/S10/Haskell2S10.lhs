> module Haskell2S10
>    where

Problem 1: Thompson 10.3
  Define a primitive recursive function composeList which composes 
  a list of functions into a single function.
  What is the effect of your function on an empty list of functions?
  
 
    Haskell2S10> composeList [ (*) 2, (*) 2] 2
    8
    Haskell2S10> composeList [ (-) 3 , (*) 2, (+)5 ] 7 
    -21
    Haskell2S10> :t composeList
    composeList :: [c -> c] -> c -> c




Problem 2: ( from http://en.wikipedia.org/wiki/Thue-Morse_sequence )
"In mathematics, the Thue-Morse sequence, or Prouhet-Thue-Morse sequence, is a 
binary sequence that begins:

    0 1 10 1001 10010110 1001011001101001...."
...
"Characterization using bitwise negation

The Thue-Morse sequence in the form given above, as a sequence of bits, 
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
   Haskell2S10> thue [0,1,1,0]
   [0,1,1,0,1,0,0,1]



Problem 3:
Using the circular list idea demostrated in fibSeq
  (http://bingweb.binghamton.edu/~head/CS471/NOTES/HASKELL/4hF02.html)
  Define thueSeq to be a sequence of thue elements.
  You should use list comprehension.
e.g.
  Haskell2S10Sol> take 5 thueSeq
  [[0], [0,1],[0,1,1,0], [0,1,1,0,1,0,0,1], [0,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0]]
  



Problem 4:  (List comprehension)
(Only use list comprehension notation and mathematical functions/operators )
(From Thompson 17.23)  Give a definition of the function

    factor :: Integral -> [Integral]

which returns a list containg the factors of a positive integer.  For instance

    factors 12 = [1,2,3,4,6,12]


 
Problem 5:
Define a primitive recursive function 'merge' that given two sorted lists returns 
a sorted list with all the unique elements from lists.  
e.g.
   Haskell2S10> merge [1,8,9,100] [3,7,9,99,100]    
   [1,3,7,8,9,99,100]




Problem 6:  (Thompson 17.23 )
Define the list of numbers whose only prime factors are 2, 3, and 5, the
so-called Hamming numbers:


   ...> take 15 hamming
   [1,2,3,4,5,6,8,9,10,12,15,16,18,20,24]


 You may consider using any combinition of the following techiques
       to express your solution  list comprehension notation, 
       and/or explicit recursion, and/or local definitions .

(Hint: Apply the circular list idea demostrated in fibSeq
  (http://bingweb.binghamton.edu/~head/CS471/NOTES/HASKELL/4hF02.html)) 
           


  
    
