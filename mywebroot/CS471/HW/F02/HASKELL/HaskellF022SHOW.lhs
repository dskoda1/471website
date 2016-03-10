YOUR NAME, EMAIL

> module HaskellF022
>     where

 
> lF :: [a] -> Float
> lF = (\x -> encodeFloat ((toInteger . length) x) 0)



Problem 1: Give a list of pairs use calcpair (done in previous assignment)return a list 
           of the values computed: (very easy)
i.e.

  HaskellF022> calcPairLst [(1,2), (40,30), (9,10)]
  [9, 160, 49]

     
Code to follow this line.  Remember you must begin the code with ">"


> calcPair (x,y) = x + 4 * y

  > calcPairLst::??

> calcPairLst (h:t) = calcPair h : calcPairLst t
> calcPairLst [] = []




Problem 2: (Easy) Write a script that takes two lists and makes a lists of pairs.
i.e.
   HaskellF022> mkpairs [1,2,3] "abcd"
   [(1,'a'),(2,'b'),(3,'c')]
   HaskellF022> mkpairs [1,2,3,4,5] "abcd"
   [(1,'a'),(2,'b'),(3,'c'),(4,'d')]
   HaskellF022> mkpairs [1,2,3,4,5] "abc"
   [(1,'a'),(2,'b'),(3,'c')]



> mkpairs [] _ = []
> mkpairs _ [] = []
> mkpairs (h:t) (h2:t2) = (h,h2) : mkpairs t t2

Problem 3: (Easy) Write a script unCur that takes a function and a pair and returns the value: 
i.e.  
  HaskellF022> unCur (+) (1,2)
  3
  HaskellF022> unCur mod (4,5)
  4


> unCur f (a,b) = f a b



Problem 4: 
   Given a list of Integral, write a Haskell definition,whose output will be
   a tuple (sum,prod) where sum is the sum of all the elements in the list
   and prod is the product of all the elements in the list. Do this using 
   primitive recursion.
i.e:
   HaskellF022> sumProduct[1,2,3,4,5]
   (15,120)
   HaskellF022> sumProduct[1.5,2.5,3.5,(-2)]
   (5.5,-26.25)



    > sumProduct :: ?

> sumProduct (n:ns) = (n+ (fst . sumProduct) ns, n* (snd . sumProduct) ns)
> sumProduct [] = (0,1)     




Problem 5: (Easy)
The following function finds the maximum of three integers:

> maxOf3Ints :: Int -> Int -> Int -> Int
> maxOf3Ints x y z
>     | x >= y && x >= z = x
>     | y >= z           = y
>     | otherwise        = z 

Derive using previously defined functions (for this problem), 
the following functions. Include as a comment the inferred type 
of the new function. 
You find out the type by the command  ":t".
    For example:
    Define maxOf which is the max of two numbers and 34  
    (use maxOf3Ints). NOTE there are no arguments.

> maxOf34and2Ints = maxOf3Ints 34

      A) Define maxOf83and2Ints which is the max of two numbers and 83  
      (use maxOf3Ints).  (Place code BELOW --remember ">")
      CODE:
    
> maxOf83and2Ints  = maxOf3Ints 83


      B) Define maxOf83_32 and1Int which is the max of one numbers 
         and 83 and 32
      (use maxOf81and2Ints).  (Place code BELOW --remember ">")
      CODE:

> maxOf83_32 =  maxOf83and2Ints 32

      C) Define numberSixteenHundredOne 
         which is the max 83 32 and  1601  
      (use maxOf81_32and1Int).  (Place code BELOW --remember ">")
      CODE:

> numberSixteenHundredOne = maxOf83_32 1600

Problem 6: (Easy)       
   The function "implies"  takes tow Boolean arguments and returns a
   Boolean Result.  
   Its truth table is:
      x       y         implies x y
      True    True         True
      True    False        False
      False   True         True
      False   False        True



 Define implies three ways:
   a. Using conditional expression (if..then...else)
Code:
 
> impliesC :: Bool -> Bool -> Bool
> impliesC x y = if x then y else True



   b. Using guards 
  
Code:
 
> impliesG :: Bool -> Bool -> Bool
> impliesG x y
>     | x       = y
>     | otherwise = True




    c. Using a single Boolean expression 
       Boolean operators are:  not, &&, ||

Code:
 
> impliesE :: Bool -> Bool -> Bool
> impliesE x y = not x || y



Problem 7: (Easy)

Using the functions f ang g below define a function h that computes
(2x +3)^2 -5. Use function composition. (Notice h has no arguments.)
Also define a function h2 that computes 2(x^2 -5) +3.
 i.e.
   HaskellF022> h 1
   20
   HaskellF022> h 0
   4
   HaskellF022> h2 0
   -7
   HaskellF022> h2 1
   -5


  > f :: ?

> f x = x ^2 - 5

   > g :: ?

> g x = 2*x + 3

   > h :: ?

> h = f . g

> h2 = g . f



Problem 8:


Define a function funnyFun that takes a function, fun  and a value. 
fun :: Integral a => a->a 
and value :: Integral a
If the value is even then apply fun to ( value plus 1)
 otherwise apply fun to the value/2.
You may use any functions defined in Prelude.

i.e.

> inc x = x + 1


  HaskellF022> funnyFun (\x -> x + 105) 4
  110
  HaskellF022> funnyFun (\x -> x + 105) 3
  106
  HaskellF022> funnyFun (\x -> 3*x + 55) 3
  58
  HaskellF022> funnyFun (\v -> 2*v^2 + 5*v+ 1) 2
  34

  HaskellF022> funnyFun inc 2
  3

  > funnyFun :: ? 

> funnyFun fun v 
>   | even v = v + 1
>   | otherwise = fun v



