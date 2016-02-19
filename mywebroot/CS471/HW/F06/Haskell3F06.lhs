> module Haskell3F06Sol
>    where
 
YOUR NAME, EMAIL
Don't forget to rename file as defined in the instructions for 
submitting code.

Purpose:  
          Purpose: to reenforce polymorphic types in Haskell, 
                   practice recursion, practice using all different 
                   types as parameters and return values,
                   coding using "let" and "where" clauses and 
                   coding using list comprehension notation and using
                   circular lists in definitions.
          
ractice and experimenting:
(Do not turn or print out the practice and experimenting section)

What do the following functions do?
  ...> drop 4 [1 .. 10]
  ...> take 4 [1 .. 10]
  ...> product [1..10]
  ...> dropWhile (>44) [100, 85 .. 1]
  ...> takeWhile (>44) [100, 85 .. 1]
  ...> splitAt 4 "abdcxyz"
  ...> sum[3..15]


That is the inferred type of:
  ...>:t ((-1)*)
  ...>:t ((+1)*)
  ...>:t uncurry
  ...>:t uncurry (*)
Suppose that the following defintions are made:
  > x, y :: Int
  > x = 5
  > y = 8
  > nss :: [[Int]]
  > nss = [[10,20],[4,0,3]]
  > ps :: [(Int,Bool)]
  > ps = [(103,True), (200,False), (401,False), (17, True), (22, True)]
  > qs :: [Int]
  > qs = [ y+1 | (y,z) <- ps, odd y, y < 300 ]
  > what :: [a] -> Int
  > what (x:xs) = 10
  > what (y:w:zs) = 20
  > what ws = 30
Give the values of the following expressions.
(A) [x..y]
(B) [2,5..12]
(C) qs
(D) fst("abc",y)
(E) (x == y, [x])
(F) []:nss
(G) [nss]
(H) what nss
(I) what [[]]

-----------------------------------
      

Programming assignment 3.

1) Write a Haskell script to calculate the n-th tetrahedral number. 
   http://milan.milanovic.org/math/english/tetrahedral/tetrahedral.html 

   To calculate the n-th tetrahedral number:
     add the previous tetrahedral number to the sum of the numbers, 1 to n.

   The first few tetrahedral numbers are:

        1, 4, 10, 20, 35, 56, 84, 120, 165, 220, 286, 364, 455, 560, 680 ...

    This solution should use primitive recursion. You may use a local
    definition for the sum of the numbers 1 to n.





problem 2. pairWiseProdLC takes the product of each pair of numbers in a list.
   Write a nonrecursive definition, using list comprehension notation.
   
     ...> pairWiseProdLC [(1,2),(4,5),(7,0)]
     [2,20,0]



Problem 3. Using the circular list idea demostrated in fibSeq
  (http://bingweb.binghamton.edu/%7Ehead/CS471/NOTES/HASKELL/4hF02.html)
   Define tetraseq which is a sequence of tetrahedral numbers.  YOU SHOULD
   NOTE USE PROBLEM in your solution.  This will be a one line wonder.
   ....> take 10 tetraseq
   [1,4,10,20,35,56,84,120,165,220]



Problem 4:  (Use list comprehension notation)
(From Thompson 17.23)  Give a definition of the function

    factor :: Integral -> [Integral]

which returns a list containg the factors of a positive integer.  For instance

    factors 12 = [1,2,3,4,6,12]


Problem 5:  Write a  Haskell program to find all the irreducible Pythagorean 
triples (i.e. those where the three numbers have highest common multiple 1).  
This will be a one line wonder using List Comprehension notation.




Problem 6)Write a function that takes a set (implemented as a list) and produces its power set -- the set of all its subsets. e.g.

        ...> powerset [1,2,3]
        [[],[3],[2],[2,3],[1],[1,3],[1,2],[1,2,3]]
        ...> powerset ['a','b','c']
        ["","c","b","bc","a","ac","ab","abc"]




Problem 7:  (Thompson 17.23 )
Define the list of numbers whose only prime factors are 2, 3, and 5 , the
so-called Hamming numbers:


   ...> take 15 hamming
   [1,2,3,4,5,6,8,9,10,12,15,16,18,20,24]
 
 You may consider using any combinition of the following techiques
       to express your solution  list comprehension notation, 
       and/or explicit recursion, and/or local definitions . 
       Draw a picture about merging "3" streams/pipes.
           


8) Build a new type 
        Complex a b
   
     Use "deriving Show, EQ, Read" in your definition of the data type Complex.
     This will make Complex a type the sets Show, EQ and Read.  
     "deriving" will also implement in the obvious way the required overloaded   
     functions.
     i.e. Your data type will be:
      > data (RealFloat a)=> Complex a =  Complex a a 
      >		        deriving (Eq,Read,Show)
   
     You will need to make the type Complex an instance of Num class.
    
   Remember:
   Complex numbers can represented as the set of 
        all ordered pairs (a,b) of real numbers. 

   1) Addition and multiplication is defined by:
      (a,b) + (c,d) = (a+c, b+d)
      (a,b) * (c,d) = (ac - bd, ad + bc)

   2) A real number a is represented by (a,0).

   3) The absolute value can defined by:
      abs(a,b) = (sqrt(a^2 + b^2),0)   
   4) magnitude (a,b) = sqrt(a^2 + b^2)

    We will define signum(a,b)  to be the  
      (a/magnitude(a,b),b/magitude(a,b))
    
    We will define negate (a,b) to be (negate a, negate b)
   
    Use common sense to define fromInteger.

Some sample results:
  ...> Complex 3 4 + fromInteger 100
  Complex 103.0 4.0
  ...> signum (Complex 3 4)
  Complex 0.6 0.8
  ...> elem(Complex 3 4) [Complex 5 6, Complex 0 (-5), Complex 3 4]
  True

ONLY IF I GET TO HOF on Thur
9) Redo problem 2 from the previous by using map applied to a 
   lambda expression.  Call the definition pairWiseProdHOF.  
   (Note you will not need to "name" the argument i.e. 
       pairWiseProdHOF = ???)

     ...> pairWiseProdHOF [(1,2),(4,5),(7,0)]
     [2,20,0]




    
