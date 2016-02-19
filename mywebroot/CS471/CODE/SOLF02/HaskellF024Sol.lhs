> module HaskellF024Sol
>     where


Problem 1.

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
> e3X x = sum series
>     where
>     powers = powersOf x
>     series = takeWhile ((>0.00001))
>                         [ p / f | (p,f)<-zip powers fact]
>

> eToxGC :: Double -> Double
> eToxGC x = sum (takeWhile (>0.000001) [x^n/ fact!!n | n<-[0..]])

> e2xGC :: Double -> Double
> e2xGC x = sum (takeWhile (>0.000001) [x^n/ product (take n [1..]) | n<-[0..]])

> e2x2GC :: Double -> Double
> e2x2GC x= sum (takeWhile (>0.000001) (zipWith (/) ((\x -> iterate (\n -> x*n) 1 ) x) fact ))

> e2x3GC :: Double -> Double
> e2x3GC x= sum (takeWhile (>0.000001) (zipWith (/) (powersOf x) fact ))

e2x2GC is the best at about 25% faster than the example calls.


2) Write a nonrecursive definition of "length".  
   (Use HOF, fold and or map --do not use sum)
    You may use my function "one" defined below and the compose function, ".".

   ...> lengthHOF "This is a list"
   14
   (96 reductions, 167 cells) 

> lengthHOF  = ((foldl1 (+)). (map one))
> lengthHOF2  = /lst -> (foldl1 (+) (map one lst)) 
> one = (\x -> 1)



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
> composeList (h:t) = h . composeList t

> composeList1 [f] = f
> composeList1 (h:t) = h . composeList1 t

> composeListHOF  = foldr (.) id
> composeListHOF2 = foldl (.) id

> composeListHOF3  = foldr1 (.) 
> composeListHOF4 = foldl1 (.) 


Problem 5.
Use the HOF, map, to square the values of a list.
       ...> sqLst [1,2,3]
            [1,4,9]
CODE:


> sqLst  = map (\x -> x*x) 
> sqLst2 = \lst -> map (\x -> x*x) lst



Problem 6:

Using HOF,(fold, map and/or filter and lambda expressions) 
write a script, average3, that returns the average of 
a list of doubles. Do NOT use length or sum functions.  You can use + and /
This is a one line wonder.
 
   HaskellF024> aver [3.0,2.0,1.0,4.0,5.0,6.0] 
   3.5http://bingweb.binghamton.edu/%7Ehead/CS471/NOTES/HASKELL/4hF02.html
   (86 reductions, 108 cells)


> aver lst = (foldr (+) 0.0 lst)/(foldr (+) 0 (map (\x->1.0) lst))


Problem 7.
Using HOF (map, fold and/or filter) define addTuples that each pair in a list.
 
   HaskellF024> addTuples [(1,2), (3,4), (11,21)]
   [3,7,32]
   (64 reductions, 97 cells)

> addTuples = map (\(x,y) -> x+y)
> addTuples2 = map (uncurry (+))
> addTuples3 = (map . uncurry) (+)


