Here are are some examples that you may find useful in doing your homework.
In doing your homework you may us any of the built in definitions in the 
library.
Notice that the comments do not have any special symbols but the code does.  

It is important that the code is separated from the comments by a blank line.

NOTE: module names must begin with a capital letter!

> module Hw9 where
> import Char


allLowerCase converts a string to all lower case. 
Notice that String is a type defined in Prelude to just be [Char]
My Haskell script uses list comprehension to convert any upper case Chars to 
lower case.

> allLowerCase::[Char]->[Char]
> allLowerCase str = [toLower c | c <- str]

allLowerCaseR is a recursive version which use ":".  
Notice the String is another name for [Char]

> allLowerCaseR :: String -> String
> allLowerCaseR (c:cs) = toLower c:allLowerCase cs
> allLowerCaseR [] = []



Using ordinary recursion over a list and pattern matching to 
delete a character from a string.  Notice the use of pattern matching.
What would happen if removeR r [] = [] was not included?


> removeR :: Char -> String -> String
> removeR r [] = []
> removeR r (c:cs)  
>     |(c == r) = removeR r cs
>     | otherwise = [c] ++ removeR r cs



Using list comprehension in the definition of
  removeL
 deletes any character r from a string.

> removeL :: Char -> String -> String
> removeL r str = [c | c <- str, c/=r]

Removes punctuation from a string.

> removePunctuation = foldr1 (.) [removeL c | c<-",.;:'\"?()!"]

You may use any command you find in the Char library.

Some addition interesting examples:
Pythagorean Triple  page 345 (Thompson)

> pyTriple n  = [ (x,y,z) | 
>	x <- [ 2 .. n ] , y <- [x+1 .. n] , z <- [y+1 .. n], x*x + y*y == z*z ]


Sorting Algorithms:
Insertion Sort

> iSort :: Ord a => [a] -> [a]
> iSort [] = []
> iSort (x:xs) = ins x (iSort xs)

> ins :: Ord a => a -> [a] -> [a]
> ins x [] = [x]
> ins x (y:ys)
>     | x <= y = x:(y:ys)
>     | otherwise = y : ins x ys


Insertion Sort using foldr

> iSortF :: Ord a => [a] -> [a]
> iSortF xs = foldr ins [] xs

Example using algebraic types

> data Shape = Circle Float |
>	        Rectangle Float Float |
>	        Square Float

Using Pattern Matching to define functions by cases

> isRound :: Shape -> Bool
> isRound (Circle _)      = True
> isRound (Rectangle _ _) = False
> isRound (Square _)      = False

Calculating area for different shapes.

> area :: Shape -> Float
> area (Circle r)     = pi*r*r
> area (Rectangle h w) = h*w
> area (Square s)     = s*s

To use enter:
   ..> area (Square 10)
   100.0
   ..> area (Rectangle 10 0.5)
   5.0

You may use this Data type 

> data Point = Pt Float Float


Another example: I define a local "varible myT"

> test x y = [myT ws | ws <- (zip x y) ]
>  where
>     myT (a,b) = a*b

THE END
Note if you use the literal style you must have a 
"new line"  with or without comments following the last line of code.
