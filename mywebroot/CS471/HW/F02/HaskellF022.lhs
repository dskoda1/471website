Modified Fri 4:15pm

You do not have include above the "+++++" line in your hard copy.
DONT forget to put you name after the "++++++" below

Purpose:  Introduce Haskell by programming simple recursive functions 
          and to experience the literal style of programming. 
          Using different number types in haskell.


Note: In the homework file put only one space between ">" and the code.  
Do not use a tab...  JUST one SPACE.

 A) Looking in around ...  experiments. Not to be handed in!
     (After opening hugs you will get a prompt 
      Prelude><your type here if you clicked on .lhs file> )
      a) What does ...> :? <return> do?
      b) What does :t isAscii <return> do?
             A :t head <return> ??
             B :t (:) <return> ??
  B) Continue to examine, via your text editor, 
     the Prelude.hs file that comes with your hugs. 
     What is the purpose of the file? 
     What is the most interesting function you find?  
     Do not turn in ... be prepared to discuss in class.  
     (Prelude.hs is in the lib directory.  Use a text editor to view.
      OR you can view http://haskell.org/onlinereport/prelude-index.html)
  C) Try on the command line 
   (You do not need to understand why everything works below.)
                 
      ...> [1 .. 12]
      ...> ['a' .. 'z']
      ...> [ (x,y) | x <-[1..5], y <- [2,4 .. 10]]
      ...> [ 1 ..]
      ...> :t ['a','b']
      ...> :t "abc" ++ "abc"
   d) Practice:  DO NOT turn in.
      What does lF do? (See Below)

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

YOUR NAME, EMAIL

> module HaskellF022
>     where

 
> lF :: [a] -> Float
> lF = (\x -> encodeFloat ((toInteger . length) x) 0)



Note: 
I have put in the ">" where your code should be place.  Sometimes
I have indicated the first line of the code for you to complete
       > function arg = ?
  or 
       > function arg

I have also indicated if you should put the type by including a line
      > function :: ?
You should try to figure out the most general type that will work.

Because of these "?"  you will get errors when you load this file into 
hugs.


Problem 1: Give a list of pairs use calcpair (done in previous assignment)return a list 
           of the values computed: (very easy)
i.e.

  HaskellF022> calcPairLst [(1,2), (40,30), (9,10)]
  [9, 160, 49]

     
Code to follow this line.  Remember you must begin the code with ">"


> calcPairLst :: [Int] -> [Int]
> calcPairLst (h:t) = [h] ++ calcPair t


Problem 2: (Easy) Write a script that takes two lists and makes a lists of pairs.
i.e.
   HaskellF022> mkpairs [1,2,3] "abcd"
   [(1,'a'),(2,'b'),(3,'c')]
   HaskellF022> mkpairs [1,2,3,4,5] "abcd"
   [(1,'a'),(2,'b'),(3,'c'),(4,'d')]
   HaskellF022> mkpairs [1,2,3,4,5] "abc"
   [(1,'a'),(2,'b'),(3,'c')]


> mkpairs :: ?   
> mkpairs 




Problem 3: (Easy) Write a script unCur that takes a function and a pair and returns the value: 
i.e.  
  HaskellF022> unCur (+) (1,2)
  3
  HaskellF022> unCur mod (4,5)
  4

> unCur :: ?
> unCur f (x,y) = ?



Problem 4: 
   Write a Haskell definition,whose output will be
   a tuple (sum,prod) where sum is the sum of all the elements in the list
   and prod is the product of all the elements in the list. Do this using 
   primitive recursion.  What is the most general type? 
i.e:
   HaskellF022> sumProduct[1,2,3,4,5]
   (15,120)
   HaskellF022> sumProduct[1.5,2.5,3.5,(-2)]
   (5.5,-26.25)



> sumProduct :: ?
> sumProduct (n:ns) = ? 
     




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
(WHAT IS THE TYPE OF maxOf3Ints ?)

> maxOf34and2Ints = maxOf3Ints 34

      A) Define maxOf309and2Ints which is the max of two numbers and 309  
      (use maxOf3Ints).  (Place code BELOW --remember ">")
      CODE:
    
> maxOf309and2Ints :: ??
> maxOf309and2Ints 


      B) Define maxOf309_32and1Int which is the max of one numbers 
         and 309 and 32
      (use maxOf309and2Ints).  (Place code BELOW --remember ">") Dont forget the type.
      CODE:

> max309_32and1Int :: ? 
> max309_32and1Int ?

      C) Define numberSixteenHundredOne 
         which is the max  309 32  and  1601  
      (use maxOf309_32and1Int). Dont forget to figure out type
      (Place code BELOW --remember ">")
      CODE:

> numberSixteenHundredOn :: ? 
> numberSixteenHundredOn ?

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
>


   b. Using guards 

   Code:
 
> impliesG :: Bool -> Bool -> Bool




    c. Using a single Boolean expression 
       Boolean operators are:  not, &&, ||

    Code:

> impliesE :: Bool -> Bool -> Bool 
>



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
> h = ?



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
4

> funnyFun :: ?   
> funnyFun fun v ?



