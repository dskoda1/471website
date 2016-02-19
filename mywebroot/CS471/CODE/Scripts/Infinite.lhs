The examples in this file illustrates
  1) Increasing generalize functions.
  2) How infinite data structures can play a role like loops, and functions
     applied to them serve like termination conditions.  By enabling loops
     and their termination conditions to defined separately infinite 
     lists provide a new way to modularize functional programs.


> powersOfTwo :: [Integer]
> powersOfTwo = [2^n | n <- [0 ..]]

> powersOf :: Integer -> [Integer]
> powersOf x = [x^n | n <- [0 ..]]

> powersOfFast n = pwrs
>     where
>     pwrs = 1: [n*p| p <-pwrs]

> pow x = 1:x:[x*y|y <- tail (pow x)]
> pow2 x = 1:[x*y | y <- (pow2 x)]


> ehSeq = iterate (\x -> x + 1) 1

> powersOfHOF :: Integer -> [Integer]
> powersOfHOF x = iterate (\n -> n * x) 1

Computing the squareRoot(N) using Newton's method, which
computes a sequence of ever-improving approximations.

In Haskell, the sequence of approximations can be represented
by an infinite list.

The Haskell function, next,
computes an approximation form the preceding approximation. 


> next :: Double -> Double -> Double
> next n a = (a + n/a) /2

If the initial approximation is a0 the sequence of 
approximations is the list 
   ...> iterate (next n) a0 

The Haskell function, within, is a function that
treverses this list of approximations.  The parameter
eps determines the closeness of the approximation.  eps
is used to terminate the function, within.


> within ::  Double -> [Double] -> Double
> within eps (a:b:bs)
>     | abs(a-b) <= eps = b
>     | otherwise       = within eps (b:bs)


Now we can easily define sqrtx.  Because of 
lazy evaluation we traverse the list only as
a far as necessary.

> sqrtA ::   Double -> Double -> Double
> sqrtA eps n = within eps (iterate (next n) 1.0) 

    ...> sqrtA 0.001 81.0
    9.0
   (267 reductions, 423 cells)
   ...> sqrtA 0.01 0.000081
    0.0109967
   (260 reductions, 375 cells)


When trying to find the square root of small N 
using "abs (a-b) <= eps" results in large errors and
for large N may result in non-termination.


We use a more expensive test "relative" to work better with
a wide range of input. Since (/), which "relative" uses,
is more expensive than (-), which within uses.


> relative :: Double -> [Double] -> Double
> relative eps (a:b:bs)
>     | abs(a/b - 1.0) <= eps    = b
>     | otherwise               = relative eps (b:bs)

Replacing "within" our square root definition is:

> sqrtB ::   Double -> Double -> Double
> sqrtB eps n = relative eps (iterate (next n) 1.0)

    ...> sqrtB 0.001 81.0
    9.0
    (290 reductions, 420 cells)
    ...> sqrtB 0.01 0.000081
     0.009
    (405 reductions, 591 cells)

  



In addition, "within" and "relative" could be applied to
other approximation lists WITHOUT CHANGING THEM at All!!!

These examples are provided by Prof. Richards



