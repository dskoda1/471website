> module Haskell3S04SOL 
> where
> import List


YOUR NAME, EMAIL


Purpose:  To practice the abstraction using Higher order function.
          Some more experience with list comprehension notation.
          Practice with number types.
          
Practice and experimenting:
You can switch off the requirement of using "show" in the display by
   > :s -u
and turning it on
   > :s +u

Remember you can orint no. reductions/cells after eval by setting "s"
   :s +s

What is the type of
   uncurry
What does it do?

What is the value of
   uncurry (+)

Keep working figuring out the inferred type:

What is the most general type (if any) of
   A) map map
   B) foldl foldl
   C) map foldl
   D) map . foldl

What is the value of :
   (map . foldl1) (-) [[1,2,3],[3,2,1],[100,200,300]]
    map (\v ->  v [4000,1000]) (map foldr1 [div,(-)])
    map (\f -> f [3,4,5])  (map map [(*) 3,(-) 4])



++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


Problem 1. The following is a simple definition of average 
of a non-empty list is :

> average :: [Integer] -> Double
> average ns = fromInteger  (sum ns) / (fromInteger . toInteger) ( length ns )

This code takes two passes over ns.  Define a more efficient implementation of
average which makes a single pass.  Defining a nested function with type
    sumAndLength :: [Int] -> (Int,Int)
which in one pass over ns the sum of the list and the length. sumAndLength will
be defined using primitive recursion.

_____________________________________
answer Please share other attempts

> averageFast :: [Integer] -> Double
> averageFast ns = total / count 
>     where
>     total = fromInteger (fst (totalCount ns))
>     count = fromInteger (snd (totalCount ns))
>     totalCount [n] = (n,1)
>     totalCount (n:ns) = (n+fst(totalCount ns), 1 + snd (totalCount ns))




Problem 2:
Below is a way to generate an infinite list of 2^n values.

> powersOf2 = iterate (\n -> n * 2) 1.0

Write a one line of code using circular list style.  You may use list
comprension notation.

> powersOf2CL = 1.0 : [2.0 * n| n <- powersOf2CL]


Problem 3:
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

> fact  = 1.0:zipWith (*) [1.. ] fact 


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


Problem 4:

(Only use list comprehension notation.)
(From Thompson 17.23)  Give a definition of the function

    factor :: Integral -> [Integral]

which returns a list containg the factors of a positive integer.  For instance

    factors 12 = [1,2,3,4,6,12]

---------------------- Answer factor (multiple solutions)  -------------------


> factors :: Integer -> [Integer]
> factors num = [f | f<- [1 .. num], (mod num f)==0]
> factors2 :: Integer -> [Integer]
> factors2 x = 1:[a | a<-[2..(div x 2)], (mod x a) == 0] ++ [x]
> factors3 :: Integer -> [Integer]
> factors3 x = 1:[a | a<-[2..(div x 2)], b<-[(div)x a], a*b==x] ++ [x]




Problem 5: (Use HOFs NOT list comprehension.  You may consider
using local definitions.You may also consider using factors but is not
required.  Thompson 17.25 )

Define the list of numbers whose only prime factors are a, b, and c , the
so-called Hamming numbers:

   Haskell3S04SOL> hamming 3 5 7
   1,3,5,7,9,15,21,25,27,35 ...



> hamming :: Integer -> Integer -> Integer -> [Integer]
> hamming a b c = zs
>     where 
>     zs = 1 : merge (map (a *) zs) (merge (map (b *) zs) (map (c *) zs))
>     merge (x:xs) (y:ys) 
>       | x == y          = x : merge xs     ys 
>       | x < y           = x : merge xs     (y:ys) 
>       | otherwise       = y : merge (x:xs) ys


problem 6:  One line wonder.

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


---------------------------- Answer 5 -----------------------------------------

> listOfWds chr =(((foldr1 (++)) . (map (" "++))).(filter ((chr ==) . head)))


> listOfWds2 chr = foldr (++)"" . map(" "++) . filter((chr ==) .head)

Problem 7 & 8:
Define a functions occurrences so that "occurrences" xs 
    returns a list containing 
  one copy of each element of xs paired with the number of times it occurs. i.e
   occurrences [5,2,3,2,4,3,2,5] ~> [(5,2), (2,3), (3,2), (4,1)]

Don't restrict yourself to a single function definition -- consider using 
auxiliary functions to break the task into simpler subtasks.

There will be two versions:
    occurrences3
      version will use explicit recursion and function application only.
    occurences8
      version will use list comprehensions as much as possible.



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



> occurrenceLC xs@(h:hs) = 
>     (h,length [x| x<-xs, h == x]): occurrence [x|x<-hs, h /= x]
> occurrenceLC [] = []
> occurrence2 xs@(h:hs) = 
>     (h,sum [1| x<-xs, h == x]): occurrence2 [x|x<-hs, h /= x]
> occurrence2 [] = []


> occurrenceJim list = [(x,length (elemIndices x list)) | x <- nub list]


problem 9:
Given a list of the binomial coefficient for the nth number calculate 
a list of binomial coefficient for the nth + number. You may use any style.
      binCoef :: (Num a) => [a] -> [a]
     (http://mathforum.org/dr.math/faq/faq.pascal.triangle.html)

Basically we are given the "nth" row in the pascal triangle and 
we want to calculate the next row.
      (http://mathforum.org/library/drmath/view/57243.html)
You can use a locally recursively defined function in your definition.  
  ...> binCoef [1,2,1]
  [1,3,3,1]
  (30 reductions, 66 cells)
  ...> binCoef (binCoef (binCoef [1,3,3,1]) )
  [1,6,15,20,15,6,1]
  (74 reductions, 192 cells)

  ...> (binCoef . binCoef . binCoef) [1,2,1]
  [1,5,10,10,5,1]
  (63 reductions, 157 cells)

> binCoef :: (Num a) => [a] -> [a]
> binCoef cs  = (head cs):sumTerms cs
>      where 
>      sumTerms (c1:c2:cs) = (c1+c2):sumTerms(c2:cs)
>      sumTerms [c]= [c]

> binCoefLC cs = head cs:[c| c <- zipWith (+) (init cs) (tail cs)]++ [last cs]
