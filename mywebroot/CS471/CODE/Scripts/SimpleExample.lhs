> module SimpleExample where

This is an Example of the "literal" approach to programming in Haskell.
Code format:
   1) CODE needs to be signaled.  
   2) Code begins with a   ">" in column 1
   3) There need to be blank lines before and after the code.  
   

A script(a program) contains a series of definitions.  
In Haskell the LAYOUT is used to state where one definition ends 
and the next one begins.

"Formally, a definition is ended by the first piece of text (code or comments)
which lies at the same indentation or to the left of the start of the 
definition." (Thompson, p47). You can use tabs or spaces for indentation.  


File name: "SimpleExample.lhs" 

Some simple expression definitions:
 
> x = 8 * 5
> y = 8 * 5 - 7 `rem` (-3)

Local definitions using "where" of 'a' and 'x'

> z = a + x
>     where
>     a = 8*5
>     x = 7 `rem` (-3)  -- x hides the global 'x'

Local definition using "let"

> z2 = let a = 8 * 5
>          x = 7 `rem` (-3) -- hides the global 'x'
>    in a + x 

      
Define a symbol for the value of "pi"  
The types of next two symbols are inferred from their definition.
     
> py = 3.14159 
     
    we did not use "pi" since that is predefined (in Prelude)



 Define a function to calculate the area of a circle of radius r

> area r = py * r * r


Define a symbol for the value of the speed of light in meters per seconds(c).  
We will explicitly define the types of each symbol.

> c :: Double
> c = 3.0e8

Define a function to calculate E where E stands for energy and m is mass
and c is the speed of light.

> e :: Double  -> Double
> e m = m*c*c
