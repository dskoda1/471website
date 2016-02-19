
> module HaskellF023Show
>     where
> import List


Problem 1:  Easy
 
> data Triple a b c = Triple a b c  deriving Show

Not done very easy

Problem 2:
i.e. use coef = [an, an-1, ... a1, a0]

> calcPoly coef x = sum [a * x ^ e  | (a, e) <- zip coef [0..]] 

Assume coef = [a0, a1, ... an-1, an]

> horner [c] x = c
> horner (h:cs) x = sum ( h: [(horner [c*x | c<- cs] x)])

this assumes the [an, an-1,.. a1,a0]

> hornerJ (coef:coefs) x = last horner2
>     where
>     horner2 =  coef : [h * x + c | (h, c) <- zip horner2 coefs ]

> hornerZ (coef:coefs) x = last horner3
>     where
>     horner3 =  coef : [v | v <- zipWith f horner3 coefs ]
>     f h c = h * x + c

Problem 3:
Recursion:

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



Problem 4: Using list comprehension as part of your solution:


> occurrenceLC xs@(h:hs) =
>     (h,length [x| x<-xs, h == x]): occurrence [x|x<-hs, h /= x]
> occurrenceLC [] = []

> occurrence2 xs@(h:hs) =
>     (h,sum [1| x<-xs, h == x]): occurrence2 [x|x<-hs, h /= x]
> occurrence2 [] = []


> occurrenceJim list = [(x,length (elemIndices x list)) | x <- nub list]


Problem 5:

> lF :: [a] -> Float
> lF = (\x -> encodeFloat ((toInteger . length) x) 0)


CODE::  

> averageOfList list = encodeFloat ((toInteger . sum) list) 0 / lF list


Problem 6:
recursion:

   Write a script that returns the running average of a list of numbers (nums).  
   You will can use 

   ...> runningAver [4,3,2,1]
   [2.5,2,1.5,1.0]

   This is just two lines of code.   
   
CODE:  

> runningAver [n] = [ encodeFloat n 0]
> runningAver list@(h:t) = averageOfList list : (runningAver t )




Problem 7: (Use list comprehension notation as part of the solution.)
(From Thompson 17.23)  Give a definition of the function


> factors :: Integer -> [Integer]
> factors num = [f | f<- [1 .. num], (mod num f)==0]

> factors2 :: Integer -> [Integer]
> factors2 x = 1:[a | a<-[2..(div x 2)], (mod x a) == 0] ++ [x]

> factors3 :: Integer -> [Integer]
> factors3 x = 1:[a | a<-[2..(div x 2)], b<-[(div)x a], a*b==x] ++ [x]



Problem 8: (Use list comprehension notation in your solution)

Define the list of numbers whose only prime factors are 2,3, and 5 , the
so-called Hamming numbers:

hamming = [1,2,3,4,5,6,8,9,10,12,15, ...


> hamming = [y|y<-[1..], a<-[0..y], b<-[0..y], c<-[0..y], 2^a*3^b*5^c==y]
> hamming2 = 1:[h | h<- [1..], and [ok v | v<- tail (factors2 h)]]
>     where
>     ok = (\v -> (mod v 5 ==0)||(mod v 3 ==0)||( mod v 2 ==0))

> hamming3 = 1 : merge (f 2) (merge (f 3) (f 5))
>    where
>    f a = [ n*a | n <- hamming3 ]
>    merge (x:xs) (y:ys)
>     | x == y          = x : merge xs     ys
>     | x < y           = x : merge xs     (y:ys)
>     | otherwise       = y : merge (x:xs) ys




> hamming4 = 1 : merge (f 2) (merge (f 3) (f 5))
>    where
>      f a = [ n*a | n <- hamming4 ]
>      merge lx@(x:xs) ly@(y:ys)
>        | x == y          = x : merge xs     ys
>        | x < y           = x : merge xs     ly
>        | otherwise       = y : merge lx     ys
