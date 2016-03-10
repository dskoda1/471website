> module Haskell3F14
>  where


Problem 1:


   Define  "allTrue" to evaluate a list of expression of Bools to True if all 
   the expression in a list are true.  Provide two test cases.   Your definition 
   should be a curried (partially evaluated) function. Use a fold in your solution.
   (i.e. Do not have an explicit parameters.  allTrue = ???)



Problem 2: 
    Define "noneTrue"  which evaluates to True if none of the boolean 
    expression in a list are true. Provide two test cases.  Your definition 
   should be a curried (partially evaluated) function. Use a fold in your solution.
   (i.e. Do not have an explicit parameters.  allTrue = ???)
   (Hint: You should use compose to 
    "glue" some of the functions so you don't need explicit parameters.)
    


Problem 3.
Using an  HOF (map, fold and/or filter ) define flattenT that returns a list of
value in each tuple.  

 3a) not too bad
    The output should be in the same order as the values appear in the 
     original list.
e.g.

   ...> flattenT  [(1,2), (3,4), (11,21),(-5,45)] 
   [1,2,3,4,11,21,-5,45]



 3b) not too bad.. 
   flattenR is the same as 10a, however, the values appear in the reverse order
   from the original list.
e.g.
   ...> flattenR  [(1,2), (3,4), (11,21),(-5,45)] 
   [45,-5,21,11,4,3,2,1]
--------------------
   




Problem 4:  Define 'prodLtoR nums', that given a non empty list of Nums, nums,  
      the result  is a list of the prod of the numbers in nums  such that last
      value in the output is the product of all the number nums, the next to
      last value in the output is the product of all the numbers in nums 
      except the last value in nums, etc.  
      
   A) Use explicit recursion.
      You may assume the input contains at least one value.  i.e. 
            
    ...> prodLtoR [3,4,1,2,3]
    [3,12,12,24,72]
    
   B)Redo the above by filling in the blanks below.
   
     > prodLtoRHOF  = (.) reverse (foldl op [] )
     >  where
     >   op  [] y = ______________
     >   op  (x:xs) y = ___________





Problem 5:  Define 'prodRtoL nums', that given a non empty list of Nums, nums,  
      the result  is a list of the prod of the numbers in nums such that first
      value in the output is the product of all the number nums, the next to
      first value in the output is the product of all the numbers in nums 
      except the first value in nums, etc.  

      *Haskell3Sol>  prodRtoLHOF [2,3,4,5]
      [120,60,20,5]



Problem 6:
a) Define a function replicate'' which given a list of numbers returns a 
list with each number duplicated its value.  Use only fold, map and take, (++).


Problem 7:  (Thompson 17.23 )
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


Problem 8: Haskell HW 1 - problem 7 you coded the following problem using 
recursion.
The harmonic series is the following infinite series:
                            1   1   1   1               1
                      1 +   - + - + - + - + ...   + ... - ..
                            2   3   4   5               i
(http://en.wikipedia.org/wiki/Harmonic_series_(mathematics))
Write a function sumHarmonic such that sumHarmonic i is the sum of the first i
terms of this series. For example, sumHarmonic 4 ~> 1 + 1 + 1 + 1 ~> 2.08333...
                                                        2   3   4

Rewrite the definition using either foldr or foldl. (i.e. figure out what ???
should be)
  sumH = foldr ??? 0
or 
  sumH = foldl ??? 0
  
   ...> sumHarmonic 20
   3.59773965714368
   ...> sumH [1..20]
   3.59773965714368


Problem 9:  http://en.wikipedia.org/wiki/Happy_number 
You will need to define 'sumSqr n' --  First read through this problem


A happy number is defined by the following process. Starting with any positive integer, replace 
the number by the sum of the squares of its digits, and repeat the process until the number 
equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1. 

Those numbers for which this process ends in 1 are happy numbers, If n is not happy (or sad), 
then its sequence does not go to 1. Instead, it ends in the cycle:
         4, 16, 37, 58, 89, 145, 42, 20, 4, ...

'happySeq' defined below creates a sequence of 'happy numbers'.
 
> happySeq = filter isHappy [1..]

  ...>  take 10 happySeq
  [1,7,10,13,19,23,28,31,32,44]

sqrSeq returns a sequence of the sum of the square of the digits of a number
ex. sqrSeq 5 = [5,25,29,85,89,145,42,20,4] <- Unhappy number
ex. sqrSeq 7 = [7,49,97,130,10,1]          <- Happy number

> sqrSeq n
>  | n == 1 || n == 4 = [n]
>  | otherwise        = n : sqrSeq (sumSqr n)

Below is an alternative definition for sqrSeq

(need takeWhile will not work because we need to include 1 or 4)  

> takeWhileInclusive :: (a -> Bool) -> [a] -> [a]
> takeWhileInclusive _ [] = []
> takeWhileInclusive p (x:xs) = x : if p x then takeWhileInclusive p xs
>                                          else []

> sqrSeq2 n = takeWhileInclusive (\x -> x/=1 && x/=4) (iterate sumSqr n)

'isHappy' returns True if number is happy and False otherwise.  
'isHappy' requires you to define sumSqr.

> isHappy n
>  | n == 1    = True
>  | n == 4    = False
>  | otherwise = isHappy (sumSqr n)

Returns a list of the digits of a number

> digits n
>  | n < 10    = [n]
>  | otherwise = (mod n 10) : digits (div n 10)

  
You should define sumSqr using HOF fold, map.  You may use digit, (+) or sum, 
and lambda expression.

  sumSqr :: Integral a => a -> a
 




