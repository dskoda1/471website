YOUR NAME, EMAIL

Don't forget to rename file as defined in the instructions. Do not
include above the "+++++" line in your hard copy.  To save paper you
may also delete my examples for each problem.

Purpose:  To practice the abstraction using Higher order function.
          Some more experience with list comprehension notation.
          

Practice and experimenting:
 You can switch off the requirement of using "show" in the display by
   > :s -u
 and turning it on
   > :s +u

 If "show" is turned on then the following will generate an error

   HaskellF024> :s +u
   HaskellF024> (+)
   ERROR - Cannot find "show" function for:
   *** Expression : (+)
   *** Of type    : Integer -> Integer -> Integer

 Turning off show will give you:

   HaskellS034> :s -u
   HaskellS034> (+)
   primPlusInteger
   (10 reductions, 30 cells)

There practice problems will be useful to your 
understanding of HOF.  Please take look and think about
these problems a couple of times before the Haskell quiz.

Practice 1 ) What is the most general type (if any) of
   A) map map
   B) foldl foldl
   C) map foldl
   D) map . foldl

Practice 2) What is the value of :
   (map . foldl1) (-) [[1,2,3],[3,2,1],[100,200,300]]
    map (\v ->  v [4000,1000]) (map foldr1 [div,(-)])
    map (\f -> f [3,4,5])  (map map [(*) 3,(-) 4])


Practice 3) What is the value of mapmap ? Try and figure it out then run it.
  (Defined in the code: > mapmap = map (\x-> x [1,2,3])(map map [odd,even]) )
  

Practice 4 -- P0.2 (Thompson)) (id is a built in function) 
     If id is the polymorphic identity function, defined by
      id x = x
     explain the behavior of the expressions:
     
     (id . f)       (f .id )         id f

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

> module HaskellS034 where
> import List


> mapmap = map (\x-> x [1,2,3])(map map [odd,even])


Problem 1. 
Define a function that computes the value of e^x using the series expansion

       e^x = 1 + x + (x^2 / 2!) + ( x^3 / 3!) + ... + ( x^n / n!) + ...

  You may or may not find use for
  the below functions:
       powersOf and fact; 
  and the Prelude function: 
       sum, zip, zipWith, and takeWhile;
  in your definitions.  You can  use "where clause" to
  promote readability of your code. Your solution should discard all 
  terms of the series smaller than 0.000001.  


> powersOf x = iterate (\n -> n * x) 1.0

> fact = 1:zipWith (*) [1.0 ..] fact

I have implemented 2 different solutions e2X and a more efficient version eToX.  
    ...> eToX 3.5
    33.1154
    (492 reductions, 824 cells)
    ...> e2X 3.5
    33.1154
    (6544 reductions, 8402 cells)
    ...> eToX 5.1
    164.022
   (622 reductions, 1039 cells)
    Main> e2X 5.1
    164.022
    (10586 reductions, 13562 cells)



Problem 2: Thompson 10.3
  Define a function composeList which composes a list of functions 
  into a single function.
  What is the effect of your function on an empty list of functions?
  This can be done as a one line wonder using HOF. 
  You may use any technique.   
  
 
    HaskellS034> composeList [ (*) 2, (*) 2] 2
    8
   (26 reductions, 32 cells)
    HaskellS034> composeList [ (-) 3 , (*) 2, (+)5 ] 7 
    -21
    (32 reductions, 41 cells
    HaskellS034>  composeListHOF [ (-) 3 , (*) 2, (+)5 ] 7
    -21
     (32 reductions, 41 cells)
    HaskellS034>  composeListHOF2 [ (-) 3 , (*) 2, (+)5 ] 7
    -21
    (33 reductions, 46 cells)


> composeList [] = id
> composeList (h:t) =  ?


> composeListHOF  = ?





Problem 3. (easy)
Use the HOF, map, to square the values of a list.
       ...> sqLst [1,2,3]
            [1,4,9]
CODE:


> sqLst  =  ?



Problem 4:
convertToDigit takes a string of digits and returns a list of Integers.
   Define it using HOF(fold and/or map) and any other needed functions.
   (One line wonder)

   ...> convertToDigit "01239875" 
   [0,1,2,3,9,8,7,5]
   (109 reductions, 236 cells)  





Problem 5:  (List comprehension)

(Only use list comprehension notation.)
(From Thompson 17.23)  Give a definition of the function

    factors :: Integral -> [Integral]

which returns a list containg the factors of a positive integer.  For instance

    factors 12 = [1,2,3,4,6,12]



Problem 6: (Use list comprehension notation in your solution You may consider
using local definitions.  You may also consider using factors but is not
reauired.  Thompson 17.25 )

Define the list of numbers whose only prime factors are 2,3, and 5 , the
so-called Hamming numbers:

hamming = [1,2,3,4,5,6,8,9,10,12,15,16,18 ...





Problem 7. easy 
Using HOF (map, fold and/or filter) define addTuples that each pair in a list.
 
   HaskellS034> addTuples [(1,2), (3,4), (11,21)]
   [3,7,32]
   (64 reductions, 97 cells)



Problem 8. 
Using higher order functions (map, fold or filter) and if necessary lambda
expressions. Write a definition for f1 and f2 so the following evaluation 
is valid:

     f1 (f2 (*) [1,2,3,4]) 5  ~> [5,10,15,20]

     Main> f1 ( f2 (*) [1,2,3,4]) 5
     [5,10,15,20]
     (77 reductions, 123 cells




Problem 9: (Thompson 10.13)
  Find functions f1 and f2 so that
 
   s8 =  map f1 . filter f2

  has the same effect as
 

> p8 = filter (>0) . map (+1)

 
  HaskellS034> p8 [-4,4, -3,3,12,-12]
  [5,4,13]
  (99 reductions, 153 cells)
  HaskellS034> s8 [-4,4, -3,3,12,-12]
  [5,4,13]
  (90 reductions, 137 cells)
  HaskellS034> p8 [1, 0, -1, 3, -3]
  [2,1,4]
  (109 reductions, 155 cells)
  HaskellS034> s8 [1, 0, -1, 3, -3]
  [2,1,4]






problem 10:  One line wonder.

Using map, filter, . (compose), ++, == and head
 define 
   listOfWds firstChar lstOfWds
that given a list of words, lstOfWds, and a character, firstChar, returns a list
of only the words that begin with firstChar . 

     ...> listOfWds 't' ["the","only","two","only","words","are"," 'the and two' "]
     " the two"
     (208 reductions, 281 cells)

    ...> listOfWds2 't' ["the","only","two","only","words","are"," 'the and two' ","but","there","are", "three","more" ,"too"]
    " the two there three too"
     (557 reductions, 771 cells)

( note: This illustrates that "'" is a character.

    concat ["the","only","two","only","words","are","'the and two'"]                                                                                
    "theonlytwoonlywordsare'the and two'"
    (695 reductions, 984 cells)
)