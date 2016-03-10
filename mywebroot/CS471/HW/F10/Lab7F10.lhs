> module Lab7F10
>    where
       
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

 
Problem 3:
Hand written part:

   f(x) = 5*x + 3
   g(x) = 1 / (x+1)
   
    a) Let h be defined to be (f o g) ( i.e. h =  f o g ). 
    b) Let h2 be defined to be ( g o f )? What is the result of h2(x) ?
    c) What is the value of  h(2 )?
    d) What is the value of  h2 (2 ) ?

 Write a haskell definition of f, g, h and h2.  Use the composition operator
 (.) to define h and h2.  Notice that composition operator
 returns a function and you do not need to include the argument x in your 
 definition of h and h2.
 i.e. The left hand side of the definition for h (and h2) need only h = . 



Predict the types of f, g, h, and h2?  Now check your prediction.
(DO not need to grade)


Problem 4: Define sumHarmonic using a simple recursive style:

The harmonic series is the following infinite series:
                            1   1   1   1               1
                      1 +   - + - + - + - + ...   + ... - ..
                            2   3   4   5               i
(http://en.wikipedia.org/wiki/Harmonic_series_(mathematics))
Write a function sumHarmonic such that sumHarmonic i is the sum of the first i
terms of this series. For example, sumHarmonic 4 ~> 1 + 1 + 1 + 1 ~> 2.08333...
                                                        2   3   4
sumHarmonic has type  Fractional a => a -> a.

Problem 5: Thompson 10.3
  Define a primitive recursive function composeList which composes 
  a list of functions into a single function.
  What is the effect of your function on an empty list of functions?
  Rewrite this using only function(HOF) application(THIS WILL BE IN THE  
  HOMEWORK NOT FOR THIS LAB).
  
    (Note I have -- :s +s)  
    Haskell1F10> composeList [ (*) 2, (*) 2] 2
    8
   (0.01 secs, 2666676 bytes)
   *Haskell1F10> composeList [ (-) 3 , (*) 2, (+)5 ] 7 
   -21
   (0.00 secs, 2879264 bytes)
  
(In GHCi Not HUGS)
    *Haskell1F10> let c = composeList [ (+)5 , \x -> x*x - x*2]
    (0.00 secs, 0 bytes)
    *Haskell1F10> c 10
    85
    (0.00 secs, 0 bytes)
 (In Hugs)
    Haskell2F10> composeList [ (*) 2, (*) 2] 2
    8
   (26 reductions, 32 cells)
   

    
