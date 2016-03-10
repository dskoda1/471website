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

What files get loaded besides Prelude.hs and Notes1.lhs?  
Data. is for GHCi 7

> module Notes1 where
> import Prelude hiding (pi,cos)  -- Allows local definition of pi 
> import Data.List



Because the definition given to pi in Prelude is hidden it can be 
redefined here.

> pi :: Double
> pi = 3.14159

Implicitly typed functions, sq and cube.
Use the Hugs command :type, i.e.,
  ...> :t next5numbers
to check implied type of these functions.

> next5numbers n = [n+1,n+2,n+3,n+4,n+5]
> sq n = n^2
> cube x = x * (sq x)

Explicitly typing the function sq1

> sq1 :: Int -> Int
> sq1 n = n^2


Recursive Functions:
Using Pattern Matching to define a recursive function.  Notice
we can not constrain the input to only positive numbers.

> factorialP :: Int -> Int 
> factorialP 0 = 1
> factorialP x = x * factorialP(x - 1)

The only different between the two definitions, factorial and factorial1
is the typing of the functions.  Both Int and Integer are in the class Num 
defined in Prelude. (What other types are in Num?)
To see effects of the different  between factorial and factorial1 try 
applying the values 50, 500 and 3500 to both functions. i.e.
   ...> factorial 50
   ...> factorial1 50 

> factorial :: Int -> Int 
> factorial x
>     | x < 0     = error "neg x"
>     | x == 0    = 1
>     | otherwise = x * factorial(x - 1)

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

Will fact3 terminate? This worked in older verision Haskell

   > fact3 0     = 1
  > fact3 (n+1) = (n+1) * fact3 n

Another version of factoral using only theda(n) multiplication
l(!!)n gets the nth element in list l

> fact4 n =  last f4
>     where f4  = ([1] ++ [ nx * f4!!(nx-1) | nx <- [1..n]])

A faster definition using only theda(n) multiplication without the cost of (!!)

> fact5  n =  last f5
>     where f5 = [1] ++ [ n*f | (n,f) <- zip [1..n] f5 ]

Using the builtin "takewhile".  Looks like a while loop.  How is takeWhile
defined in the Prelude?

> fact6 n = product (takeWhile (<= n) [1 ..])

   
Try this...
Just enter
  ...> primes
(What is the type of sieve? )

> primes :: [Int]
> primes = sieve [2..]
> sieve (a:x) = a:sieve[y | y<-x, y `mod` a >0]
> sieve [] = []

Applicative order ($!) take 10 primes1 goes infinite.

> primes1 :: [Int]
> primes1 = sieve1 [2..]
> sieve1 (a:x) = (:) a $! (sieve1[y | y<-x, y `mod` a >0])
> sieve1 [] = []


What is the type of x?

> x = (factorial1 13) - 1932053504
> y = x `div` 2

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

Constructors are special kinds of functions

> data People3 = Person3 String Int deriving Show

> build :: [String] -> [Int] -> [People3]
> build strs nums  = zipWith Person3 strs nums

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

> instance Functor Tree where
>     fmap f (Leaf x) = Leaf (f x)
>     fmap f (Branch t1 t2) = Branch (fmap f t1) (fmap f t2)

You can add 5 to each Leaf in tree by
   fmap (5 +) tree


> inc = \x -> x+1
> inc2 = inc . inc


> addLists list1 [] = []
> addLists list1 (a:x) = addListElem list1 a ++ addLists list1 x

> addListElem [] a = []
> addListElem (b:x) a = (b+a) : addListElem x a

> fib 1 = 1
> fib 2 = 1
> fib n
>     | n > 2  = fib(n-1)+fib(n-2)
>     |otherwise = error "n>0 pls."
> slowFibSeq = [fib n | n <- [1..]]

> fibSeq   = 1 : 1 : [ a+b | (a,b) <- zip fibSeq (tail fibSeq) ]    
>
> nFib n =  fibSeq !! (n-1)

> perms :: Eq t => [t] -> [[t]]
> perms [] = [[]]
> perms x=[a:p|a<-x,p<-perms(x\\[a])]

Another algorithm for permutation:

> perm2 :: [a] -> [[a]]
> perm2 [] = [[]]
> perm2 (x:xs) = [ps ++ [x] ++ qs | rs <- perm2 xs, (ps,qs) <- splits rs]
>	 where
>         splits :: [a] -> [([a],[a])]
>         splits [] = [ ([],[])]
>	  splits (y:ys) = ([], y:ys) : [(y:ps, qs) | (ps,qs)<- splits ys]


> isEven x = (x `mod` 2 == 0)
> -- nonEmpty :: [t] -> Bool
> -- nonEmpty x = (x /= [])


--------------------------------------------------
USING WHERE
Where allows for local definitions of variables.
--------------------------------------------------

> fun x = y + z
>     where y = 2 * z
>           z = x * x

The series for generating the value of cosine using radians is:
cos x = 1 - (x^2 / 2!) + 
          + (x^4/ 4!) 
          - (x^6 / 6!) 
          + ... 
          + (-1)^n x^(2n)/(2n)! 
          +...

 (^ represents exponents)

The Haskell definition below uses terms already computed 
to reduce the cost of computing later terms, 
( "." is function composition, ":" is the List constructor. )

> cos x = sum (takeWhile((>0.00001).abs) (series x))
>   where
>     series :: Double -> [Double]
>     series x = terms
>     terms = 1.0 :[ (-t*x*x)/(n*(n-1)) | (t,n)<- zip terms [2.0, 4.0 ..]]


Function application : f(g x)
Function composition : (f . g ) x

> inc3 x = x + 1


to apply inc to itself just enter
     inc3 (inc3 v)

to compose inc with it self
     (inc3 . inc3 ) v
You can do function composition on the command line in Hugs.
   ...> (inc3 . inc3) 5
   ...>:t inc3 . inc3
   ...>:t (inc3 . inc3) 5
   ...>:t inc3(inc3 5)

reverseUntil uses a higher function takeWhile, and .
What is its type?

> reverseUntil p = reverse . takeWhile (not . p)

> ay = 'a': ay


Notice selecteven returns a tuple of lists.

> selecteven :: Int -> ([Int],[Int]) -> ([Int], [Int])
> selecteven i (evenList, oddList) 
>     | odd(i) = (evenList, i:oddList)
>     | otherwise = (i:evenList, oddList)

Using strict (application) evaluation 

> fs x = 2
> es :: Int -> Int
> es x = error "Sorry"
> tNormal1 x = fs (es x)
> tNormal2 x = fs $ (es x)
> tNormal2A = fs $ es
> tNormal3 = (fs . es)
> tAppl x = fs $! (es x)
> tApplA = fs $! es
