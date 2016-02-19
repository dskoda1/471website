> module Haskell3S08 
>  where
> import Hugs.Observe

Homework due Monday, April 28 5pm.
(You can use Observe or Trace to help with debugging)

1) Write a recursive definition 'zip4add' which creates of list of Nums whose 
   values is the sum of corresponding items from 4 lists. DO NOT USE "if 
   expression" as part of your solution.

   ...> zip4add [1,2,3] [2,3,4] [1,6,7,8] [1,2]
   [5,13]
   ...> zip4add [1,2,3] [] [1,6,7,8] [1,2]
   []


2) Reprogram tetra from the last homework except create a sequence of tetra 
numbers in a list.  Use list comprehension notation as much as possible.  
You may use the function defined in problem 1.  What is 
the time complexity of this version of tetra?
   ...> take 20 tetra
   [0,1,1,2,4,8,15,29,56,108,208,401,773,1490,2872,5536,10671,20569,39648,76424]





Problem 3:  (List comprehension)

(Only use list comprehension notation.)
(From Thompson 17.23)  Give a definition of the function

    factor :: Integral -> [Integral]

which returns a list containg the factors of a positive integer.  For instance

    factors 12 = [1,2,3,4,6,12]




Problem 4:    (Thompson 17.25 )
Define the list of numbers, hamming, whose only prime factors are 2, 3, and 5 , 
the so-called Hamming numbers. e.g.
   Haskell3F07> take 20 hamming
   [1,2,3,4,5,6,8,9,10,12,15,16,18,20,24,25,27,30,32,36]

You may also consider using factors but is not required. 
        You may consider using any combinition of the following techiques
        to express your solution::
               list comprehension notation, 
        and/or HOF 
        and/or explicit recursion, 
        and/or local definitions  



