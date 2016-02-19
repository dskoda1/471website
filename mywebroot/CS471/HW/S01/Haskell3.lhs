YOUR NAME, EMAIL
Don't forget to rename file as defined in the instructions. You do not
have include above the "+++++" line in your hard copy.

Purpose:  Use of list comprehension notation for fast prototyping of solutions,
          to illustrate the usefulness of infinite lists and infinite
          data structure.

Notes:

Practice:  DO NOT turn in.
What does 
    ...> [h | h <- zip [1,25,6,1,2] "abcdefasdfer"] 
    ...> take 5 [1,5 ..]
    ...> take 10 (drop 10 [1 ..])
    ...> takeWhile (isUpper) "ASDFasdfASDF"
    ...> reverse "abdef"
    ...> reverse [1,2,3]
do?

From the Gentle Introduction to Haskell:
   (Recall that ":" associates to the right.) 
   Note that x:xs appears both as a pattern on the left-hand side, and an
   expression on the right-hand side. To improve readability, we might 
   prefer to write x:xs just once, which we can achieve using an 
   as-pattern as follows: (Another advantage to doing this is that a 
   naive implementation might completely reconstruct x:xs rather than 
   re-use the value being matched against.) 
   i.e.
   f s@(x:xs)             = x:s  

   (Can you figure out what f does above?)


++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
YOUR NAME, EMAIL

--------

Problem 1: (Only use list comprehension notation.)
(From Thompson 17.23)  Give a definition of the function

    factor :: Integer -> [Integer]

which returns a list containg the factors of a positive integer.  For instance

    factors 12 = [1,2,3,4,6,12]

> 

---------
Problem 2: (Use list comprehension notation in your solution)

Define the list of numbers whose only prime factors are 2,3, and 5 , the
so-called Hamming numbers:

hamming = [1,2,3,4,5,6,8,9,10,12,15,16,18 ...



---------
Problem 3:  (Use list comprehension notation in your solution)
Redo problem 3 from homework 10. (This can be done in two lines)

   ...> partition 4 [4,1,9,3,5]
    ([1,3],[9,5])
   ...> partition 4 [4,1,9,4,3,5]
    ([1,3],[9,5])


> partition :: Ord a=> a -> [a] -> ( [a], [a] )



----------
Problem 4.

Redo problem 7 from  homework 10. Use list comprehension 
notation as much as possible in your solution. (This is a one line wonder.)

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



---------
Problem 5.
Using a where clause and the ideas presented in computing the nth Fibonacci
number using infinite data structures 
(http://bingweb.binghamton.edu/~head/CS471/NOTES/HASKELL/4hSpr01.html#Fib) 
define 


> runningSum :: [Integer] -> [Integer]

which calculates a running sum, i.e.
[ a0, a0 + a1, a0 + a1+ a2, ...

of a list
     [a0, a1, a2, ...
i.e.
     ....> runningSum [1,3,5,6,2]
     [1,4,9,15,17]
     (43 reductions, 99 cells)




---------
Problem 6:
runningFun is a function that generalizes runningSum to calculate a running 
accumulation of a function "f" applied to values of a list of Integers. 


What is the type of 

 > runningFun :: ?

> runningFun :: (Integer -> Integer -> Integer) -> [Integer] -> [Integer]

which calculates a running "f" 
[ a0, f a0 a1, f (f a0 a1) a2, ...

of a list
[a0, a1, a2, ...

For example:
    ... > runningFun (+) [1,2,3,4,5,6,7,8]
    [1,3,6,10,15,21,28,36]
    ... > runningFun (*) [1,2,3,4,5,6,7,8]
    [1,2,6,24,120,720,5040,40320]
    ... > take 20 (runningFun (+) [0,5 ..] )
    [0,5,15,30,50,75,105,140,180,225,275,330,390,455,525,600,680,765,855,950]
    ... > runningFun (\x y -> 2*x ) [1,2,3,4,5,6,7,8,9]
    [1,2,4,8,16,32,64,128,256]





-------
Problem 7:
Define a function repeatN, only using list comprehension notation that takes an
(Num a, Enum a) and returns a list with numbers 1 to n 
where 1 occurs once, 2 occurs twice .... and n occurs n times. 
(This is a one line wonder) i.e.

    ...> rep 0
    []
    (28 reductions, 46 cells)
    ...> rep 3
    [1,2,2,3,3,3]
    (265 reductions, 455 cells)
    ...> rep 6
    [1,2,2,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,6,6,6]
    (691 reductions, 1178 cells)


> rep :: (Num a, Enum a) => a -> [a]




------
Problem 8:
Write a define, calcPoly which takes a list of coefs, [a0,a1 ... an] and a
value x and calculates a0 + a1 x + a2 x^2 + ... + an x^n.  Use only 
list comprehension notation and function application in your solution.  
This is a one line wonder.

> calcPoly coef x = 



------
Problem 9:

Define a function that converts a strings of ones and zeros to its
value in decimal representation.  You may use anonymous functions, reverse, 
list comprehension notation and calcPoly in your solution.  (This is a
one line wonder.)  
    ...> strToDecimal "1011"
    11
    (298 reductions, 496 cells)
    ...> strToDecimal "1101"
    13
    (298 reductions, 496 cells)





--------
Problem 10.

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


I have done 2 different solutions e2X and a more efficient version eToX.  
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


