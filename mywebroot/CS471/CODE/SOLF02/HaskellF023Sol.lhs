
Don't forget to rename file as defined in the instructions. You do not
have include above the "+++++" line in your hard copy.

Purpose:  Re-enforce programming recursive functions,
          experience functions as first class citizens,           
          practice with lambda expressions
          and using List Comprehension

Notes:
     Below you will see some sample output with reductions.  
     You can set Hugs to show your reductions by 

     ...>:set +s

     There are stubs for your code and type declarations in this file
     THEREFORE when you load this present file into HUGS.     


From the Gentle Introduction to Haskell:
   (Recall that ":" associates to the right.) 
   Note that x:xs appears both as a pattern on the left-hand side, and an
   expression on the right-hand side. To improve readability, we might 
   prefer to write x:xs just once, which we can achieve using an 
   as-pattern as follows: (Another advantage to doing this is that a 
   naive implementation might completely reconstruct x:xs rather than 
   re-use the value being matched against.) 
   i.e.
   f s@(x:xs)             = x:s  

   (Can you figure out what f does above?)


Practice:  DO NOT turn in.
What does 

   ...> sum[9,2,3]
do?

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
YOUR NAME, EMAIL

> module HaskellF023
>     where
> import List


Problem 1:  Easy
   Using the the data type Triple provided below,  
   write a Haskell script zipTType lst1 lst2, which 
   returns a list of Triples.

    ....> zipTType [1,2,3] "abcde" [3.4, 9.3]
    [Triple 1 'a' 3.4,Triple 2 'b' 9.3]



> data Triple a b c = Triple a b c  deriving Show



1b)  What is the signature of zipTType?


Problem 2:
  (See html for details)
  Horner's rule is an algorithm to evaluate a polynomial without 
  requiring the computation of arbitrary powers of x. 
  We can represent the coefficients of a polynomial 
     an x^n + an-1 x^(n-1) +...+ a0 using a 
     coef = [a0, a1, ...,  an ].

Write a haskell script that will evaluate a polynomial.  You may use
List comprehension notation and function application as part of your solution. 
DO NOT USE Primitive RECURSION.  USE LIST COMPREHENSION.  Use the ideas from 
the circular list structure as a solution for a fibSeq. 
http://bingweb.binghamton.edu/~head/CS471/NOTES/HASKELL/4hSpr02.html
This will solve the problem but does not use Horner's algorithm.
I have done it with recursion and list comprehension.  See what you come up
with.

John Meeks solved it using circular lists.
He had to reverse the order of the coefficients to get a solution.

i.e. use coef = [an, an-1, ... a1, a0]




> calcPoly coef x = sum [a * x ^ e  | (a, e) <- zip coef [0..]] 

> horner [c] x = c
> horner (h:cs) x = sum ( h: [(horner [c*x | c<- cs] x)])

this assumes the [an, an-1,.. a1,a0]

> hornerJ (coef:coefs) x = last horner2
>     where
>     horner2 =  coef : [h * x + c | (h, c) <- zip horner2 coefs ]


> hornerZ (coef:coefs) x = last horner3
>     where
>     horner3 =  coef : [v | v <- zipWith f horner3 coefs ]
>     f h c = h * x + c


Problem 3:
Recursion:
Define a function occurrence so that 
           occurrence xs
returns a list containing one copy of each element of xs paired
with the number of times it occurs.  
      ...> occurrence [5,2,3,2,4,3,2,5]
      [(5,2),(2,3),(3,2),(4,1)]
      (213 reductions, 446 cells)
      ...> occurrence [1,2,3,4,5,4,3,3,2,5,2,3]
      [(1,1),(2,3),(3,4),(4,2),(5,2)]
      (345 reductions, 734 cells)
      

Don't restrict yourself to a single function definition.  Consider
using nested definitions to break the task into simpler subtasks. 
You should be doing recursion for this problem.
 

CODE::

> occurrence [] = []
> occurrence (e:et) = (e,num) : occurrence next
>     where
>     (num, next) = count e et
>     count e [] = (1, [])
>     count e (h:t)
>	    | e == h  = (n+1, rest)
>           | otherwise = (n, h:rest)
>        where
>        (n,rest) = count e t



