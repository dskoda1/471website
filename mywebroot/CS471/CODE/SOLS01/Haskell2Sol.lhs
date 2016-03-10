YOUR NAME, EMAIL
Don't forget to rename file as defined in the instructions. You do not
have include above the "+++++" line in your hard copy.

Purpose:  Re-enforce programming recursive functions,
          experience functions as first class citizens,           
          practice with lambda expressions and getting use to 
          numbers in Haskell.

          You do not need to use modules on this assignment.
Notes:
     Below you will see some sample output with reductions.  
     You can set Hugs to show your reductions by 

     ...>:set +s

     There are stubs for your code and type declarations in this file
     THEREFORE when you load this present file into HUGS.     

Practice:  DO NOT turn in.
What does lengthF do?

 
> lF :: [a] -> Float
> lF = (\x -> encodeFloat ((toInteger . length) x) 0)




1a) Write a definition for flop, which applies the last value 
     (which is a function) 
to the reverse of the first two values.
This is very EASY.  ONE LINE!!  

  ...> flop 10 7 (-)
  -3
  (14 reductions, 17 cells)
  ...> flop 7 10 (-)
  3
  (14 reductions, 16 cells)
  ...> flop "abc" "ZYX" (++)
  "ZYXabc"
  (18 reductions, 44 cells)
  ...> flop 3 "abcdef" (!!)
  'd'
  (78 reductions, 141 cells)

> flop :: a -> b -> (b -> a -> c) -> c
> flop x y z = z y x


1b) What is the type of flop?


Problem 2:
   Rewrite problem 1 using a lambda expression.

> flopL = (\x y z -> z y x)


2b) What is the type of flopL?

Problem 3
   "Partition" traverses a list once returning a pair of lists where the 
    first element of the pair contains a list of where all the values are 
    less than the first element of the original list the second element
    is a list where all the elements are greater.
   ...> partition [4,1,9,3,5]
    ([1,3],[9,5])
   ...> partition [4,1,9,4,3,5]
    ([1,3],[9,5])



> partition :: Ord a=> a -> [a] -> ( [a], [a] )
> partition _ []  = ([],[])
> partition p (l:ls) 
>       | l < p = ((l:less), more)
>       | otherwise = (less, (l:more))
>    where
>    (less,more) = partition p ls


> partition2 :: Ord a=> a -> [a] -> ( [a], [a] )
> partition2 x y = (eval (>) y, eval (<) y)
>     where
>        eval _ []          = []
>        eval a (b:c)
>           | a x b == True = (b:eval a c)
>           | otherwise     = eval a c



Problem 4:
  (See html for details)
  Horner's rule is an algorithm to evaluate a polynomial without 
  requiring the computation of arbitrary powers of x. 
  We can represent the coefficients of a polynomal 
     an x^n + an-1 x^(n-1) +...+ a0 using a 
     coef = [ a0, a1, .. an ].

Write a haskell script that will evaluate a polynomial

CODE HERE:

> horner [c] _ = c
> horner (c:ct) x = c + x * (horner ct x)




Problem 5:
    Write a Haskell script zipPair L1 L2, which returns a list of pairs.
    Haskell provides pattern matching and list operators so the lefthand 
    side of function will be
        zipPair (h:t) (n:ns)
    (h:t) h matches the head of the list and t matches the tail --
    like prolog.
    
    ...> zipPair [1,2,3] ['a','b','c','d']
    [(1,'a'), (2,'b'), (3,'c')]
    CODE:


> zipPair [] _ = []
> zipPair _ [] = []
> zipPair (h:t) (n:ns) = (h,n) : zipPair t ns


    What is the signature of zipPair?



Problem 6:
   Using the the data type Pair provided below,  
   write a Haskell script zipPairtype lst1 lst2, which 
   returns a list of Pairs.

    ....> zipPairType [1,2,3] "abcde"
    [Pair 1 'a',Pair 2 'b',Pair 3 'c']
    (185 reductions, 360 cells)


> data Pair a b = Pair a b   deriving Show


> zipPairType [] _ = []
> zipPairType _ [] = []
> zipPairType (h:t) (n:ns) = (Pair h n) : zipPairType t ns

6b)  What is the signature of zipPairType?



Problem 7: Define a function occurence so that 
                occurrence xs
           returns a list containing one copy of each element of xs paired
           with the number of times it occurs.  
              ...> occurences [5,2,3,2,4,3,2,5]
               [(5,2), (2,3), (3,2), (4,1)]
           Don't restrict yourself to a single function definition.  Consider
           using nested definitions to break the task into simpler subtasks.  You
           should define occurrence to work for only lists of Ints.  

> occurrence :: [Int] -> [(Int,Int)]
> occurrence [] = []
> occurrence (e:et) = (e,num) : occurrence next
>     where
>     (num, next) = count e et
>     count e [] = (1, [])
>     count e (h:t) 
>	    | e == h  = (n+1, rest)
>           | otherwise = (n, h:rest)
>        where
>        (n,rest) = count e t

Another Solution ... Also made a more general type

> occurrence2 :: EQ t => [t] -> [(t,Int)]
> occurrence2 list =  countOccs 1 (sort list)
>     where
>     countOccs _ [] = []
>     countOccs n [a] = [(a,n)]
>     countOccs n (a:b:bs)
>          | a == b        = countOccs (n+1) (b:bs)
>          | otherwise     = (a,n):countOccs 1 (b:bs)

  
> occurrence3 [] = []
> occurrence3 (h:t) = ((h,(number t)):occurrence3 (rest t))
>      where
>         number []         = 1
>         number (a:b)
>            | a == h       = 1 + number b
>            | otherwise    = number b
>         rest []           = []
>         rest (a:b)
>            | a == h       = rest b
>            | otherwise    = (a:rest b)

    


Problem 8:
   Write a script that returns the average of a list of Integral.
    ....> averageOfList [4,3,2,1]
    5.0

CODE::  



> averageOfList [n] = encodeFloat n 0 
> averageOfList list = 
>     (encodeFloat (sum list) 0 ) / (lF list) 



Problem 9:
   Write a script that returns the running average of a list of numbers (nums)

   ...> runningAver [4,3,2,1]
   [2.5, 2, 1.5, 1.0]
   
   
CODE:  
 
> runningAver [n] = [ encodeFloat n 0]
> runningAver list = (averageOfList list) : (runningAver ( tail list)) 



Problem 10:
   If "funL" is a list of elements of the type a->b->c and argList is a list 
   of elements of type a, write a recursive program, "applyFun" that returns 
   a list with  elements of the type b->c.  You may assume that both lists are
   the same length.
   
  {To "see" partically evaluated functions i.e.
     ...> (+) 1
     ERROR: Cannot find "show" function for:
     *** Expression : (3 +)
     *** Of type    : Integer -> Integer

     YOU CAN change the Hugs settings by
      ...> :set -u
     so when you type it in you will not get an error. i.e.
     ...> (+) 3
     primPlusInteger (Num_fromInt instNum_v35 3)
   
     }
   
    ...> applyFun [(+), (-), (+)] , [1, 100, 5]
    [(1 +), (100 -), (5 +)]

> applyFun :: [a->b->c] -> [a] -> [b->c]
> applyFun [] [] = []
> applyFun (f:ft) (a:at) = f a :(applyFun ft at)




   










