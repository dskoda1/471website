> module LabH8F12
>    where

problem 1&2:
Below is the code for the first 2 written questions.

> power :: Integer -> Integer -> Integer
> power a 0 = 1
> power a b = a * power a (b-1)

> powerT :: Integer -> Integer -> Integer
> powerT a b = trp b 1
>      where
>      trp n p = if (n==0) then p else trp (n-1) (a*p)

> turboPower a 0 = 1
> turboPower a b
>     | even b = turboPower (a*a) (b `div` 2)
>     | otherwise = a * turboPower a (b-1)

 

  2c:
  Convert the algorithm used in turboPower to tail recursive form. Call the
  definition turboTPower.  (Tricky)
  

Problem 3: Define sq, which creates a list of square values from a list of 
numbers.  Use list comprehension notations in your solution. (Very easy)



Problem 4:
Define a function replicate which given a list of numbers returns a 
list with each number duplicated its value.  Use only list comprehension
notation in your solution.  (Hint use two generators.) i.e.
  ..> replicated [5,1,3,2,8,1,2]
  [5,5,5,5,5,1,3,3,3,2,2,8,8,8,8,8,8,8,8,1,2,2]





Problem 5: (easy)
Write a Haskell script which implements Ackermann's function as defined in 
homework 1.  Name your script "ack".  
You may use guards, and/or pattern matching and/or if expressions in
your definition.  Predict the inferred type of ack.  Check you guess.
 
ack( m,n ) =	n + 1                           if m = 0
ack( m,n ) =	ack(m - 1, 1)                   if n = 0 and m > 0 
ack( m,n ) =	ack( m-1, ack( m, n-1 ) )      	if n >0 and m > 0



Problem 6: (Not too bad)
In http://bingweb.binghamton.edu/~head/CS471/HW/Haskell1F12.html problem 2 you wrote a function
to create the next thue value.

Using the circular list idea demostrated in fibSeq
  (http://bingweb.binghamton.edu/%7Ehead/CS471/NOTES/HASKELL/4hF02.html)
  Define thueSeq to be a sequence of thue elements.
  You should use list comprehension. May use the 'thue' definition.
e.g.
  
  LabH2F12> take 5 thueSeq
   [[0],[0,1],[0,1,1,0],[0,1,1,0,1,0,0,1],[0,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0]]
  (0.01 secs, 0 bytes)

  


Problem 7:  Not too bad
(Only use list comprehension notation )
(From Thompson 17.23)  Give a definition of the function

    factor :: Integral a => a -> [a]

which returns a list containg the factors of a positive integer.  For instance

    factors 12 = [1,2,3,4,6,12]



Problem 8:  easy
Point is a data type that represents a point in a plane and 
the coordinate type should be in class Eq.

> data Point a = Pt a a deriving (Show, Eq)

   > :t Pt 0 0
   Pt 0 0 :: Num a => Point a
   > :t Pt 'a' 'b'
   Pt 'a' 'b' :: Point Char


Now define a function "isOrigin" that returns true if the point is the origin 
and false otherwise.  
  > isOrigin :: (Eq a, Num a) => Point a -> Bool

    LabH2F12> isOrigin (Pt 0 0)
    True  
    LabH2F12> isOrigin (Pt 3.0 0.0)
    False     
 


  b) Redefine isOrigin (call it isOriginL) using lambda expression only.  


  
  

Problem 9: (Not too bad)
This exercise concerns the formula for computing the area of triangle
given 3 Points  (as in problem 8):
  
    length =  squareRoot ((x2 - x1)^2 + (y2 - y1)^2)
    area = squareRoot (s*(s-a)*(s-b)*(s-c))
           where a, b and c are the lengths of the sides of the triangle
           and s = (a+b+c)/2.0

Use the Prelude function sqrt.  Use local definition to make your code 
easy to read.   area :: Floating a => Point a -> Point a -> Point a -> a

  i.e.
    LabH2F12> area (Pt 0.0 0.0) (Pt 1.0 0.0) (Pt 0.0 1.0)
    0.49999999999999983
    LabH2F12> area (Pt 1.0 1.0) (Pt 1.0 0.0) (Pt 0.0 1.0)
    0.49999999999999983
    LabH2F12> area (Pt 1.0 1.0) (Pt 1.0 0.5) (Pt 0.5 1.0)
    0.12499999999999996
    LabH2F12>  area (Pt 1 1) (Pt 1 9) (Pt 0 4)
    4.000000000000002
    (0.00 secs, 1169680 bytes)







