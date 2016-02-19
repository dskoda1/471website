

Adds tuples

> addTuples2 = map (uncurry (+))
> addTuples3 = (map . uncurry) (+)



> elemLst [] _ = []
> elemLst _ [] = []
> elemLst (e:es) (l:ls) =  (elem e l): elemLst es ls
> elemLstHOF es ls = map (uncurry elem) (zip es ls)
> elemLstLC es ls = [elem e l | (e,l) <- zip es ls]




> q5 = [1] : [ zipWith (+)(0:q)(q++[0])| q<-q5 ]


> binCoef :: (Num a) => [a] -> [a]
> binCoef cs  = (head cs):sumTerms cs
>      where 
>      sumTerms (c1:c2:cs) = (c1+c2):sumTerms(c2:cs)
>      sumTerms [c]= [c]
