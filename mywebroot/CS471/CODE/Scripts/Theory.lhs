Changed Dec 14, 2006

Code to accompany CS471/CS571 notes,  2000-2006
There are additional examples besides the ones in the notes.

> module Theory where


Theory
Below is code that relates to the lecture on Lambda Calculus
---------------------------------------------------------------


Y f = f( Y f) -- Fix point operator 

Because Haskell is typed, the Y combinator can not be defined because
it has an infinite data type.  Notice the Y combinator is NOT recursive.
 Y = (\ h. (\ x. h (x x)) (\ x'. h (x' x')))
  
However we can define the recursive "fix" which
isolates the recursion to the function "fix".

> fix :: (a -> a) -> a
> fix f = f (fix f)


Recursive definition of Factorial


> factorial :: Int->Int
> factorial n 
>   = if (n == 0) then 1 else n * factorial(n-1)
> 

This higher order function can be apply to any function with the
right type.


> hFactStepFunction :: (Int->Int)->Int->Int
> hFactStepFunction f n = if n==0 then 1 else n * f (n-1)



> hFactStep :: (Int->Int)->Int->Int
> hFactStep = \f n -> if n==0 then 1 else n * f (n-1)


The following 
      factorial 5
      hFactStep factorial 5
      fix hFactStep 5

all calculate the same result




What does hFactStep fib 5 evaluate to?  
Can you design the hFibStep?


> fib n = if (n > 2) then  fib(n-1)+fib(n-2) else 1



Here is an example with data structures:

> zeroes = 0 : zeroes

and

> zeroStep lst = 0 : lst
> zeroes' = fix zeroStep


zeroes is a circular list with one element, while zeroes' is an
infinite list with all zero elements.
It may not be easy to tell the difference from inside a Haskell program, 
but the sound of the disk thrashing will sometimes 
alert the programmer to it.

This example is based on an email to the Haskell news group by 
Lars Mathiesen (U of Copenhagen CS Dep) <thorinn@diku.dk> 

