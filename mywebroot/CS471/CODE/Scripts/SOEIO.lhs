> module SOEIO where
>     
> wcf :: (Int, Int, Int) -> String -> (Int, Int, Int)
> wcf (cc,w,lc) [] = (cc,w,lc) 
> wcf (cc,w,lc) (' ' : xs) = wcf (cc + 1 ,w + 1, lc) xs
> wcf (cc,w,lc) ('\t': xs) = wcf (cc + 1 , w + 1, lc) xs 
> wcf (cc,w,lc) ('\n': xs) = wcf (cc + 1 , w + 1, lc + 1) xs 
> wcf (cc,w,lc) ( x: xs)   = wcf (cc + 1 , w, lc) xs 

> wc :: IO ()
> wc = do name <- getLine
>	  contents <- readFile name
>	  let (cc,w,lc) = wcf (0,0,0) contents
>         putStrLn ("The File " ++ name ++ " has ")
>	  putStrLn (show cc++" characters ")
>	  putStrLn (show w++" words ")
>	  putStrLn (show lc++" lines ")


Information about the "do" expression
  http://haskell.org/onlinereport/exps.html#sect3.14
