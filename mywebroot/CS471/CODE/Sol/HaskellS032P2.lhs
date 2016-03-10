
YOUR NAME, EMAIL

> module HaskellS032P2
>     where

 
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