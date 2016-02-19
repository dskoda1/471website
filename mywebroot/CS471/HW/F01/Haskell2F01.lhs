YOUR NAME, EMAIL
Don't forget to rename file as defined in the instructions. You do not
have include above the "+++++" line in your hard copy.

Purpose:  Re-enforce programming recursive functions,
          experience functions as first class citizens,
          introduction to list comprehension,           
          practice with lambda expressions and getting use to 
          numbers in Haskell.

          You do not need to use modules on this assignment.
Notes:  11/13/2001 8:30pm

     Below you will see some sample output with reductions.  
     You can set Hugs to show your reductions by 

     ...>:set +s

     There are stubs for your code and type declarations in this file
     THEREFORE when you load this present file into HUGS there will be
      compiler errors.     

Practice:  DO NOT turn in.
What does lF do?

 
> lF :: [a] -> Float
> lF = (\x -> encodeFloat ((toInteger . length) x) 0)


1a) Write a definition for flop, which applies the last value 
     (which is a function) 
to the reverse of the first two values.
This is very EASY.  ONE LINE!!  

  ...> flipit (-) 10 7
  -3
  (17 reductions, 24 cells)
  
  ...> flipit (-) 7 10 
  3
  (17 reductions, 23 cells)
  
  ...> flipit (++) "abc" "ZYX" 
  "ZYXabc"
  (128 reductions, 179 cells)

  ...> flip (!!) 3 "abcdef" 
  'd'
  (97 reductions, 147 cells)

Code:

>


1b) What is the type of flip?


Problem 2:
   Rewrite problem 1 using a lambda expression.

Code:

>


2b) What is the type of flipitL?




Problem 3: (easy)
    Write a Haskell script using primitive recursion and pattern matching,
         zipPair L1 L2
    which returns a list of pairs.
    Haskell provides pattern matching and list operators so the lefthand 
    side of function will be
        zipPair (h:t) (n:ns)
    (h:t) h matches the head of the list and t matches the tail --
    like prolog.
    
    ...> zipPair [1,2,3] ['a','b','c','d']
    [(1,'a'), (2,'b'), (3,'c')]
    CODE:


>


    What is the signature of zipPair?


Problem 4: (Easy)
   Using the the data type Pair provided below,  
   write a Haskell script zipPairtype lst1 lst2, which 
   returns a list of Pairs.

    ....> zipPairType [1,2,3] "abcde"
    [Pair 1 'a',Pair 2 'b',Pair 3 'c']
    (185 reductions, 360 cells)


> data Pair a b = Pair a b   deriving Show


> zipPairType [] _ = []
> zipPairType _ [] = []
> zipPairType (h:t) (n:ns) = ???

4b)  What is the signature of zipPairType?





5)(Easy) Write a Haskell script using primitive recursion, 
        numToBoolR test lst
   that goes through a list of numbers and produces a Bool list.
        ...> numToBoolR even [1,3,2,4]
        [False, False, True, True]
CODE HERE:

>

6)(Easy) Write a Haskell script using list comprehension and lambda expression,
       numToBoolLC test lst, 
   that goes through a list of numbers and produces a Bool list. 
   Notice there are "no arguments"

        ...> numToBoolLC even [1,3,2,4]
        [False, False, True, True]
CODE HERE:

> numToBoolLC  =  ???


7) (Sort of Easy)Write a Haskell script using list comprehension, list all 
   Pythagorean triples starting from 1 to 50
      ...>Main> pyth
      [(3,4,5),(5,12,13),(6,8,10),(7,24,25),(8,15,17),(9,12,15),(9,40,41),(10,24,26),(
      12,16,20),(12,35,37),(14,48,50),(15,20,25),(15,36,39),(16,30,34),(18,24,30),(20,
      21,29),(21,28,35),(24,32,40),(27,36,45),(30,40,50)]
      (494 reductions, 1100 cells)
 
Code HERE:

> pyth =  ??
>           


