Purpose: review of functional programming concepts covered:
         function application
         function composition
         use of list comprehension notation
         use of map, fold and filter
         use of lambda expressions
         use of infinites in place of the use of loops in imperative languages


> module Haskell3F04 where
> import Char
> import List



Problem 1:
The function determines if a String is a palindrome, i.e. the string and the
reverse of the string are the same.

Write a Haskell function in the following format:

   >   palindrome :: String -> Bool
   >   palindrome [] = ...
   >   palindrome [x] = ...
   >   palindrome x = ... -- uses head, last, init, tail and explicit recursion

> palindrome :: String -> Bool
> palindrome [] = True
> palindrome [x] = True
> palindrome x = head x == last x && palindrome (init (tail x))



Problem 2: Repeat problem 1,
           use the compose function as part of your recursive solution

       > palinC :: String -> Bool
       > palinC [] = 
       > palinC [x] =
       > palinC x =  uses the same functions in use in 1 plus "." compose

> palin :: String -> Bool
> palin [] = True
> palin [x] = True
> palin x = last x == head x && (palin.init.tail) x


Problem 3:
Repeat problem 1
 use only boolean expression and built-in definitions, NO explicit recursion

 > palindrome1 :: String -> Bool
 > palindrome1 x = ???

> palindrome1 :: String -> Bool
> palindrome1 x = x == (reverse x)

Problem 4:
Write a Haskell function, palindromic.
The function determines if this list of strings is palindromic 
IN THE FOLLOWING SENSE: If you reverse the list AND, as you do that, 
                        you also reverse each string in the list, 
                        then that should be equal to the original list, e.g.
palindromic ["abc", "def", "ghg", "fed", "cba"] returns True
since the reverse of reversed strings is ["abc", "def", "ghg", "fed", "cba"] 

palindromic ["abc", "def", "ghig", "fed", "cba"] returns False
since the reverse of reversed strings is ["abc", "def", "gihg", "fed", "cba"] 

palindromic ["abc", "def", "ghg", "fred", "cba"] returns False
since the reverse of reversed strings is ["abc", "derf", "ghg", "fed", "cba"] 

You should return the value of a boolean expression if the list 
contains more than one element.  You should not be using HOF, 
list comprehension. The explicit recursion should be part of a boolean expression.  
If there is only one element then your solution can return the value of palindrome applied to the element.


 > palindromic :: [String] -> Bool
 > palindromic [] = 
 > palindromic [x] =
 > palindromic xs = 

> palindromic :: [String] -> Bool
> palindromic [] = True
> palindromic [x] = palindrome x
> palindromic xs = 
>     head xs == (reverse (last xs)) && palindromic(init (tail xs))


Problem 5:
Repeat problem 4: Try using a combination of "reverse," "zipWith," and "and"

   > palindromic1 :: [String] -> Bool
   > palindromic1 x =


> palindromic1 :: [String] -> Bool
> palindromic1 x = and (zipWith (==) x (map reverse (reverse x)))




Problem 6:(1-line solution) Rewrite reverse.

  Here is the definition of "foldr" that is in 
  "C:\Program Files\Hugs98\lib\Prelude.hs"
  foldr f z []      = z
  foldr f z (x:xs)  = f x (foldr f z xs)

 Next, recall from "Higher Order Function" notes that  we can use the 
 notation "e1~>e2" to mean expression e1 evaluates to expression e2 
 when we want to explain how
 a function works step-by-step. For example, in this question we are looking 
 for a function "f" that would produce the following sequence of evaluations:

foldr f [] [1,2,3]
~> f 1 (foldr f [] [2,3])
~> f 1 (f 2 (foldr f [] [3]))
~> f 1 (f 2 (f 3 (foldr f [] [])))
~> f 1 (f 2 (f 3 []))
~> f 1 (f 2 [3])
~> f 1 [3,2]
~> [3,2,1]

 Now, Haskell has a function "reverse" that reverses the order of the 
 elements in a list, e.g. reverse [1,2,3,4] => [4,3,2,1]. The definition 
 in Prelude.hs consists of 
 foldl            :: (a -> b -> a) -> a -> [b] -> a
 foldl f z []      = z
 flip           :: (a -> b -> c) -> b -> a -> c
 flip f x y      = f y x
 foldl f z (x:xs)  = foldl f (f z x) xs
 reverse   :: [a] -> [a]
 reverse    = foldl (flip (:)) []

 Complete reverse1 by replacing YOURLAMBDAEXPRESS with a 
 lambda expression which will reverse a list.  You should _NOT_ use "flip"
 
 > reverse1 = foldr YOURLAMBDAEXPRESS []