Problem 4: Using list comprehension as part of your solution:
Define a function occurrence so that 
           occurrenceLC xs
returns a list containing one copy of each element of xs paired
with the number of times it occurs.  
      ...> occurrenceLC [5,2,3,2,4,3,2,5]
      [(5,2),(2,3),(3,2),(4,1)]
      (213 reductions, 446 cells)
      ...> occurrenceLC [1,2,3,4,5,4,3,3,2,5,2,3]
      [(1,1),(2,3),(3,4),(4,2),(5,2)]
      (345 reductions, 734 cells)
THIS is a two line wonder and I will give the first line.


> occurrenceLC xs@(h:hs) =
>     (h,length [x| x<-xs, h == x]): occurrence [x|x<-hs, h /= x]
> occurrenceLC [] = []

> occurrence2 xs@(h:hs) =
>     (h,sum [1| x<-xs, h == x]): occurrence2 [x|x<-hs, h /= x]
> occurrence2 [] = []


> occurrenceJim list = [(x,length (elemIndices x list)) | x <- nub list]


Problem 5:
   Write a script that returns the average of a list of Integrals.  Use only
   function application not primitive recursion.  You will need to understand
   how Haskell handles numbers.  This is a one line wonder! (using composition and lF)
   Remember from HW 1 

> lF :: [a] -> Float
> lF = (\x -> encodeFloat ((toInteger . length) x) 0)


CODE::  

> averageOfList list = encodeFloat ((toInteger . sum) list) 0 / lF list


Problem 6:
recursion:

   Write a script that returns the running average of a list of numbers (nums).  
   You will can use 

   ...> runningAver [4,3,2,1]
   [2.5,2,1.5,1.0]

   This is just two lines of code.   
   
CODE:  

> runningAver [n] = [ encodeFloat n 0]
> runningAver list@(h:t) = averageOfList list : (runningAver t )




Problem 7: (Use list comprehension notation as part of the solution.)
(From Thompson 17.23)  Give a definition of the function

    factor :: Integral -> [Integral]

which returns a list containg the factors of a positive integer.  For instance

    factors 12 = [1,2,3,4,6,12]
There are many different solutions possible. I have 3 solutions each only one line of code.


> factors :: Integer -> [Integer]
> factors num = [f | f<- [1 .. num], (mod num f)==0]
> factors2 :: Integer -> [Integer]
> factors2 x = 1:[a | a<-[2..(div x 2)], (mod x a) == 0] ++ [x]
> factors3 :: Integer -> [Integer]
> factors3 x = 1:[a | a<-[2..(div x 2)], b<-[(div)x a], a*b==x] ++ [x]



Problem 8: (Use list comprehension notation in your solution)

Define the list of numbers whose only prime factors are 2,3, and 5 , the
so-called Hamming numbers:

hamming = [1,2,3,4,5,6,8,9,10,12,15, ...


> hamming = [y|y<-[1..], a<-[0..y], b<-[0..y], c<-[0..y], 2^a*3^b*5^c==y]
> hamming2 = 1:[h | h<- [1..], and [ok v | v<- tail (factors2 h)]]
>     where
>     ok = (\v -> (mod v 5 ==0)||(mod v 3 ==0)||( mod v 2 ==0))

> hamming3 = 1 : merge (f 2) (merge (f 3) (f 5))
>    where
>    f a = [ n*a | n <- hamming3 ]
>    merge (x:xs) (y:ys)
>     | x == y          = x : merge xs     ys
>     | x < y           = x : merge xs     (y:ys)
>     | otherwise       = y : merge (x:xs) ys




> hamming4 = 1 : merge (f 2) (merge (f 3) (f 5))
>    where
>      f a = [ n*a | n <- hamming4 ]
>      merge lx@(x:xs) ly@(y:ys)
>        | x == y          = x : merge xs     ys
>        | x < y           = x : merge xs     ly
>        | otherwise       = y : merge lx     ys





