YOUR NAME, EMAIL
Don't forget to rename file as defined in the instructions. You do not
have include above the "+++++" line in your hard copy.

Purpose:  To practice the abstraction using Higher order function.
          To build new types in Haskell.
          
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

   HaskellF024> :s -u
   HaskellF024> (+)
   primPlusInteger
   (10 reductions, 30 cells)

What is the most general type (if any) of
   A) map map
   B) foldl foldl
   C) map foldl
   D) map . foldl

What is the value of :
   (map . foldl1) (-) [[1,2,3],[3,2,1],[100,200,300]]
    map (\v ->  v [4000,1000]) (map foldr1 [div,(-)])
    map (\f -> f [3,4,5])  (map map [(*) 3,(-) 4])


Notes:

> module HaskellF024 where
> import List


1. Define a function that computes the value of e^x using the series expansion

       e^x = 1 + x + (x^2 / 2!) + ( x^3 / 3!) + ... + ( x^n / n!) + ...

  You may or may not find use for
  the below functions:
       powersOf and fact; 
  and the Prelude function: 
       sum, zip, zipWith, and takeWhile;
  in your definitions.  You should use "where clause" to
  promote readability of your code. Your solution should discard all 
  terms of the series smaller than 0.000001.  


> powersOf x = iterate (\n -> n * x) 1.0

> fact  = 1.0:[ n*f | (n,f) <- zip [1.. ] fact ]


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





2. Write a nonrecursive definition of "length".  
   (Use HOF, fold and or map --do not use sum)
    You may use my function "one" defined below and the compose function, ".".

   ...> lengthHOF "This is a list"
   14
   (96 reductions, 167 cells) 

> lengthHOF  = STUB
> one = (\x -> 1)

CODE HERE:



Problem 3: Thompson 10.3
  Define a function composeList which composes a list of functions 
  into a single function.
  What is the effect of your function on an empty list of functions?
  This can be done as a one line wonder using HOF. 
  You may use any technique.   
  
 
    HaskellF024> composeList [ (*) 2, (*) 2] 2
    8
   (26 reductions, 32 cells)
    HaskellF024> composeList [ (-) 3 , (*) 2, (+)5 ] 7 
    -21
    (32 reductions, 41 cells
    HaskellF024>  composeListHOF [ (-) 3 , (*) 2, (+)5 ] 7
    -21
     (32 reductions, 41 cells)
    HaskellF024>  composeListHOF2 [ (-) 3 , (*) 2, (+)5 ] 7
    -21
    (33 reductions, 46 cells)


> composeList [] = id
> composeList (h:t) =  ?


> composeListHOF  = ?





Problem 5. easy
Use the HOF, map, to square the values of a list.
       ...> sqLst [1,2,3]
            [1,4,9]
CODE:


> sqLst  =  ?


Problem 6:

Using HOF,(fold, map and/or filter and lambda expressions) 
write a script, average3, that returns the average of 
a list of doubles. Do NOT use length or sum functions.  You can use + and /
This is a one line wonder.
 
   HaskellF024> aver [3.0,2.0,1.0,4.0,5.0,6.0] 
   3.5
   (86 reductions, 108 cells)

> aver


Problem 7. easy 
Using HOF (map, fold and/or filter) define addTuples that each pair in a list.
 
   HaskellF024> addTuples [(1,2), (3,4), (11,21)]
   [3,7,32]
   (64 reductions, 97 cells)



