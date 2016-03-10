Written Part:
Purpose: Understanding of function composition. 

       Here are definitions from Prelude.hs: 
       and, or :: [Bool] -> Bool 
       and = foldr (&&) True 
       or = foldr (||) False 

       any, all :: (a -> Bool) -> [a] -> Bool 
       any p = or . map p 
       all p = and . map p 

       elem, notElem :: Eq a => a -> [a] -> Bool 
       elem = any . (==) 
       notElem = all . (/=) 

       Following the example of the unfolding of foldr1
       (http://bingweb.binghamton.edu/~head/CS471/NOTES/HASKELL/fold.html) 
       Show all the steps of 

       elem 3 [1,2,3,4,5] 
       ~> ..... 
       ~> True 

       and all the steps of 

       notElem 3 [2,4,6,8] 
       ~> ..... 
       ~> True 

ANSWER:
Show all the steps of
elem 3 [1,2,3,4,5]
=> any . (==) 3 [1,2,3,4,5]
=> any (==3) [1,2,3,4,5]
=> (or . map) (==3) [1,2,3,4,5]
=> or (map (==3) [1,2,3,4,5])
=> foldr (||) False (map (==3) [1,2,3,4,5])
=> (1==3) || (foldr (||) False (map (==3) [2,3,4,5]))
=> False || (2==3) || (foldr (||) False (map (==3) [3,4,5]))
=> False || False || (3==3) || (foldr (||) False (map (==3) [4,5]))
=> False || (3==3) || (foldr (||) False (map (==3) [4,5])) 
=> False || True || (foldr (||) False (map (==3) [4,5]))
=> True || (foldr (||) False (map (==3) [4,5]))
=> True || (4==3) || (foldr (||) False (map (==3) [5]))
=> True || False || (foldr (||) False (map (==3) [5]))
=> True || (foldr (||) False (map (==3) [5]))
=> True || (5==3) || (foldr (||) False (map (==3) []))
=> True || False || (foldr (||) False (map (==3) []))
=> True || (foldr (||) False (map (==3) []))
=> True || (foldr (||) False [])
=> True || False
=> True

notElem 3 [2,4,6,8]
=> (all . (/=)) 3 [2,4,6,8]
=> all (/=3) [2,4,6,8]
=> (and . map) (/=3) [2,4,6,8]
=> and (map (/=3) [2,4,6,8])
=> foldr (&&) True (map (/=3) [2,4,6,8])
=> (2/=3) && (foldr (&&) True (map (/=3) [4,6,8]))
=> True && (foldr (&&) True (map (/=3) [4,6,8]))
=> True && (4/=3) && (foldr (&&) True (map (/=3) [6,8]))
=> True && True && (foldr (&&) True (map (/=3) [6,8]))
=> True && (foldr (&&) True (map (/=3) [6,8]))
=> True && (6/=3) && (foldr (&&) True (map (/=3) [8]))
=> True && True && (foldr (&&) True (map (/=3) [8]))
=> True && (foldr (&&) True (map (/=3) [8]))
=> True && (8/=3) && (foldr (&&) True (map (/=3) []))
=> True && True && (foldr (&&) True (map (/=3) []))
=> True && (foldr (&&) True (map (/=3) []))
=> True && (foldr (&&) True [])
=> True && True
=> True


Module names should begin with a capital letter. 
The file name should match the module name exactly with the ".lhs" extension.

> module Haskell3F01 where
> import List




QUESTION 2
Write a Haskell function in the following format:

   >   palindrome :: String -> Bool
   >   palindrome [] = ...
   >   palindrome [x] = ...
   >   palindrome x = ... -- uses head, last, init, tail and primitive recursion

> palindrome :: String -> Bool
> palindrome [] = True
> palindrome [x] = True
> palindrome x = head x == last x && palindrome (init (tail x))



Or using composition


> palin :: String -> Bool
> palin [] = True
> palin [x] = True
> palin x = last x == head x && (palin.init.tail) x

The function determines if a String is a palindrome, i.e. the string and the
reverse of the string are the same.

QUESTION 3
Write a Haskell function:

> palindrome1 :: String -> Bool
> palindrome1 x = x == (reverse x)

Try using a function application of "reverse"

QUESTION 4
Write a Haskell function:

> palindromic :: [String] -> Bool

> palindromic [] = True
> palindromic [x] = palindrome x
> palindromic xs = head xs == (reverse (last xs)) && palindromic(init (tail xs))


Try using a combination of "reverse," "zipWith," and "and"

> palindromic1 :: [String] -> Bool
> palindromic1 x = and (zipWith (==) x (map reverse (reverse x)))



The function determines if this list of strings is palindromic IN THE FOLLOWING
SENSE: If you reverse the list AND, as you do that, you also reverse each string 
in the list, then that should be equal to the original list, e.g.
palindromic ["abc", "def", "ghg", "fed", "cba"] returns True
since the reverse of reversed strings is ["abc", "def", "ghg", "fed", "cba"] 

palindromic ["abc", "def", "ghig", "fed", "cba"] returns False
since the reverse of reversed strings is ["abc", "def", "gihg", "fed", "cba"] 

palindromic ["abc", "def", "ghg", "fred", "cba"] returns False
since the reverse of reversed strings is ["abc", "derf", "ghg", "fed", "cba"] 


Problem 4:(1-line solution) Rewrite reverse.

 Here is the definition of "foldr" that is in 
 "C:\Program Files\Hugs98\lib\Prelude.hs"
 foldr f z []      = z
 foldr f z (x:xs)  = f x (foldr f z xs)

 Next, recall from "Higher Order Function" notes that we can use the notation "e1~>e2" to mean
 expression e1 evaluates to expression e2 when we want to explain how
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

 For this problem fill in the expression ????? in the following definition 
 of reverse1, so that reverse1 is also a function that reverses a list.
 You should _NOT_ use "flip"
 
 reverse1 = foldr (\x y -> ?????) []

> reverse1 = foldr (\x y -> y ++ [x]) []




Problem 5.

Redo problem 11 from  homework 11(Haskell2F01). Use list comprehension 
notation as much as possible in your solution. (This is a one line wonder+ the emply list). 

Define a function occurrence so that 
           occurrence xs
returns a list containing one copy of each element of xs paired
with the number of times it occurs.  
     
      ...> occurrence [5,2,3,2,4,3,2,5]
      [(5,2),(2,3),(3,2),(4,1)]
      (251 reductions, 375 cells)
      ...> occurrence [1,2,3,4,5,4,3,3,2,5,2,3]
      [(1,1),(2,3),(3,4),(4,2),(5,2)]
      (460 reductions, 646 cells)

> occurrence [] = []
> occurrence xs@(h:hs) = 
>     (h,length [x| x<-xs, h == x]): occurrence [x|x<-hs, h /= x]

> occurrence1 xs@(h:hs) = 
>     (h,sum [1| x<-xs, h == x]): occurrence1 [x|x<-hs, h /= x]
> occurrence1 [] = []

Interesting solution using infinite lists and HOF


> occurrence2 [] = []
> occurrence2 ls@(h:t) = (h, length (filter (h==) ls)): occurrence (filter (h/=) ls)



Problem 6. (One line wonder is possible)
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
> runningProduct4 (h:t) = h: if t==[] then [] else runningProduct4 ((h* head t): tail t)


Problem 7.

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



For Problems 8 to 11 requires a major part of the solution to use HOF.

Problem 8:    (One line wonder)  
 Write a nonrecursive definition of "length".  
   (Use HOF, fold and or map --do not use sum)
    You may use my function "one" defined below and the compose function, ".".

   ...> lengthHOF "This is a list"
   14
   (96 reductions, 167 cells) 

> lengthHOF  = (foldr1 (+)).( map one)  
> one = (\x -> 1)
> lengthHOF2 = \list -> foldr1 (+) (map one list)
> lengthHOFgc = foldr ((+).(\x->1)) 0


Problem 9: (One Line Wonder) (typo name of function)
 prodPairHOF takes the product of each pair of numbers in a list.
   Write a nonrecursive definition.
   This can be done with only HOF, anonymous functions, fst and snd.
   (One line wonder.)
   ...>  prodPairHOF [(1,2),(4,5),(7,0)]
   [2,20,0]
   (46 reductions, 68 cells)

> prodPairHOF = map (\x -> fst x * (snd x))
> prodPairHOF2 = map (\ (a,b) -> (a*b))
> prodPairHOFgc = map (uncurry (*))

some other examples not using only HOF

> prodPairHOF3 xs = [fst i * (snd i) | i <- xs]

Problem 10:    (One line wonder)  
stringToDigit takes a string of digits and returns a list of Integers.
   Define it using HOF(fold and/or map) and any other needed functions.


   ...> stringToDigit "01239875" 
   [0,1,2,3,9,8,7,5]
   (109 reductions, 236 cells)  

> stringToDigit :: [Char] -> [Integer]
> stringToDigit = map (toInteger . digitToInt)  
> convertToDigit :: Enum a => [a] -> [Integer]
> convertToDigit = map (\c -> toInteger (fromEnum c - fromEnum '0'))

   
Problem 11: One line wonder.
Using map, filter, . (compose), ++, == and head
 define 
   listOfWds firstChar lstOfWds
that given a list of words, lstOfWds, and a character, firstChar, returns a list
of only the words that begin with firstChar .

  ...> listOfWds 't' ["the","only","two","only","words","are","'the and two'"]
  " the two"
  (208 reductions, 281 cells)

> listOfWds chr =(((foldr1 (++)) . (map (" "++))).(filter ((chr ==) . head)))

> listOfWds chr = foldr (++) "" . map (" "++) . filter ((==) chr . head)



