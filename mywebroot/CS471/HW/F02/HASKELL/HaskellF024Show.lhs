> module HaskellF024Show
>     where


Problem 1.


> powersOf x = iterate (\n -> n * x) 1.0

> fact  = 1.0:[ n*f | (n,f) <- zip [1.. ] fact ]



> eToX x = sum series
>     where
>     series =(takeWhile ((> 0.000001)) (terms))
>     terms = 1.0 : [ t*x / seq | (t,seq) <- zip terms [1.0 ..]]


> e2X x = sum series
>     where
>     powers = powersOf x
>     series = takeWhile ((>0.00001))
>                         [ (powers !! n )/ (fact!!n) | n<-[0..]]
>
> e3X x = sum series
>     where
>     powers = powersOf x
>     series = takeWhile ((>0.00001))
>                         [ p / f | (p,f)<-zip powers fact]
>

> eToxGC :: Double -> Double
> eToxGC x = sum (takeWhile (>0.000001) [x^n/ fact!!n | n<-[0..]])

> e2xGC :: Double -> Double
> e2xGC x = sum (takeWhile (>0.000001) [x^n/ product (take n [1..]) | n<-[0..]])

> e2x2GC :: Double -> Double
> e2x2GC x= sum (takeWhile (>0.000001) (zipWith (/) ((\x -> iterate (\n -> x*n) 1 ) x) fact ))

> e2x3GC :: Double -> Double
> e2x3GC x= sum (takeWhile (>0.000001) (zipWith (/) (powersOf x) fact ))

e2x2GC is the best at about 25% faster than the example calls.



> lengthHOF  = ((foldl1 (+)). (map one))
> lengthHOF2  = /lst -> (foldl1 (+) (map one lst)) 
> one = (\x -> 1)



Problem 3: Thompson 10.3


> composeList [] = id
> composeList (h:t) = h . composeList t

> composeList1 [f] = f
> composeList1 (h:t) = h . composeList1 t

> composeListHOF  = foldr (.) id
> composeListHOF2 = foldl (.) id

> composeListHOF3  = foldr1 (.) 
> composeListHOF4 = foldl1 (.) 


Problem 5.
Use the HOF, map, to square the values of a list.
       ...> sqLst [1,2,3]
            [1,4,9]
CODE:


> sqLst  = map (\x -> x*x) 
> sqLst2 = \lst -> map (\x -> x*x) lst



Problem 6:


> aver lst = (foldr (+) 0.0 lst)/(foldr (+) 0 (map (\x->1.0) lst))


Problem 7.

> addTuples = map (\(x,y) -> x+y)
> addTuples2 = map (uncurry (+))
> addTuples3 = (map . uncurry) (+)


