> module Test
>    where
> import Hugs.Observe

> minN [x]    = x
> minN (x:xs) = min x (minN xs)

> minNO [x] = observe "'base case'" x
> minNO(x:xs) = observe "'min x (minN xs)'" min x (minNO xs)

> minT (x:y:xs) = minT ((min x y):xs)
> minT [x] = x

> minTO (x:y:xs) = observe " minTO ((min x y):xs)"  minTO ((min x y):xs)
> minTO [x] = observe "'base case'" x



