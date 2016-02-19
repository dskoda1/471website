> module HaskellS023
>     where


Practice and experimenting:
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


--------------------- FOR ME ---------------------

Prelude> :t map map
map map :: [a -> b] -> [[a] -> [b]]
Prelude> :t map foldl1
map foldl1 :: [a -> a -> a] -> [[a] -> a]
Prelude> :t map . foldl1
map . foldl1 :: (a -> a -> a) -> [[a]] -> [a]     

Prelude> map (\f -> f [3,4,5])  (map map [(*) 3,(-) 4])
[[9,12,15],[1,0,-1]]
(69 reductions, 169 cells)
Prelude>                        


Prelude> map foldl [(+),(*)]
[foldl (instNum_v35 Num_+),foldl (instNum_v35 Num_*)]
(21 reductions, 99 cells)

Prelude> map (\v ->  v [4000,1000]) (map foldr1 [div,(-)])
[4,3000]
(94 reductions, 158 cells)   

Prelude> :t map . foldl1
map . foldl1 :: (a -> a -> a) -> [[a]] -> [a]
Prelude> (map . foldl1) (-) [[1,2,3],[3,2,1],[100,200,300]]
[-4,0,-400]
(58 reductions, 113 cells)     

-----------------------------------------------------------------------

What is the value of mapmap ?

 
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

> powerSet3 [] = [[]]
> powerSet3 (e:es) = addToSets e (powerSet3 es) ++ (powerSet3 es)
>	    where
>           addToSets e (s:ss) = (e:s):(addToSets e ss)
>           addToSets e [] = []

> powerSet2 []=[[]]
> powerSet2 (e:es) = addToSets e set ++ set
>     where
>     set = powerSet2 es
>     addToSets e (s:ss) = (e:s):(addToSets e ss)
>     addToSets e [] = []


> powerSet [] = [ [] ]
> powerSet (e:t) = addToSets e (powerSet t) 
>     where
>     addToSets e (h:t)= (e:h):h:addToSets e t
>     addToSets e [] = []



Problem 2:  Use List comprehension to replace addElementsToSets.
  ...> powersetLC [1,2,3]
  [[1,2,3],[1,2],[1,3],[1],[2,3],[2],[3],[]]
  (207 reductions, 364 cells)
   ...> powersetC [1,2,3]
   [[1,2,3],[1,2],[1,3],[1],[2,3],[2],[3],[]]
   (236 reductions, 429 cells


CODE HERE:

> powerSetA []    = [[]]
> powerSetA (x:xs) = [(x:p)|p<-psxs] ++ psxs
>     where
>     psxs = powerSetA xs   

> powersetC [] = [[]]
> powersetC (hp:tp) = [hp:t|t<-(powersetC tp )]
>	              ++ powersetC tp   


Problem 3.

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

> eToX x = sum series
>     where
>     series =(takeWhile ((> 0.000001)) (terms))
>     terms = 1.0 : [ t*x / seq | (t,seq) <- zip terms [1.0 ..]]


> e2X x = sum series
>     where
>     powers = powersOf x
>     series = takeWhile ((>0.00001))
>                         [ (powers !! n )/ (fact!!n) | n<-[0..]]
>

> eToxGC :: Double -> Double
> eToxGC x = sum (takeWhile (>0.000001) [x^n/ fact!!n | n<-[0..]])

> e2xGC :: Double -> Double
> e2xGC x = sum (takeWhile (>0.000001) [x^n/ product (take n [1..]) | n<-[0..]])

> e2x2GC :: Double -> Double
> e2x2GC x= sum (takeWhile (>0.000001) (zipWith (/) ((\x -> iterate (\n -> x*n) 1 ) x) fact ))

> e2x3GC :: Double -> Double
> e2x3GC x= sum (takeWhile (>0.000001) (zipWith (/) (powersOf x) fact ))

e2x2 is the best at about 25% faster than the example calls.



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


> composeList [] = id
> composeList (h:t) = h . composeList t

> composeListHOF  = foldr (.) id
> composeListHOF2 = foldl (.) id



Problem 5.
Use the HOF, map, to square the values of a list.
       ...> sqLst [1,2,3]
            [1,2,9]
CODE:


> sqLst  = map (\x -> x*x) 
> sqLst2 = \lst -> map (\x -> x*x) lst



Problem 6:

Using HOF,(fold, map and/or filter and lambda expressions) 
write a script, average3, that returns the average of 
a list of doubles. Do NOT use length or sum functions.  You can use + and /
This is a one line wonder.
 
   HaskellS023> aver [3.0,2.0,1.0,4.0,5.0,6.0] 
   3.5
   (86 reductions, 108 cells)


> aver lst = (foldr (+) 0.0 lst)/(foldr (+) 0 (map (\x->1.0) lst))


Problem 7.
Using HOF (map, fold and/or filter) define addTuples that each pair in a list.
 
   HaskellS023> addTuples [(1,2), (3,4), (11,21)]
   [3,7,32]
   (64 reductions, 97 cells)

> addTuples = map (\(x,y) -> x+y)


Problem 8. 
Using higher order functions (map, fold or filter) and if necessary lambda
expressions. Write a definition for f1 and f2 so the following evaluation is valid:

     f1 (f2 (*) [1,2,3,4]) 5  ~> [5,10,15,20]

     Main> f1 ( f2 (*) [1,2,3,4]) 5
     [5,10,15,20]
     (77 reductions, 123 cells

> f1 lst y = map (\x -> x y) lst

> f2 = map

Problem 9: (Thompson 10.13)
  Find functions f1 and f2 so that
 
   s8 =  map f1 . filter f2

  has the same effect as
 

> p8 = filter (>0) . map (+1)


answer:

> s8 = map (+1) . filter(> (-1))
