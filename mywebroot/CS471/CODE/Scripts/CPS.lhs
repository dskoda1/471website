Code to accompany CS471/CS571 notes,  2006

> module CPS where

No continuation

> square x = x * x

... > square 3 + 1
... > square 5 * 3
... > square ((square 2)*3) +1

Continuation

> square' x k = k (x*x)

... > square' 3 ( \ s -> s+1 )
Do we need "()" here??
... > square' 5 (*3)
... > square' 2 (\ x-> square' (x*3) (+) 1) 

From: http://en.wikibooks.org/wiki/Haskell/YAHT/Type_basics

... > cfold' (\x t g -> (x : g t)) [] [1..3]
  [1,2,3]
  ... > cfold' (\x t g -> g (x : t)) [] [1..3]
  [3,2,1]


> cfold' f z [] = z
> cfold' f z (x:xs) = f x z (\y -> cfold' f y xs)

     cfold' (\x t g -> (x : g t)) [] [1,2,3]
              ---f--------------   z -x:xs---

==>  cfold' f [] [1,2,3]
==>  f 1 [] (\y -> cfold' f y [2,3])
==>  1 : ((\y -> cfold' f y [2,3]) [])
==>  1 : (cfold' f [] [2,3])
==>  1 : (f 2 [] (\y -> cfold' f y [3]))
==>  1 : (2 : ((\y -> cfold' f y [3]) []))
==>  1 : (2 : (cfold' f [] [3]))
==>  1 : (2 : (f 3 [] (\y -> cfold' f y [])))
==>  1 : (2 : (3 : (cfold' f [] [])))
==>  1 : (2 : (3 : []))
==>  [1,2,3]

     cfold' (\x t g -> g (x:t)) [] [1,2,3]
==>  cfold' f [] [1,2,3]
==>  (\x t g -> g (x:t)) 1 [] (\y -> cfold' f y [2,3])
==>  (\g -> g [1]) (\y -> cfold' f y [2,3])
==>  (\y -> cfold' f y [2,3]) [1]
==>  cfold' f [1] [2,3]
==>  (\x t g -> g (x:t)) 2 [1] (\y -> cfold' f y [3])
==>  cfold' f (2:[1]) [3]
==>  cfold' f [2,1] [3]
==>  (\x t g -> g (x:t)) 3 [2,1] (\y -> cfold' f y [])
==>  cfold' f (3:[2,1]) []
==>  [3,2,1]





Compare cfold and foldr and foldl
  > foldl f z (x:xs) = foldl f (f z x) xs

  > foldr :: (a -> b -> b) -> b -> [a] -> b


  > foldl :: (a -> b -> a) -> a -> [b] -> a
  > foldl f z [] = z

  > foldr f z (x:xs) = f x  (foldr f z xs)
  > foldr f z [] = z


Why do we need only one cfold? 


We can write a wrapper function for cfold' that will make it 
   behave more like a normal fold:

> cfold f z l = cfold' (\x t g -> f x (g t)) z l
  
  ... > cfold (+) 0 [1,2,3,4]
  10
  ...> cfold (:) [] [1,2,3]
  [1,2,3]

  
  ... > foldl (:) [] [1,2,3] 
  ERROR - Type error in application
  *** Expression     : foldl (:) [] [1,2,3]
  *** Term           : (:)
  *** Type           : a -> [a] -> [a]
  *** Does not match : [a] -> [a] -> [a]
  *** Because        : unification would give infinite type

  ... > foldr (:) [] [1,2,3]
  [1,2,3]

  ...>  cfold (-) 0 [1,2,3]
  2
  ...> cfold' (\x t g -> (-) x (g t)) 0 [1,2,3]
  2
  ...> foldr (-) 0 [1,2,3]
  2
  ...> foldl (-) 0 [1,2,3]
  -6



From::
   http://en.wikibooks.org/wiki/Haskell/Continuation_passing_style












No continuations  

> data Roots = None | One Double | Two Double Double
> quadRoots :: Double -> Double -> Double -> Roots
> quadRoots a b c
>   | d < 0 = None
>   | d == 0 = One $ -b/2/a
>   | d > 0 = Two ((-b + sqrt d)/2/a) ((-b - sqrt d)/2/a)
>   where d = b*b - 4*a*c

> printRoots :: Double -> Double -> Double -> IO ()
> printRoots a b c = case quadRoots a b c of
>   None -> putStrLn "There were no roots."
>   One x -> putStrLn $ showString "There was one root: " $ show x
>   Two x x' -> putStrLn $ showString "There were two roots found: " $
>     shows x $ showString " and " $ show x'

quadRoots' using continuations

> quadRoots' :: Double -> Double -> Double -- The three coefficients
>            -> a                          -- What to do with no roots
>            -> (Double -> a)              -- What to do with one root
>            -> (Double -> Double -> a)    -- What to do with two roots
>            -> a                          -- The final result
> quadRoots' a b c f0 f1 f2
>   | d < 0 = f0
>   | d == 0 = f1 $ -b/2/a
>   | d > 0 = f2 ((-b + sqrt d)/2/a) ((-b - sqrt d)/2/a)
>   where d = b*b - 4*a*c
  
Using the result of quadRoots, with continuations

> printRoots' :: Double -> Double -> Double -> IO ()
> printRoots' a b c = quadRoots' a b c f0 f1 f2
>   where
>     f0      = putStrLn "There were no roots."
>     f1 x    = putStrLn $ "There was one root: " ++ show x
>     f2 x x' = putStrLn $ "There were two roots found: " 
>                              ++ show x ++ " and " ++ show x'
