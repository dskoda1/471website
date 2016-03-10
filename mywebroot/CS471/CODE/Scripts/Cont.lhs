CS471   Apr 29, 2005

> module Cont where


Continuation passing style



> cfold' f z [] = z
> cfold' f z (x:xs) = f x z (\y -> cfold' f y xs)
> cfold f z lst = cfold' (\x t g -> f x (g t)) z lst

> count1 p l = length (filter p l)
> count2 p l = foldr (\x c -> if p x then c+1 else c) 0 l