> reverse1 = foldr (\x y -> y ++ [x]) []


Problem 7: Define a function occurence such that 
                occurrence xs
       returns a list containing one copy of each element of xs paired
       with the number of times it occurs.  
           ...>occurrence [5,2,3,2,4,3,2,5]
           [(5,2),(2,3),(3,2),(4,1)]
           (215 reductions, 465 cells)
           ....> occurrence "abchahabeme"
           [('a',3),('b',2),('c',1),('h',2),('e',2),('m',1)]  
           (415 reductions, 905 cells)

Use list comprehension notation as much as possible in your solution. 
(This is a one line wonder+ the emply list). 



> occurrence [] = []
> occurrence xs@(h:hs) = 
>     (h,length [x| x<-xs, h == x]): occurrence [x|x<-hs, h /= x]

> occurrence1 xs@(h:hs) = 
>     (h,sum [1| x<-xs, h == x]): occurrence1 [x|x<-hs, h /= x]
> occurrence1 [] = []


Interesting solution using infinite lists and HOF


> occurrence2 [] = []
> occurrence2 ls@(h:t) = (h, length (filter (h==) ls)): occurrence (filter (h/=) ls)

> occurrenceJim list = [(x,length (elemIndices x list)) | x <- nub list]



Problem 8. (One line wonder is possible)
Using the ideas presented in computing the nth Fibonacci
number with infinite list structures 
(http://bingweb.binghamton.edu/~head/CS471/NOTES/HASKELL/4hSpr01.html#Fib) 
define 

   which calculates a running product, i.e.
   [ a0, a0 * a1, a0 * a1 * a2, ...

   from a list, [a0, a1, a2, ...

   ...> runningProduct [1 ..10]
   [1,2,6,24,120,720,5040,40320,362880,3628800]
   (332 reductions, 647 cells)
This can be done in one line or using a nested definition.

This can be done in one line.

> runProd ls@(h:t) = h:[f | f <- zipWith (*) (runProd ls) (t)]


> runningProduct :: [Integer] -> [Integer]
> runningProduct  (l:ls)  = ss
>     where ss = l:[ s | s <- zipWith (*) ss ls]

> runningProduct1 :: [Integer] -> [Integer]
> runningProduct1 ls@(h:t) = h:zipWith (*) t (runningProduct1 ls)

> runningProduct2 :: [Integer] -> [Integer]
> runningProduct2 prods = [product (take n prods)| n<-[1..length prods]]

This also handles empty list!!!

> runningProduct4 :: [Integer] -> [Integer]
> runningProduct4 (h:t) = 
>          h: if t==[] then [] else runningProduct4 ((h* head t): tail t)


Problem 9.

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


Problem 10:  (List comprehension)

(Only use list comprehension notation.)
(From Thompson 17.23)  Give a definition of the function

    factor :: Integral -> [Integral]

which returns a list containg the factors of a positive integer.  For instance

    factors 12 = [1,2,3,4,6,12]


---------------------- Answer factor (multiple solutions)  ----------------


> factors :: Integer -> [Integer]
> factors num = [f | f<- [1 .. num], (mod num f)==0]
> factors2 :: Integer -> [Integer]
> factors2 x = 1:[a | a<-[2..(div x 2)], (mod x a) == 0] ++ [x]
> factors3 :: Integer -> [Integer]
> factors3 x = 1:[a | a<-[2..(div x 2)], b<-[(div)x a], a*b==x] ++ [x]


Problem 11: You may also consider using factors but is not required. 
            You may consider using any combinition of the following techiques
            to express your solution
              list comprehension notation, or HOF or explicit recursion, or
               local definitions  
            (Thompson 17.25 )

Define the list of numbers whose only prime factors are a, b, and c , the
so-called Hamming numbers:


------------------------ Answer Hamming (multiple solutions) ----------------

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