Problem 8: (Easy)
  Define in Haskell a primitive recursive function "every" 
  so that "every n xs" creates a list containing
  every nth element xs.  (You may use pattern matching for your cases.)
  You may use a built-in function. i.e.
     ....> every 3 "abcasdfagefegeadgfertafhjhlkjhl"
     "aafegdeajkl"
     (808 reductions, 1137 cells)
     ....> every 5 [1 .. 50]
     [1,6,11,16,21,26,31,36,41,46]
     (1966 reductions, 2775 cells)

> every 0 _ = []
> every _ [] = []
> every n (a:as) =  ???
> 

Problem 9: 
  Redo problem 8 using list comprehension.

> everyL n xs
>     | n>0 =   ????
>     | otherwise = []



Problem 10: (easy)
We can represent the coefficients of a polynomal 
     an x^n + an-1 x^(n-1) +...+ a0 using a 
     list = [ a0, a1, ... , an ].

Calculate the value of a polynomial (using the above notation)
employing list comprehension and built-in functions.  (One line wonder)
   calPoly coef x

CODE HERE:

> calPoly coef x =  ????



Problem 11: Define a function occurence so that 
                occurrence xs
           returns a list containing one copy of each element of xs paired
           with the number of times it occurs.  
              ...>occurrence [5,2,3,2,4,3,2,5]
              [(5,2),(2,3),(3,2),(4,1)]
              (215 reductions, 465 cells)
              ....> occurrence "abchahabeme"
              [('a',3),('b',2),('c',1),('h',2),('e',2),('m',1)]
              (415 reductions, 905 cells)


           Don't restrict yourself to a single function definition.  Consider
           using nested definitions to break the task into simpler subtasks.

> occurrence :: Eq a => [a] -> [(a,Int)]
> occurrence [] = []
> occurrence (e:et) = ??
>     where

    




Problem 12:
   Write a script that returns the average of a list of Integral.
 
      ...> averageOfList [4,3,2,1]
      2.5
      (87 reductions, 177 cells)

    You do NOT need to use recursion... ONLY function application.

CODE::  



>


Problem 13:
   Write a script that returns the running average of a list of numbers (nums)

   ...> runningAver [4,3,2,1]
   [2.5, 2, 1.5, 1.0]
   
   
CODE:  
 
> runningAver 



Problem 14: (easy)
   If "funL" is a list of elements of the type a->b->c and argList is a list 
   of elements of type a, write a recursive program, "applyFun" that returns 
   a list with  elements of the type b->c.  You may assume that both lists are
   the same length.
   
  {To "see" partically evaluated functions i.e.
     ...> (+) 1
     ERROR: Cannot find "show" function for:
     *** Expression : (3 +)
     *** Of type    : Integer -> Integer

     YOU CAN change the Hugs settings by
      ...> :set -u
     so when you type it in you will not get an error. i.e.
     ...> (+) 3
     primPlusInteger (Num_fromInt instNum_v35 3)
   
     }
(NOTE: The below output is not what Haskell will print out. 
       It will be of the form shown above.)
   
    ...> applyFun [(+), (-), (+)] , [1, 100, 5]
    [(1 +), (100 -), (5 +)]


CODE:

> 

Problem 15:  Define a class Countable with a single signature function, count.  
             The purpose of count is to return the number of items in a collection,  
             where collections include lists, tuples, etc.
             Consider Int to be a "collection" of size 1, and similarly for the 
             other non-collection types, Float, Bool, and Char.  For a tuple
             or a list, the count is the sum of the counts of its elements (which
             may themselves be tuples, lists, etc.)  Remember that tuples of different
             lengths are of different types, so you'll need to give separate instance
             declarations for 2-tuples and 3-tuples. (Make the types above instances 
             of Countable.  
             i.e. You are to define a class Countable and make Int, Float, Bool, Char,
             2-tuples, 3-tuples and list instances of Countable.  Write a test function
             to make sure that the 2-tuples, 3-tuples and lists are 
             implemented properly.


   










