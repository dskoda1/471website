> module Haskell4S07
>    where
> import Hugs.Observe

You may use observe to help you debug.
See 
   http://bingweb.binghamton.edu/%7Ehead/CS471/CODE/Scripts/Debugging.lhs
for examples.

REMEMBER IF YOU FIND THE SOLUTION ON THE WEB .. DON'T FORGET TO GIVE
CREDIT TO THE SITE.


What is the most general type (if any) of
   A) map map
   B) foldl foldl
   C) map foldl
   D) map . foldl

What is the value of :
   (map . foldl1) (-) [[1,2,3],[3,2,1],[100,200,300]]
    map (\v ->  v [4000,1000]) (map foldr1 [div,(-)])
    map (\f -> f [3,4,5])  (map map [(*) 3,(-) 4])


What is the value of mapmap ? Try and figure it out then run it.

> mapmap = map (\x-> x [1,2,3])(map map [odd,even])

Problem 4:  (List comprehension)

(Only use list comprehension notation.)
(From Thompson 17.23)  Give a definition of the function

    factor :: Integral -> [Integral]

which returns a list containg the factors of a positive integer.  For instance

    factors 12 = [1,2,3,4,6,12]


++++++++++++++++++++++++++++++++++++++++++

Problem 1. Define prodRtoL nums, that given a non empty list of Nums, nums,  
      the result  is a list of the prod of the numbers in nums  such that first 
      value in the output is the product of       all the number nums, the 
      second value in the output is the product of all the numbers in nums 
      except the first value in nums, etc.  Use explicit recursion.
      i.e.
     ...> prodRtoL [3,4,1,2,3]
     [72,24,6,6,3]





Problem 2:  Define prodLtoR nums. which is similar to prodRtoL, except that 
            product is accumulate left to right. You may assume the input 
            contains at least one value.  i.e. 
            
    ...> prodLtoR [3,4,1,2,3]
    [3,12,12,24,72]




Problem 3:  Redo problem 2  using List comprehension notation and circular
            data structure. (hint look at the fast solution for fib)

i.e.
  ...> prodLC [3,4,1,2,3]
  [3,12,12,24,72]




Problem 4: Redo problem 1 by filling in the blanks below

    > prodRtoLHOF  = foldr op [] 
    >    where
    >     op  y [] = _____________ 
    >     op  y (x:xs) = ___________



Problem 5: Redo problem 2 by filling in the blanks below
   
     > prodLtoRHOF  = (.) reverse (foldl op [] ) 
     >  where
     >   op  [] y = ______________
     >   op  (x:xs) y = ___________



Problem 6:  Redefine the function last and call it lastR. Use foldr1 
            in your definition and do not use the prelude function last. 
        i.e.
             Haskell4S07> lastR [(2,"as"),(5,"sdfgd"),(1,"a")]
             (1,"a")
  

Problem 7:  Redefine the function unzip and call it unzipR. Use foldr  
            in your definition and do not use the prelude function unzip. 

        i.e.
         Haskell4S07> unzipR [(2,"as"),(5,"sdfgd"),(1,"a")]
         ([2,5,1],["as","sdfgd","a"])


Problem 8:  In the homework 12, problem 1 you defined a function sq. 
            In problem 4 of the same assignment you applied sum to sq as part 
            of the definition of happy.
            Now you are to define a function sumSq that will replace 
            using sum and sq.  sumSq does not need to include the name of
            the arguments in its definition.  You may assume the input list is 
            not empty.  You definition should include map and a fold of your 
            choice.
          
            




Problem 9:  (Thompson 17.23 )
Define the list of numbers whose only prime factors are 2, 3, and 5, the
so-called Hamming numbers:


   ...> take 15 hamming
   [1,2,3,4,5,6,8,9,10,12,15,16,18,20,24]


 You may consider using any combinition of the following techiques
       to express your solution  list comprehension notation, 
       and/or explicit recursion, and/or local definitions . 
           


Problem 10:
Define a function that computes the value of e^x using the series expansion

       e^x = 1 + x + (x^2 / 2!) + ( x^3 / 3!) + ... + ( x^n / n!) + ...

  You may or may not find use for the below functions:
       powersOf and fact;
  and the Prelude function:
       sum, zip, zipWith, and takeWhile;
  in your definitions.  You should use "where clause" to
  promote readability of your code. Your solution should discard all
  terms of the series smaller than 0.000001.


> powersOf x = iterate (\n -> n * x) 1.0

> fact  = 1.0:zipWith (*) [1.. ] (tail fact)



