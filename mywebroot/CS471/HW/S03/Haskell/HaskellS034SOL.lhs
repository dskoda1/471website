YOUR NAME, EMAIL
Don't forget to rename file as defined in the instructions. You do not
have include above the "+++++" line in your hard copy.

Purpose:  To practice the abstraction using Higher order function.
          Some more experience with list comprehension notation.
          
Practice and experimenting:
You can switch off the requirement of using "show" in the display by
   > :s -u
and turning it on
   > :s +u
If "show" is turned on then the following will generate an error

   HaskellS034> :s +u
   HaskellS034> (+)
   ERROR - Cannot find "show" function for:
   *** Expression : (+)
   *** Of type    : Integer -> Integer -> Integer


Turning off show will give you:

   HaskellS034> :s -u
   HaskellS034> (+)
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
  (Defined below)


10.2 (Thompson) (id is a built in function) 
     If id is the polymorphic identity function, defined by
      id x = x
     explain the behavior of the expressions:
     
     (id . f)       (f .id )         id f

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


> module HaskellS034SOL where
> import List

> mapMap = map map

> mapNext = mapMap [odd, even, (10 >), (10<)]

> mapF = map  (\x-> x [1,2,3,11,12,13]) mapNext

> mapmap = map (\x-> x [1,2,3])(mapMap [odd,even])


Problem 1. 
Define a function that computes the value of e^x using the series expansion

       e^x = 1 + x + (x^2 / 2!) + ( x^3 / 3!) + ... + ( x^n / n!) + ...

  You may or may not find use for
  the below functions:
       powersOf and fact; 
  and the Prelude function: 
       sum, zip, zipWith, and takeWhile;
  in your definitions.  You can use "where clause" to
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
--------------------- Answer 1 (multiple solutions) -----------------

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


------------------------- Answer 2 ----------------------------

> composeList [] = id
> composeList (h:t) = h . composeList t

> composeList1 [f] = f
> composeList1 (h:t) = h . composeList1 t

> composeListHOF  = foldr (.) id
> composeListHOF2 = foldl (.) id

> composeListHOF3  = foldr1 (.) 
> composeListHOF4 = foldl1 (.) 


Problem 3. (easy)
Use the HOF, map, to square the values of a list.
       ...> sqLst [1,2,3]
            [1,4,9]
CODE:


   > sqLst  =  ?


-------------------------- Answer 3 --------------------------------

> sqLst  = map (\x -> x*x) 
> sqLst2 = \lst -> map (\x -> x*x) lst



Problem 4:
convertToDigit takes a string of digits and returns a list of Integers.
   Define it using HOF(fold and/or map) and any other needed functions.
   (One line wonder)

   ...> convertToDigit "01239875" 
   [0,1,2,3,9,8,7,5]
   (109 reductions, 236 cells)  


-------------------------- Answer 4 --------------------------------

> stringToDigit :: [Char] -> [Integer]
> stringToDigit = map (toInteger . digitToInt)  

--------- More general solution

> convertToDigit :: Enum a => [a] -> [Integer]
> convertToDigit = map (\c -> toInteger (fromEnum c - fromEnum '0'))




Problem 5:  (List comprehension)

(Only use list comprehension notation.)
(From Thompson 17.23)  Give a definition of the function

    factor :: Integral -> [Integral]

which returns a list containg the factors of a positive integer.  For instance

    factors 12 = [1,2,3,4,6,12]

---------------------- Answer factor (multiple solutions)  -----------------------------


> factors :: Integer -> [Integer]
> factors num = [f | f<- [1 .. num], (mod num f)==0]
> factors2 :: Integer -> [Integer]
> factors2 x = 1:[a | a<-[2..(div x 2)], (mod x a) == 0] ++ [x]
> factors3 :: Integer -> [Integer]
> factors3 x = 1:[a | a<-[2..(div x 2)], b<-[(div)x a], a*b==x] ++ [x]




Problem 6: (Use list comprehension notation in your solution.  You may consider
using local definitions.You may also consider using factors but is not
reauired.  Thompson 17.25 )

