> module Debugging where
> import Hugs.Observe
> import Debug.Trace

Using Hugs library to help with debugging.

> merge [] ys = ys
> merge xs [] = xs
> merge xss@(x:xs) yss@(y:ys)
>    | x < y = x: merge xs yss
>    | otherwise = y : merge xss ys

> mergeTrace :: (Ord a,Show a) => [a] -> [a] -> [a]
> mergeTrace [] ys = trace (" :merge xs==[] returns " ++ (show ys)++"\n") ys
> mergeTrace xs [] = trace (" :merge ys==[] returns "++ (show xs)++"\n") xs
> mergeTrace xss@(x:xs) yss@(y:ys) 
>    | x < y = trace xmsg rx
>    | otherwise = trace ymsg ry
>    where
>      xmsg = " :merge(x<y)"  ++ " returns \n " ++ (show rx)
>      rx = x: mergeTrace xs yss
>      ymsg = " :merge(x>y)" ++ " returns \n " ++(show ry)
>      ry = y: mergeTrace xss ys
>      
> mergeObs [] ys = observe "merge [] ys " ys
> mergeObs xs [] = observe "merge [] xs "  xs
> mergeObs xss@(x:xs) yss@(y:ys)
>    | x < y = observe "merge (x<y)" x: mergeObs xs yss
>    | otherwise = observe "merge (x>y)" y : mergeObs xss ys


See: "Advise on Debugging Haskell Code"
  http://www.csc.uvic.ca/~csc330/Assignment3/DebuggingHaskell.pdf
for details
