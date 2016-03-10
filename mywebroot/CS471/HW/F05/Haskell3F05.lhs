> module Haskell3F05
>     where


Nov 21.
Practice and experimenting:
(Do not turn or print out the practice and experimenting section)

What do the following functions do?
  ...> drop 4 [1 .. 10]
  ...> take 4 [1 .. 10]
  ...> product [1..10]
  ...> dropWhile (>44) [100, 85 .. 1]
  ...> takeWhile (>44) [100, 85 .. 1]
  ...> splitAt 4 "abdcxyz"
  ...> fromEnum True
  ...> (\c -> fromEnum c - fromEnum 'A') 'a'

(This should be done right after HOF are introduced in Lecture)
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


___________________________________________________________________
Problem 1:

Redefine member function using List Comprehension with boolean expression. 
Use the name memberLC.
i.e. 
   Haskell3F05> memberLC 'a' "xyz"
   False
   Haskell3F05> memberLC 'a' "xyzabc"
   True





Problem 2: nukeDups takes a list of Eq's types and removes all duplicate elements.  
i.e.

  Haskell3F05> nukeDups [1,2,3,51,2,3,5,3,2,1,2,30,3,99,1,0,88]
  [1,2,3,51,5,30,99,0,88]

2a: nukeDupsPR should be coded in a primitive recursive style only.  
You may use a where or let to define "helper" functions, to make your code
more readable.


2b: nukeDupsLC should be coded using List Comprehension notation as much as possible.
    You definition may use recursive definition.



Problem 3:  (List comprehension)

(Only use list comprehension notation.)
(From Thompson 17.23)  Give a definition of the function

    factor :: Integral -> [Integral]

which returns a list containg the factors of a positive integer.  For instance

    factors 12 = [1,2,3,4,6,12]



Problem 4:  (Thompson 17.23 )

Define the list of numbers whose only prime factors are a, b, and c , the
so-called Hamming numbers:


   Haskell3F05> take 15 hamming
   [1,2,3,4,5,6,8,9,10,12,15,16,18,20,24]

 You may also consider using factors but is not required. 
 You may consider using any combinition of the following techiques
       to express your solution  list comprehension notation, 
       and/or explicit recursion, and/or local definitions . 
           



Problem 5. Redo problem 7 from Prolog homework 2.

Define prodRtoL nums, that given a non empty list of Nums, nums,  the result is a list of
      the prod of the numbers in nums  such that first value in the output is the product of 
      all the number nums, the second value in the output is the product of all the numbers 
      in nums except the first value in nums, etc.  Use primitive recursion.



Problem 6: Redo problem 8 from Prolog homework 2.

Define prodLtoR nums. which is similar to prodRtoL, except that product is
accumulate left to right. You may assume the input contains at least one value.  i.e. 
    Haskell3F05> prodLtoR [3,4,1,2,3]
    [3,12,12,24,72]




Problem 7:  Redo problem 6 using List comprehension notation as much as possible.
(hint look at the fast solution for fib)

i.e.
  Hsskell3F05> prodLC [3,4,1,2,3]
  [3,12,12,24,72]




