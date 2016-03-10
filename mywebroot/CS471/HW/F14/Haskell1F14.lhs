> module Haskell1F14
>     where
       

Problem 1. Composition :   (Reference Composition of Functions:  http://www.purplemath.com/modules/fcncomp3.htm)

  In lab problem Part 3 7. you did the following problem by hand -- Given:
          f(x) = x*2 - 5
          g(x) = (3 * x +1) * 2
      a) Let h be defined to be (f o g) ( i.e h is f composed with g) . 
         Remember  (f o g) x is defined to be f ( g(x) ).
      b) Let h2 be defined to be ( g o f )? What is the result of h2(x) ?
      c) What is the value of  h(2 )?
      d)What is the value of  h2 (2 ) ?


 Now  [10pts] program h and h2 in Haskell  
      Write a haskell definition of f, g, h and h2.  Use the composition operator (.) to define h and h2.  Notice that composition operator returns a function and you do not need to include the argument x in your  definition of h and h2. i.e. The left hand side of the definition for h (and h2) need only h =..... 
 

Problem 2: Thompson 10.3
  Define a function composeList which composes a list of functions 
  into a single function.
  What is the effect of your function on an empty list of functions?
  Define composeList using primitive recursion.
  
 
    ...> composeList [ (*) 2, (*) 2] 2
    8
    ...> composeList [ (-) 3 , (*) 2, (+)5 ] 7 
    -21


Problem 3: (from http://en.wikipedia.org/wiki/Thue%E2%80%93Morse_sequence )
"In mathematics, the Thue-Morse sequence, or Prouhet-Thue-Morse sequence, is a 
binary sequence that begins:

  0 01 0110 01101001 0110100110010110 01101001100101101001011001101001 ...

(if your sequence starts with one..)
    1 10 1001 10010110 1001011001101001...."

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
   Haskell1F14> thue [0,1,1,0]
   [0,1,1,0,1,0,0,1]


 
Problem 4:
Define a primitive recursive function 'merge' that given two sorted lists returns 
a sorted list with all the unique elements from lists.  
e.g.
   Haskell1F14> merge [1,8,9,100] [3,7,9,99,100]    
   [1,3,7,8,9,99,100]


Problem 5:
Define a function replicate' which given a list of numbers returns a 
list with each number duplicated its value.   Use primitive recursion in your
definition. You may use a nested helper definition. eg.
     
     Haskell1F14> replicate' [2, 4, 1]
     [2,2,4,4,4,4,1]


Problem 6: Implement Newton's method for calculating the square root of N. Your
definition should use primitive recursive style.  
(See written part of this assignment)  Your definition should include a user defined (input) 
"guess" value and a user defined "nearEnough" value.  "nearEnough" is use to determine
when the guess is close enough to the square root.  (guess*guess = number) 
You should use locally defined  helper functions to make your code more readable.
You may use guards or "if expression"

e.g. 
   Haskell1F14> newtonAppr 144 1 0.1             
   12.000545730742438 
   Haskell1F14> newtonAppr 144 1 0.0001
   12.0000000124087
   Haskell1F14> newtonAppr 144 1 0.000000000000001
   12.0
   Haskell1F14> newtonAppr 5e+30 1 1000000000000000000000000000000  
   2.317148867384728e15
   Haskell1F14> newtonAppr 5e+30 1 100000000000000000000000000    
   2.2360684271923805e15



Problem 7:
A Define sumHarmonic using a simple recursive style:

The harmonic series is the following infinite series:
                            1   1   1   1               1
                      1 + - + - + - + - + ...  + ... - ..
                            2   3   4   5               j
(http://en.wikipedia.org/wiki/Harmonic_series_(mathematics))
Write a function sumHarmonic such that sumHarmonic i is the sum of the first j
terms of this series. For example, sumHarmonic 4 ~> 1 + 1 + 1 + 1 ~> 2.08333...
                                                        2   3   4
sumHarmonic can have the type  Fractional a => a -> a.



