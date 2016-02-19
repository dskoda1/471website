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

Will fact3 terminate?

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
