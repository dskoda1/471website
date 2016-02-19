> module Haskell2S09
>     where
       
  Note: In the homework file put only one space between 
        ">" and code (beginning of definition).  
         Do not use a tab...  JUST one SPACE.

++++++++++++++++ANSWERS+++++++++++++++++++++++

Problem 1: Write a recursive definition, mul x y, that returns the product x*y. (Do
not use "*" operator.



Problem 2: 
The harmonic series is the following infinite series:
                            1   1   1   1               1
                      1 +   - + - + - + - + ...   + ... - ..
                            2   3   4   5               i
(http://en.wikipedia.org/wiki/Harmonic_series_(mathematics))
Write a function sumHarmonic such that sumHarmonic i is the sum of the first i
terms of this series. For example, sumHarmonic 4 ~> 1 + 1 + 1 + 1 ~> 2.08333...
                                                        2   3   4
sumHarmonic has type  Fractional a => a -> a




Problem 3: Define the function "while" such that  "while pred xs" returns the 
longest initial segment of the list xs all of whose elements satisfy the 
Boolean-valued function pred . For example,
             ...> while even [2, 4, 8, 3, 4, 8, 6] 
             [2, 4, 8]
             ...> while odd [2,3,4]
             []
             ...> while ((1 ==).fst) [(1,4),(1,2),(4,5)]
             [(1,4),(1,2)]

                                             



Problem 4:
Define subSeq which given a sequence of values in a list create a list
of lists that contain all the suffixes of the original list.
e.g.
   Haskell2S09> subSeq [1,1,2,3,5]
   [[1,1,2,3,5],[1,2,3,5],[2,3,5],[3,5],[5],[]]

Predict the most general type of subSeq.





Problem 5: 
Implement Newton's method for calculating the square root of N. 
Your definition should include a user defined (input) "guess" value and a
user defined "nearEnough" value.  "nearEnough" is use to determine
when two sequenial guesses are close enough to use the guess as the
square root.

e.g. number = 5e+30, guess is 1 and nearEnough is 100000
            "             "    nearEnough is 10000000000000000000000000000000
 
  Haskell2S09>  newton 5e+30 1 100000
  2.23606797749979e+15
  Haskell2S09> newton 5e+30 1 10000000000000000000000000000000
  2.5e+30




For Problem 6, you should use the built in function min.
Problem 6a
Implement the function 
          minNT :: Ord a => [a] -> a
Which returns the minimum value of the argument list. You must implement 'minNT'
recursively and it must not be in a tail recursive form.  Hint: you may need to
code the base case first.  You may assume the list has at least one element.


Problem 6b:
Implement the function 
          minT :: Ord a => [a] -> a
Which returns the minimum value of the argument list. You must implement 'minT'
recursively and it must be in a tail recursive form. If you are clever you can
do this without an additional argument. You may assume the list has at least 
one element. 




problem 7: 
For exercise 2 & 3.
Below is the code for the first 2 written questions.

> power :: Integer -> Integer -> Integer
> power a 0 = 1
> power a b = a * power a (b-1)

> powerT :: Integer -> Integer -> Integer
> powerT a b = trp b 1
>      where
>      trp n p = if (n==0) then p else trp (n-1) (a*p)

> turboPower a 0 = 1
> turboPower a b
>     | even b = turboPower (a*a) (b `div` 2)
>     | otherwise = a * turboPower a (b-1)


Nov 2005 runs using Hugs:

power 2 32500
(422533 reductions, 40455167 cells, 41 garbage collections)

powerT 2 32500
(390033 reductions, 40422669 cells, 41 garbage collections)


powerS 2 32500
(422533 reductions, 40455169 cells, 41 garbage collections)
         36000
(468033 reductions, 49553099 cells, 50 garbage collections)

turboPower 2 36000
(1499 reductions, 31326 cells)

turboTPower 2 100000
(1614 reductions, 52788 cells)

turboPower 2 100000
(1615 reductions, 84812 cells)

using GHCi 6** Multiple trys give me different results:
Haskell2S09> power 2 32500
(0.64 secs, 96467304 bytes)

Haskell2S09> powerS 2 32500
(0.32 secs, 100370704 bytes)

Haskell2S09> powerT 2 32500
(0.57 secs, 100389044 bytes)

Haskell2S09> turboPower 2 32500
(0.08 secs, 4368112 bytes)

Haskell2S09> turboTPower 2 100000
(0.49 secs, 11513988 bytes)
Haskell2S09> turboPower 2 100000
(0.34 secs, 12100936 bytes)




  2e:
  Define powerS by modifing powerT to force the accumulator argument 
  to be evaluated prematurely, using the operator ($!) as illustrated in factS.
Answer:


  3d:
  Convert the algorithm used in turboPower to tail recursive form. Call the
  definition turboTPower.


