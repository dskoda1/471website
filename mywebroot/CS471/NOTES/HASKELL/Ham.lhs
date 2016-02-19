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
>    f a = [ n*a | n <- hamming4 ]
>    merge lx@(x:xs) ly@(y:ys)
>        | x == y          = x : merge xs     ys
>        | x < y           = x : merge xs     ly
>        | otherwise       = y : merge lx     ys










> hamming5 = 1:2:3:4:5:6:[ x | x <- [8..], isHam x]
>   where
>   isHam z
>      | (z == 2) = True
>      | (z == 3) = True
>      | (z == 5) = True
>      | (mod z 5) == 0 = isHam (div z 5)
>      | (mod z 2) == 0 = isHam (div z 2)
>      | (mod z 3) == 0 = isHam (div z 3)
>      | otherwise = False

> hamming6 = 1:2:3:4:5:6:[ x | x <- [8..], isHam x]
>   where
>   isHam z
>      | (mod z 5) == 0 = (div z 5) == last(takeWhile (<=(div z 5)) hamming6)
>      | (mod z 2) == 0 = (div z 2) == last(takeWhile (<=(div z 2)) hamming6)
>      | (mod z 3) == 0 = (div z 3) == last(takeWhile (<=(div z 3)) hamming6)
>      | otherwise = False


> hammingHOF = 1 : merge (map (*2) hammingHOF) 
>                     (merge (map (*3) hammingHOF) 
>                            (map (*5) hammingHOF)) 
>     where
>     merge (x:xs) (y:ys) 
>       | x == y          = x : merge xs     ys 
>       | x < y           = x : merge xs     (y:ys) 
>       | otherwise       = y : merge (x:xs) ys



