> module Haskell3S06
>     where

Purpose: to reenforce polymorphic types in Haskell, practice recursion,
         practice using all different types as parameters and return values,
         coding using "let" and "where" clauses and coding using
         list comprehension notation.

Practice and experimenting:
(Do not turn or print out the practice and experimenting section)

What do the following functions do?
  ...> drop 4 [1 .. 10]
  ...> take 4 [1 .. 10]
  ...> product [1..10]
  ...> dropWhile (>44) [100, 85 .. 1]
  ...> takeWhile (>44) [100, 85 .. 1]
  ...> splitAt 4 "abdcxyz"


That is the inferred type of:
  ...>:t ((-1)*)
  ...>:t ((+1)*)
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

For problems 1-3 use the definitions for ExpTree datatype 
and printExpTree function  given below:

> data ExpTree a = BinaryNode String (a -> a -> a) (ExpTree a) (ExpTree a)
>                        | Val a 
>                        | UnaryNode String (a -> a) (ExpTree a)
>                         


Note: The purpose of the "String" variable in BinaryNode and UnaryNode is
to provide a way to print out the name when we want to display the expression tree.
(printExpTree: a modification of Wirth's pascal code by Prof. Lander)


> printExpTree :: (Show a) => ExpTree a -> IO ()
> printExpTree t = putStr (printTreeAux "" t 0)
>      where
>         printTreeAux str (Val x) n = (spaces (n+1))  
>                                      ++ (if str=="" then "" else str ++ " ") 
>                                      ++ show x ++ "\n"
>
>         printTreeAux str (UnaryNode s f t) n = 
>                    printTreeAux ((if str=="" then "" else str ++ " ")++s) t (n)
>
>         printTreeAux str (BinaryNode s f lft rt) n = 
>                    (printTreeAux "" rt (n+1+length(s))) ++
>                    (spaces n) ++ (if str=="" then "" else str ++ " ") 
>                               ++ s ++ "\n" 
>                               ++ (printTreeAux "" lft (n+1+length(s)))
>         spaces 0 = ""
>         spaces n 
>                  | even n =  "  " ++ spaces (n-1)
>                  | otherwise = " " ++ spaces (n-1)

Here are some sample test trees.

> exptree1 = (UnaryNode "(1+)" (1+)
>                 (BinaryNode "(+)" (+)
>                      (Val 12)
>                      (UnaryNode "neg" ((-1)*)
>                           (UnaryNode "(*2)" (*2)
>                               (Val 7)
>                 ))))
> exptree2 = (BinaryNode "(+)" (+)
>                    (UnaryNode "(*3)" (*3)
>                               (Val 10))
>                    (Val 100) 
>              )             

> exptree3 =  (BinaryNode "(*)" (*)
>                (Val 10)
>                (BinaryNode "(+)" (+)
>                 (Val 10) 
>                 (BinaryNode "(+)" (+)
>                      (Val 12)
>                      (UnaryNode "neg" ((-1)*)
>                           (UnaryNode "(*2)" (*2)
>                               (Val 7)
>                 )))))

1) Define evalTree with type:
 
 evalTree :: ExpTree a -> a

to evaluate an ExpTree.

e.g. 
    Haskell3S06> evalTree exptree1
    -1
    Haskell3S06> evalTree exptree3
    80


2) Define a function applyFn with type:
  
    applyFn :: [Char] -> (a -> a) -> ExpTree a -> ExpTree a


which creates an ExpTree where all the function (BinaryNode and UnaryNode)
are a composition of the corresponding (input) ExpTree function and 
the function parameter. The Val values are  the original values (Val) from 
the input ExpTree.  
You will also have to update the string associated with the functions.
e.g.
   ...> printExpTree(applyFn "double" (2*) exptree2)
                  100
    (+).double
                  (*3).double 10

  ...> evalTree(applyFn "double" (2*) exptree2)
  220
  ...> evalTree(applyFn "double" (2*) exptree3)
  -240

  ...> printExpTree(applyFn "(\\x-> x*2+1)" (\x-> x*2+1) exptree2)

                                 100
      (+).(\x-> x*2+1)
                                 (*3).(\x-> x*2+1) 10

  ...> evalTree(applyFn "(\\x-> x*2+1)" (\x-> x*2+1) exptree2)

  227

  ...> printExpTree(applyFn "(max 20)" (max 20) exptree2)

                       100
   (+).(max 20)
                       (*3).(max 20) 10

  ...> evalTree(applyFn "(max 20)" (max 20) exptree2)

  160




3) Define a primitive recursive function nodeCount with the type:
   nodeCount :: (Num a, Num b, Num c) => ExpTree d -> (c,b,a)
   nodeCount returns a triple (b,u,v) where  b is the total number of 
       BinaryNode nodes, u is the total number of UnaryNode nodes and 
       v is the total number of Val nodes in the expTree.
  e.g.

    Haskell3S06> nodeCount exptree3
    (3,2,4)
    Haskell3S06> nodeCount exptree1
    (1,3,2)
    Haskell3S06> nodeCount exptree2
    (1,1,2)
Use the "where" clauses in your solution.




4) Define a primitive recursive function nodeCount2 
   which works the same as nodeCount in
   problem 3 except use "let" clauses in your solutions.  
   (See http://bingweb.binghamton.edu/~head/CS471/HW/Letbinding.html)





5) Redefine member function using List Comprehension as much as possible. 
   Use the name memberLC.
i.e. 
   Haskell3S06> memberLC 'a' "xyz"
   False
   Haskell3S06> memberLC 'a' "xyzabc"
   True






Problem 6:  (List comprehension)

(Only use list comprehension notation.)
(From Thompson 17.23)  Give a definition of the function

    factor :: Integral -> [Integral]

which returns a list containing the factors of a positive integer.  For instance

    factors 12 = [1,2,3,4,6,12]



Problem 7. Redo problem 7 from Prolog homework 2.

Define sumRtoL nums, that given a non empty list of Nums, nums,  
the result is a list of the sum of the numbers in nums,  such that 
first value in the output is the sum of  all the number nums, the 
second value in the output is the sum of all the numbers 
in nums except the first value in nums, etc.  Use primitive recursion and
you may use the built-in function sum.
e.g.
  Haskell3S06> sumRtoL [100, 5, 10, 2, 1000]
  [1117,1017,1012,1002,1000]




Problem 8: Redo problems from Prolog homework 2.

Define sumLtoR nums. which is similar to sumRtoL, except the sums are
accumulate left to right. 
You may assume the input contains at least one value.  e.g.
  
  Haskell3S06> sumLtoR [100, 5, 10, 2, 1000]
  [100,105,115,117,1117]