Define the list of numbers whose only prime factors are 2,3, and 5 , the
so-called Hamming numbers:

hamming = [1,2,3,4,5,6,8,9,10,12,15,16,18 ...

------------------------ Answer Hamming (multiple solutions) -------------------

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
>    f a = [ n*a | n <- hamming4 ]
>    merge lx@(x:xs) ly@(y:ys)
>        | x == y          = x : merge xs     ys
>        | x < y           = x : merge xs     ly
>        | otherwise       = y : merge lx     ys




> hamming5 = 1:2:3:4:5:6:[ x | x <- [8..], isHam x]
>   where
>   isHam z
>      | (z == 2) = True
>      | (z == 3) = True
>      | (z == 5) = True
>      | (mod z 5) == 0 = isHam (div z 5)
>      | (mod z 2) == 0 = isHam (div z 2)
>      | (mod z 3) == 0 = isHam (div z 3)
>      | otherwise = False

> hamming6 = 1:2:3:4:5:6:[ x | x <- [8..], isHam x]
>   where
>   isHam z
>      | (mod z 5) == 0 = (div z 5) == last(takeWhile (<=(div z 5)) hamming6)
>      | (mod z 2) == 0 = (div z 2) == last(takeWhile (<=(div z 2)) hamming6)
>      | (mod z 3) == 0 = (div z 3) == last(takeWhile (<=(div z 3)) hamming6)
>      | otherwise = False



> hammingHOF = 1 : merge (map (*2) hammingHOF) 
>                     (merge (map (*3) hammingHOF) 
>                            (map (*5) hammingHOF)) 
>     where
>     merge (x:xs) (y:ys) 
>       | x == y          = x : merge xs     ys 
>       | x < y           = x : merge xs     (y:ys) 
>       | otherwise       = y : merge (x:xs) ys



Problem 7. easy 
Using HOF (map, fold and/or filter) define addTuples that each pair in a list.
 
   HaskellS034> addTuples [(1,2), (3,4), (11,21)]
   [3,7,32]
   (64 reductions, 97 cells)

------------------------ Answer 7 (Multiple solutions) ---------------------------

> addTuples = map (\(x,y) -> x+y)
> addTuples2 = map (uncurry (+))
> addTuples3 = (map . uncurry) (+)





Problem 8. 
Using higjer order functions (map, fold or filter) and if necessary lambda
expressions. Write a definition for f1 and f2 so the following evaluation 
is valid:

     f1 (f2 (*) [1,2,3,4]) 5  ~> [5,10,15,20]

     Main> f1 ( f2 (*) [1,2,3,4]) 5
     [5,10,15,20]
     (77 reductions, 123 cells

------------------- Answer 8 ---------------------

> f1 lst y = map (\x -> x y) lst

> f2 = map





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


---------------------- Answer  9 --------------------------


> s8 = map (+1) . filter(> (-1))


problem 10:  One line wonder.

Using map, filter, . (compose), ++, == and head
 define 
   listOfWds firstChar lstOfWds
that given a list of words, lstOfWds, and a character, firstChar, returns a list
of only the words that begin with firstChar .

    ...> listOfWds 't' ["the","only","two","only","words","are","'the and two'"]
    " the two"
    (208 reductions, 281 cells)

   . ..> listOfWds2 't' ["the","only","two","only","words","are"," 'the and two' ","but","there","are", "three","more" ,"too"]
     " the two there three too"
     (557 reductions, 771 cells)

 ( note: This illustrates that "'" is a character.

    concat ["the","only","two","only","words","are","'the and two'"]                                                                                
    "theonlytwoonlywordsare'the and two'"
    (695 reductions, 984 cells)
 )


---------------------------- Answer 10 -----------------------------------------

> listOfWds chr =(((foldr1 (++)) . (map (" "++))).(filter ((chr ==) . head)))


> listOfWds2 chr = foldr (++)"" . map(" "++) . filter((chr ==) .head)
