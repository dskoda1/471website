> module Haskell4S08SOL 
>  where
> import Hugs.Observe


Purpose:  Re-enforce programming recursive functions,
          experience functions as first class citizens,           
          practice with lambda expressions  
          practice HOF

Apply HOFs to lambda expressions as much as possible in your definitions.
      

Problem 1: Homework 9 - problem 7 you coded the following problem using 
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
   
Problem 2. 
Using higher order functions (map, fold or filter) and if necessary lambda
expressions. Write a definition for f1 and f2 so the following evaluation 
is valid:  (hint: a lambda expressions could be useful).

     f1 (f2 (*) [1,2,3,4]) 5  ~> [5,10,15,20]

     Main> f1 ( f2 (*) [1,2,3,4]) 5
     [5,10,15,20]
     (77 reductions, 123 cells



Problem 3: (Thompson 10.13)
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





Problem 4:  
  Define insertP to insert an element in all the different positions in
  the input list. You should use primitive recursion and you may use
  nested definitons. e.g.

  ...> insertP 99 [1,2,3]
  [[99,1,2,3],[1,99,2,3],[1,2,99,3],[1,2,3,99]]



Problem 5:
   Define insertM which behaves the same as insertP in the problem above
   but use 'map'. (You may also use nested definitions).
     
  
  
  
Problem 6:  
   Define insertL which behaves the same as insertP in problem 7 but
   uses list comprehension (Hint: look at the LC version of fib)





Problem 7: Thompson 10.3
  Define a function composeList which composes a list of functions 
  into a single function.
  What is the effect of your function on an empty list of functions?
7A: Define composeList using primitive recursion.
  
 
    ...> composeList [ (*) 2, (*) 2] 2
    8
   (26 reductions, 32 cells)
    ...> composeList [ (-) 3 , (*) 2, (+)5 ] 7 
    -21
    (32 reductions, 41 cells
    ...>  composeListHOF [ (-) 3 , (*) 2, (+)5 ] 7
    -21
     (32 reductions, 41 cells)
      
     
7B: composeListHOF is a redefinition of composeList using a HOF.
    ...>  composeListHOF [ (-) 3 , (*) 2, (+)5 ] 7
    -21
    (33 reductions, 46 cells)



Problem 8. easy 
Using an HOF (map, fold and/or filter) define addTuples that each pair in a list.
(i.e. figure out ?? and ???
      addTuples = ?? ???
      )
 
   ...> addTuples [(1,2), (3,4), (11,21)]
   [3,7,32]
   (64 reductions, 97 cells)



Problem 9.
Using an  HOF (map, fold and/or filter) define sumT that returns the sum of all
the tuples together.
(i.e. figure out ?? and ???
      sumT = ?? ???
      )
      
 e.g.
    ...> sumT  [(1,2), (3,4), (11,21),(-5,45)] 
    82




Problem 10.
Using an  HOF (map, fold and/or filter) define flattenT that returns a list of
value in each tuple.  

10a)  The output should be in the same order as the values appear in the 
original list.
e.g.

   ...> flattenT  [(1,2), (3,4), (11,21),(-5,45)] 
   [1,2,3,4,11,21,-5,45]



10b) flattenR is the same as 10a, however, the values appear in the reverse order
from the original list.
e.g.
   ...> flattenR  [(1,2), (3,4), (11,21),(-5,45)] 
   [45,-5,21,11,4,3,2,1]


 






