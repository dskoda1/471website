

Adds tuples

> addTuples2 = map (uncurry (+))
> addTuples3 = (map . uncurry) (+)



> elemLst [] _ = []
> elemLst _ [] = []
> elemLst (e:es) (l:ls) =  (elem e l): elemLst es ls
> elemLstHOF es ls = map (uncurry elem) (zip es ls)
> elemLstLC es ls = [elem e l | (e,l) <- zip es ls]


