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

  C) Pattern matching in Haskell
     (a:b:t)  
      a matches the first element, b matches the second element and t is the tail of the list.

  D) You will need to write at most two lines of code to finish each function.

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

YOUR NAME, EMAIL

> module HaskellS032
>     where

 

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


Problem 1: (Very easy)
 Below is a recursive definition for calculating nth term of a 
 sequence of numbers: 
          a(n) = 1                            if n = 0 
          a(n) = 2                            if n = 1 
          a(n) = a(n-1) * a(n-2)       if n > 2
 Finish the below Haskell definition to compute nth term in the sequence. 
 Complete the below Code:

> a :: Integer -> Integer
> a 0 = 1
> a 1 = 2
> a n = a (n-1) * a (n-2)  ---answer



Problem 2: (very easy)
( Some terms:
    A function exhibits 'parmettric polymorphism' if it has a type that contains
      one or more type variables.
    A type with a type variables like 
        Ea a => a -> a -> Bool
      is called a 'polytype'.
  Reference: Modern Progamming Languages by Adam Webber
)
 Write a Haskell (curry) function definition for each of the following functions.
 Try to predict polytype Haskell infer for each function.  Then check your prediction 
 using the ":t" command.  You need only turn in your code.

   a) fa(x) = 1
   b) fb(x,y) = 1
   c) fc(x) = x
   d) fd(g) = g(1)
   e) fe(g, x) = g(x)
   f) ff(g,x,y) = g(x,y)
   g) fg(g,h,x)= g(h(x))
   i) fi(g,x) = g( g(x)) BECAREFUL 


> fa x = 1
> fb x y = 1
> fc x = x
> fd g = g 1
> fe g x = g x
> ff g x y = g x y
> fg g h x = g h x
> fg2 g h x = g (h x)
> fg3 g h = g . h
> fi g x = g (g x)
> fi2 g = g . g


Some Experiments:
 ----fc x = x ----
 
 HaskellS032> :t fc
 fc :: a -> a

 HaskellS032> :t fc 3
 fc 3 :: Num a => a
 HaskellS032> fc 3
 3
 HaskellS032> :t fc (+)
 fc (+) :: Num a => a -> a -> a
 
 HaskellS032> fc (+)
 primPlusInteger
 
 HaskellS032> :t fc map
 fc map :: (a -> b) -> [a] -> [b]
 
 HaskellS032> fc map
 map

------> fe g x = g x ----

 HaskellS032> fe (*3) 4
 12

----- ff g x y = g x y ---

 HaskellS032> ff (+) 3 4
 7

-------- > fg g h x = g h x
---------> fg2 g h x = g (h x)
---------> fg3 g h = g . h
--- THE TYPES NOTE fg is not the same thing as fg2 and fg3
 
 HaskellS032> :t fg
 fg :: (a -> b -> c) -> a -> b -> c
 HaskellS032> :t fg2
 fg2 :: (a -> b) -> (c -> a) -> c -> b
 HaskellS032> :t fg3
 fg3 :: (a -> b) -> (c -> a) -> c -> b

  Although the types look different it looks like they all behave the same!
  HaskellS032> fg (\x -> x 3) (+) 5
  8
  HaskellS032> fg2 (\x -> x 3) (+) 5
  8
  HaskellS032> fg3 (\x -> x 3) (+) 5
  8

BUT 

  HaskellS032> fg (\x -> x 3) (-) 5
  -2
  HaskellS032> fg2 (\x -> x 3) (-) 5
  2
  HaskellS032> fg3 (\x -> x 3) (-) 5
  2

  HaskellS032> fg2  (*2) (\ c  -> if c=='a' then 1 else 3 ) 'a'
  2
  HaskellS032> fg3  (*2) (\ c  -> if c=='a' then 1 else 3 ) 'a'
  2
  HaskellS032> fg2  (*2) (\ c  -> if c=='a' then 1 else 3 ) 'x'
  6
  HaskellS032> fg3  (*2) (\ c  -> if c=='a' then 1 else 3 ) 'x'
  6

--------> fi g x = g (g x)
--------> fi2 g = g . g

   HaskellS032> :t fi
   fi :: (a -> a) -> a -> a
   HaskellS032> :t fi2
   fi2 :: (a -> a) -> a -> a

  HaskellS032> fi (7 +) 10
  24
  HaskellS032> fi2 (7 +) 10
  24




Problem 3
Write a Haskell function that takes a lists of tuples returns a list of the sum of the tuples.
We will assume the input includes at least one tuple.

HaskellS032> sumtuple [(1.3,0.7), (4.5, -1.5)]
[2.0,3.0]
HaskellS032> sumtuple [(1,99),(-3,5)]
[100,2]

> sumtuple [(x,y)] = [x+y]
> sumtuple ((x,y):t) = x+y : sumtuple t

> sumtuple2 ((x,y):t) = x+y : sumtuple2 t
> sumtuple2 [] = []


Problem 4
Write a polytype Haskell function that given a list of Type Ord and returns either 
      True if the list is in increasing 
or
     False if the list is Not.

HaskellS032> isIncreasing [False,True]
True
HaskellS032> isIncreasing [2.3,4.5,9.999]
True
HaskellS032> isIncreasing "aeiouxyz"
True
HaskellS032> isIncreasing [1,2,3,6,9]
True
HaskellS032> isIncreasing "aAbB"
False


> isIncreasing (h:h2:t) = (h < h2) && isIncreasing(h2:t)
> isIncreasing [h] = True
 
Not needed.  Problems since [] is a polytype and we need a constaint of type in EQ. 
 > isIncreasing [] = True  --- Just in case there is an empty list.



Problem 5
Convert this Prolog code to Haskell:

%5 accumProd(+Lst, RprodLst).

accumProd([V],[V]).
accumProd([H|T],[RH,RP|RT]):-accumProd(T,[RP|RT]),
                             RH is RP * H.

%  ?- accumProd([1,2,3,4],P).
 
%    P = [24, 24, 12, 4]
%	RH is H * RP.



> accumProd [v] = [v]
> accumProd (h:t) = h* head (accumProd t) : accumProd t


or
Note below that we are using nested functions.  So the nested function "hides"
the outer definition of "tail".


> accumProd2 [v] = [v]
> accumProd2 (h:t) = h* head tail : tail
>     where
>     tail = accumProd2 t  

