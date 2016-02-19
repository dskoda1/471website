YOUR NAME, EMAIL
Don't forget to rename file as defined in the instructions for 
submitting code.

Purpose:  To practice the abstraction using Higher order function.
          To build new types in Haskell.
      

Programming assignment 4.

1. Write a nonrecursive definition of "length".  
   (Use HOF, fold and or map --do not use sum)
    You may use my function "one" defined below and the compose function, ".".

   ...> lengthHOF "This is a list"
   14
   (96 reductions, 167 cells) 

> lengthHOF  = STUB
> one = (\x -> 1)

CODE HERE:


2. convertToDigit takes a string of digits and returns a list of Integers.
   Define it using HOF(fold and/or map) and any other needed functions.
   (One line wonder)

   ...> convertToDigit "01239875" 
   [0,1,2,3,9,8,7,5]
   (109 reductions, 236 cells)  
  
> 
> convertToDigit :: Enum a => [a] -> [Integer]
> convertToDigit = STUB
 


3. sumOfSqOfOddNo, computes the sum of the squares of odd numbers.
    This can be defined using only hof map, foldr1, filter, 
    anonymous functions and . (compose) (One line wonder)  
 
    ...> sumOfSqOfOddNo [1,2,3,4,56,5]
    35
    (79 reductions, 92 cells) 

> sumOfSqOfOddNo = STUB




4. prodPairHOF takes the product of each pair of numbers in a list.
   Write a nonrecursive definition.
   This can be done with only HOF, anonymous functions, fst and snd.
   (One line wonder.)
   ...>  prodPairHOF [(1,2),(4,5),(7,0)]
   [2,20,0]
   (46 reductions, 68 cells)

> prodPairHOF = STUB



5. Redo problem 4 using list comprehension. (One line wonder)
   ...> prodPairLC [(1,2),(4,5),(7,0)]
   [2,20,0]
   (36 reductions, 61 cells) 


> prodPairLC ls = STUB


6. Build a new type 
        Complex a b
   that is an element of Num Class.  
   We use "deriving Show, EQ, Read" to
      a) make Complex type be a member of EQ, Show and Read
      b) to automatically implement the required functions like
               show    ==   /=

If complex numbers can represented as the set of all ordered pairs (a,b) 
of real numbers then
   1) Addition and multiplication defined by:
      (a,b) + (c,d) = (a+c, b+d)
      (a,b) * (c,d) = (ac - bd, ad + bc)

   2) A real number a is represented by (a,0).

   3) The absolute value can defined by:
      abs(a,b) = (sqrt(a^2 + b^2),0)   
   4) magnitude (a,b) = sqrt(a^2 + b^2)

    We will define signum(a,b)  to be the  
      (a/magnitude(a,b),b/magitude(a,b))
    
    We will define negate (a,b) to be (negate a, negate b)
   
    Use common sense to define fromInteger, fromInt.
For Example:

    ...> (Complex 3.2 4.1) + (Complex (-4.2) 0.9)
    Complex_Complex (-1.0) 5.0
    (44 reductions, 150 cells)
    ...> (Complex 3.2 4.1) - (Complex (-4.2) 0.9)
    Complex_Complex 7.4 3.2
    (38 reductions, 72 cells)
    ...> (Complex 3.2 4.1) * (Complex (-4.2) 0.9)
    Complex_Complex (-17.13) (-14.34)
    (58 reductions, 110 cells)
    ...> negate (Complex (-4.2) 0.9)
    Complex_Complex 4.2 (-0.9)
    (30 reductions, 73 cells)
    ...> signum (Complex (-4.2) 0.9)
    Complex_Complex (-0.977803) 0.209529
    (191 reductions, 468 cells)
    ...> signum (Complex (4.2) 0.9)
    Complex_Complex 0.977803 0.209529
    (183 reductions, 338 cells)
    ...> signum (Complex 0 0.9)
    Complex_Complex 0.0 1.0
    (184 reductions, 329 cells)
    ...> signum (Complex 0 0)
    Complex_Complex 0.0 0.0
    (187 reductions, 340 cells)   

To help you get started the data type definition is given.
Also,  the beginning of the clause to make, 
 Complex data type
an instance of Num. 

> data (RealFloat a)=> Complex a =  Complex a a 
>		        deriving (Eq,Read,Show)

> instance (RealFloat a) => Num (Complex a)  where
> STUB.... put the function definitions here








