Changed  Nov, 2012

This file uses the "literal" approach to programming in Haskell.
Code format:
	1) CODE needs to be signaled.  
	2) Code begins with a   ">"
	3) There MUST be blank lines before and after the code.  
   
A script(a program) contains a series of definitions.  
In Haskell the LAYOUT is used to state where one definition ends 
and the next one begins.

"Formally, a definition is ended by the first piece of text (code or comments)
which lies at the same indentation or to the left of the start of the 
definition." (Thompson, p.47). You can use tabs or (xor) spaces for 
indentation. 
This file uses spaces. _Mixing_tabs_and_spaces_ WILL lead to disaster.

Module names should begin with a capital letter. 
The file name should match the module name exactly with the ".lhs" extension.
i.e. Notes1.lhs

What files get loaded besides Prelude.hs and Notes.lhs?

> module Notes where
> import Prelude hiding (pi,cos)  -- Allows local definition of pi 



Because the definition given to pi in Prelude is hidden it can be 
redefined here.

> pi :: Double
> pi = 3.14159


> sq n = n^2
> cube x = x * (sq x)


Explicitly typing and constraining the function sq1 

> sq1 :: Int -> Int
> sq1 n = n^2


Recursive Functions:
Using Pattern Matching to define a recursive function.  
What happens if the input is negative? 

> factorialP :: Int -> Int 
> factorialP 0 = 1
> factorialP x = x * factorialP(x - 1)

Runtime error checking.

> factorial :: Int -> Int 
> factorial x
>     | x < 0     = error "neg x"
>     | x == 0    = 1
>     | otherwise = x * factorial(x - 1)

What is the different between the two definitions, factorial and factorial1? 
What is the result of:: 
   ...> factorial 50
   ...> factorial1 50 


> factorial1::Integer -> Integer
> factorial1 n
>     |n < 0    = error "neg n"
>     |n==0||n==1 = 1
>     |otherwise= n*factorial1(n-1)


What is the type of fact1?  
Can you explain why you get the error message "neg x" for 
   ...> fact1 1.2
Try this...
   ...> fact1 13
   ...> fact1 13::Int
Explain why the results are different.

> fact1 x
>     | x == 0    = 1
>     | x < 0     = error "neg x"
>     | otherwise = x *  fact1(x - 1)


Another version of factorial.  Here we use pattern matching.

> fact2  0     = 1
> fact2  n     = n * fact2 (n-1)


   
":" is the operator for constructing lists.

> testFilter list
>     | list == [] = []
>     | otherwise = if (head list > 6) 
>	               then head list : testFilter (tail list)
>		       else testFilter (tail list)


Person is just a synonym for the tuple contain a String and
an Int.  It is NOT a new type.  Try the Hugs command 
   ...> :t Person
   ...> :t z

> type Person = (String, Int)
> z :: Person
> z = ("John", 012345678)


Type constructors.  

1) Enumeration types:  

> data Color = Red | Blue | Pink

Color: nullary type constructor  (i.e. takes no parameters)
Red, Blue, Pink: nullary data constructor

----------

2) Product types:


> data People1 = Person1 String Int

People: nullary type constructor
Person: binary data constructor

You could have also defined People as followed:

> type Name = String
> type Age = Int
> data People = Person Name Age

Here Name is a synonym for String and Age is a Int.


> person = Person "John" 25
> person1 = Person1 "John" 25

All types in Prelude are in the class Show, which allows the
data to be displayed.  

> showPerson :: People -> String
> showPerson (Person n a) = n ++ "   " ++ show a

> showPerson1:: People1 -> String
> showPerson1 (Person1 n a) = n ++ "   " ++ show a


3) "Polymorphic" data type.  
The "typename" can have more than one type variable.
What is the type of the constructor Point?  
What different types of points can we have?


> data Point a = Pt a a

> firstCoord :: Point a -> a
> firstCoord (Pt m n) = m

> secondCoord :: Point a -> a
> secondCoord (Pt m n) = n

---------
4) Recursive type.  
The type is defined in terms of itself. Deriving "Show"

> data NTree = EmptyN | NodeN Int NTree NTree deriving Show

-- NTree:    nullary type constructor 
-- EmptyN:   nullary data constructor
-- NodeN:    binary data constructor     
 
--------
5) Recursive polymorphic data type.  
Combining both the ability to have types as a parameter and a recursive.
-- Leaf :   binary data constructor
-- Branch:    binary data constructor     

> data Tree a = Leaf a | Branch (Tree a) (Tree a) deriving Show

> fringe :: Tree a -> [a]
> fringe (Leaf x) = [x]
> fringe (Branch left right) = fringe left ++ fringe right

> treeSize :: Tree a-> Integer
> treeSize (Leaf x) = 1
> treeSize (Branch t1 t2) = treeSize t1 + treeSize t2

> treeI = Branch ( Branch (Leaf 3) (Branch (Leaf 2) (Leaf 10))) (Branch (Leaf 0)(Leaf 2))
> treeS =(Branch (Branch (Leaf "abc")(Leaf "LMN")) (Branch (Leaf "1") (Leaf "XYZ")))

Composition::

> inc = \x -> x+1
> inc2 = inc . inc

Use extract to illustrate curried functions (partically evaluated functions)
  define extractMin3 using extract.
  define extractMin3Max8 using extractMin3.

> extract::Int->Int->[Int]->[Int]
> extract min max list
>     |list == [] = []
>     |otherwise  = extractNonEmpty min max list
>     where
>          extractNonEmpty min max (a:x)
>                | (a >= min)&&(a <= max) = extract min max x
>                | otherwise = a:extract min max x

> extract1::Int->Int->[Int]->[Int]
> extract1 min max [] = []
> extract1 min max (a:x)
>   | (a >= min) && (a <= max) = extract1 min max x
>   | otherwise                = a:extract1 min max x



> quadroot :: Float -> Float -> Float -> [Float]
> quadroot a b c
>     | delta < 0    = error "complex roots"
>     | delta == 0   = [term1]
>     | delta > 0    = [term1+term2, term1-term2]
>     where
>         delta = b*b - 4*a*c
>         radix = sqrt delta
>         term1 = -b/(2.0*a)
>         term2 = radix/(2.0*a)


> quadrootL :: Float -> Float -> Float -> [Float]
> quadrootL a b c =
>   let delta = (b*b - 4*a*c)
>       radix = sqrt delta
>       term1 = -b/(2.0*a)
>       term2 = radix/(2.0*a)
>   in 
>    if delta > 0  then [term1+term2, term1-term2]
>                  else if delta < 0   then error "complex roots"
>                                      else [term1]






