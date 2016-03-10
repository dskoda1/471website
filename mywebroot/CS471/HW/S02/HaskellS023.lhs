Sunday 10:45am
This file has no incomplete code so it can be run with out changes.


> module HaskellS023
>     where



Practice and experimenting until "+++++":
You can switch off the requirement of using "show" in the display by
   > :s -u
and turning it on
   > :s +u

If "show" is turned on then the following will generate an error

   HaskellS023> :s +u
   HaskellS023> (+)
   ERROR - Cannot find "show" function for:
   *** Expression : (+)
   *** Of type    : Integer -> Integer -> Integer


Turning off show will give you:

   HaskellS023> :s -u
   HaskellS023> (+)
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




What is the value of mapmap ? Try and figure it out then run it.

 
> mapmap = map (\x-> x [1,2,3])(map map [odd,even])



10.2 (Thompson) (id is a built in function) 
     If id is the polymorphic identity function, defined by
      id x = x
     explain the behavior of the expressions:
     
     (id . f)       (f .id )         id f



+++++++++++++++++++++++++++++++++++ TURN IN ++++++++++++++++++++++++

Problem 1: 
Using the idea of the induction proof for problem 12 assignment 1
   (http://bingweb.binghamton.edu/~head/CS471/HW/hw1S02.html#Powerset)
create the power set of a set.  Where sets are represented as lists.
It might be easier if you define a local function addElementToSets.


Here is how I did the code in Prolog

powerset([],[[]]).
powerset([X|T],P):- powerset(T,PT),addElementToSets(X,PT,P).

addElementToSets(X,[],[]).
addElementToSets(X,[Set|ST],[[X|Set],Set|PT]):- addElementToSets(X,ST,PT)


   ...>Main> powerSet [1,2,3]
   [[1,2,3],[2,3],[1,3],[3],[1,2],[2],[1],[]]
   (197 reductions, 351 cells)
  ...> powerSet3 [1,2,3]
  [[1,2,3],[1,2],[1,3],[1],[2,3],[2],[3],[]]
  (237 reductions, 429 cells)
   ...> powerSet2 [1,2,3]
   [[1,2,3],[1,2],[1,3],[1],[2,3],[2],[3],[]]
   (207 reductions, 364 cells)



Problem 2:  Use List comprehension to replace addElementsToSets.
  ...> powersetLC [1,2,3]
  [[1,2,3],[1,2],[1,3],[1],[2,3],[2],[3],[]]
  (207 reductions, 364 cells)
   ...> powersetC [1,2,3]
   [[1,2,3],[1,2],[1,3],[1],[2,3],[2],[3],[]]
   (236 reductions, 429 cells


CODE HERE:




Problem 3. (Tuesday we will cover an example)

Define a function that computes the value of e^x using the series expansion

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


I have implemented 4 different solutions e2X and a more efficient version eToX.
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




Problem 4: Thompson 10.3
  Define a function composeList which composes a list of functions 
  into a single function.
  What is the effect of your function on an empty list of functions?
  This can be done as a one line wonder using HOF. 
  You may use any technique.   
  
 
    HaskellS023> composeList [ (*) 2, (*) 2] 2
    8
   (26 reductions, 32 cells)
    HaskellS023> composeList [ (-) 3 , (*) 2, (+)5 ] 7 
    -21
    (32 reductions, 41 cells
    HaskellS023>  composeListHOF [ (-) 3 , (*) 2, (+)5 ] 7
    -21
     (32 reductions, 41 cells)
    HaskellS023>  composeListHOF2 [ (-) 3 , (*) 2, (+)5 ] 7
    -21
    (33 reductions, 46 cells)





Problem 5.
Use the HOF, map, to square the values of a list.
       ...> sqLst [1,2,3]
            [1,2,9]
CODE:






Problem 6:

Using HOF,(fold, map and/or filter and lambda expressions) 
write a script, average3, that returns the average of 
a list of doubles. Do NOT use length or sum functions.  You can use + and /
This is a one line wonder.

   HaskellS023> aver [3.0,2.0,1.0,4.0,5.0,6.0] 
   3.5
   (86 reductions, 108 cells)



Problem 7.
Using HOF (map, fold and/or filter) define addTuples that each pair in a list.

   HaskellS023> addTuples [(1,2), (3,4), (11,21)]
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

 
  HaskellS023> p8 [-4,4, -3,3,12,-12]
  [5,4,13]
  (99 reductions, 153 cells)
  HaskellS023> s8 [-4,4, -3,3,12,-12]
  [5,4,13]
  (90 reductions, 137 cells)