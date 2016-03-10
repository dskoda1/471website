
Changed Sept, 2000

Code to accompany CS471/CS571 notes, 2000-2001
Based on "The Craft of functional Programming" by Simon Thompson
Need to import IO to do file Input/Output

> module IOExamples where
> import IO



Using the Preludes "interact" and streamEx
  > interact streamEx
input typed in will be displayed in the command window in reverse.
$ will terminate the program. 

> streamEx :: String -> String
> streamEx = unlines . (map reverse) . lines . takeWhile (/= '$')


The Forward composition operator below makes it easy to 
construct "dataflow pipelines".

> infixl 9 >.>
> (>.>) :: (t -> u) -> (u->v) -> (t->v)
> (f >.> g) x = g (f x)

Using the Preludes "interact" and pipeStream
  > interact pipeStream
input keyboarded in  will be displayed in the command window reversed.
$ will terminate the program. 

> pipeStream :: String -> String
> pipeStream = takeWhile (/='$') >.>
>            lines             >.>
>            map reverse       >.>
>	     unlines

____________________________________________________________________
IO
__________________________________________________________________
Haskell IO code  based on examples
               from "The Haskell School of Expression"
                and "The Craft of functional Programming"

> hello :: IO ()
> hello = putStr "Hello Students\n"

> printOut :: Show a => a -> IO()
> printOut = putStr .  show 

> 
> copy :: IO ()
> copy = do line <- getLine
>	    putStr line

Becareful to line up the "do sequence"

> copyToFile :: IO()
> copyToFile = do s <- getLine
>	          writeFile "fileEX.txt" s

to evaluate the list, actionList, type
sequence_ actionList

> actionList = [putStr "Hello Students\n",
>	        writeFile "fileEX.txt" "Hello File!\n",
>	        putStr "Bye bye!" ]


This is not the best way to sequence through a list of IO commands.  See
Prelude's sequence_

> ioLoop :: [IO()] -> IO()
> ioLoop [] = return ()
> ioLoop (a:as) =
>     do a
>        if (null as) then return()
>                     else ioLoop as



> while :: IO Bool -> IO () -> IO ()
> while test action
>     = do res <- test
>	   if res then do action
>		          while test action
>		  else return ()


Below does not work the way you expect -- Why?

> copyUntilEmptybad :: IO()
> copyUntilEmptybad 
>     = do line <- getLine
>	   while (return(not(null line)))
>                 (do putStr line
>                     line <-getLine  
>                     return ())

Display each line after it is typed in.  To terminate just enter a blank line.

> copyUntilEmpty :: IO()
> copyUntilEmpty 
>     = do line <- getLine
>	   if (null line) then return ()
>             else (do putStr line
>	               putChar '\n'
>	               copyUntilEmpty)


> getInt :: IO Int
> getInt = do line <- getLine
>	      return (read line :: Int)


An interactive program that adds positive integers read from successive
lines until n == 1 is read:

> sumInts :: IO Int
> sumInts 
>     = do n <- getInt
>	   if n==0
>             then return 0
>	      else (do m <- sumInts
>	               return (n+m) )

"totals" prints a greeting and print the total calculated using totalInts

> getTotal :: IO()
> getTotal
>     = do putStr "\nEnter one integer per line -- ending with n<1:\n"
>          sum <- sumInts
>	   putStr "The Total is "
>	   print sum


Copy from the standard input 2 lines and write into an existing
file repeating until an empty line appears as the first line.

> fromIPtoFile :: IO()
> fromIPtoFile 
>     = do line <- getLine
>	   if (line == [])
>              then return ()
>	       else (do n <- getLine 
>	                appendFile "fileEX.txt" (line ++ n ++ "\n")
>                       fromIPtoFile)


> myprint = putStr "Hello World\n"















