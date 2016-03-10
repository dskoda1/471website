> module Haskell3S09 
>  where
> import Hugs.Observe

example using observe for debugging in Hugs... 
  if you are using GHCI
    remove both import and mergeObs definition

> mergeObs [] ys = observe "merge [] ys " ys
> mergeObs xs [] = observe "merge [] xs "  xs
> mergeObs xss@(x:xs) yss@(y:ys)
>    | x < y = observe "merge (x<y)" x: mergeObs xs yss
>    | otherwise = observe "merge (x>y)" y : mergeObs xss ys


Problem 1:  (List comprehension)

(Only use list comprehension notation.)
(From Thompson 17.23)  Give a definition of the function

    factor :: Integral -> [Integral]

which returns a list containg the factors of a positive integer.  For instance

    factors 12 = [1,2,3,4,6,12]


Problem 2:    (Thompson 17.25 )
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



Problem 3: Homework 11 - problem 2 you coded the following problem using 
recursion.
The harmonic series is the following infinite series:
                            1   1   1   1               1
                      1 +   - + - + - + - + ...   + ... - ..
                            2   3   4   5               i
(http://en.wikipedia.org/wiki/Harmonic_series_(mathematics))
Write a function sumHarmonic such that sumHarmonic i is the sum of the first i
terms of this series. For example, sumHarmonic 4 ~> 1 + 1 + 1 + 1 ~> 2.08333...
                                                        2   3   4
sumHarmonic has type  Fractional a => a -> a.

Rewrite the definition using either foldr or foldl. (i.e. figure out what ???
should be)
  sumH = foldr ??? 0
or 
  sumH = foldl ??? 0
  
   ...> sumHarmonic 20
   3.59773965714368
   ...> sumH [1..20]
   3.59773965714368

 
Problem 4. 
Using higher order functions (map, fold or filter) and if necessary lambda
expressions. Write a definition for f1 and f2 so the following evaluation 
is valid:  (hint: a lambda expressions could be useful).

     f1 (f2 (*) [1,2,3,4]) 5  ~> [5,10,15,20]

     Main> f1 ( f2 (*) [1,2,3,4]) 5
     [5,10,15,20]
     (77 reductions, 123 cells)


Problem 5: (Thompson 10.13)
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


Problem 6:  
  Define insertP to insert an element in all the different positions in
  the input list. You should use primitive recursion and you may use
  nested definitons. e.g.

  ...> insertP 99 [1,2,3]
  [[99,1,2,3],[1,99,2,3],[1,2,99,3],[1,2,3,99]]



Problem 7:
   Define insertM which behaves the same as insertP in the problem above
   but use 'map'. (You may also use nested definitions).
  
 
  
Problem 8:  
   Define insertL which behaves the same as insertP in problem 7 but
   uses list comprehension (Hint: look at the LC version of fib)



Problem 9: Thompson 10.3
  Define a function composeList which composes a list of functions 
  into a single function.
  What is the effect of your function on an empty list of functions?
9A: Define composeList using primitive recursion.
  
 
    ...> composeList [ (*) 2, (*) 2] 2
    8
   (26 reductions, 32 cells)
    ...> composeList [ (-) 3 , (*) 2, (+)5 ] 7 
    -21
    (32 reductions, 41 cells
    ...>  composeListHOF [ (-) 3 , (*) 2, (+)5 ] 7
    -21
     (32 reductions, 41 cells)
      
     
9B: composeListHOF is a redefinition of composeList using a HOF.
    ...>  composeListHOF [ (-) 3 , (*) 2, (+)5 ] 7
    -21
    (33 reductions, 46 cells)






Problem 10. easy 
Using a map define gtTuples such that each pair in a list the corresponding 
result is true if the first value is greater than the second element and false
otherwise.  In order for this easy code to compile you must include the type as 
part of the script,
  i.e.  > gtTupleL :: Ord a => [(a,a)] -> [Bool]
because the compiler can not infer the type correctly. 

   (GHCI)
   ...> gtTupleL [(1,2), (3,4), (11,21)]
   [False,False,False]
   (0.01 secs, 2097908 bytes)
   (HUGS)

   
10 a. gtTupleL - use a lambda abstraction 
   b. gtTupleB - use uncurry and (>)
   c. gtTupleC - use (.), uncurry and (>)


Problem 11.
Using a fold function, define existXgtY such that returns true if there 
exist at least one tuple, (x,y) in a list with x > y
     (i.e. ?? is your choice of fold and ??? will be a lambda abstraction
      existXgtY = ?? ???
      )
      
  e.g.
    (ghci)
    ...> existXgtY [(1,2), (3,4), (11,21),(-5,45)] 
    False
    (0.01 secs, 2097028 bytes)
    (hugs)
    ...> existXgtY [(1,2), (3,4), (11,21),(-5,45)] 
    False
    (76 reductions, 112 cells)


Problem 12.
Using an  HOF (map, fold and/or filter) define flattenT that returns a list of
value in each tuple.  

12a)  The output should be in the same order as the values appear in the 
original list.
e.g.

   ...> flattenT  [(1,2), (3,4), (11,21),(-5,45)] 
   [1,2,3,4,11,21,-5,45]



12b) flattenR is the same as 10a, however, the values appear in the reverse order
from the original list.
e.g.
   ...> flattenR  [(1,2), (3,4), (11,21),(-5,45)] 
   [45,-5,21,11,4,3,2,1]


 




