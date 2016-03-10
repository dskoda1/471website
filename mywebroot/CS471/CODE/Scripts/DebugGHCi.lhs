> module DebugGHCi  where
> import Debug.Trace
 
> fib :: Int -> Int
> fib 0 = 0
> fib 1 = 1
> fib n = trace ("n: " ++ show n) $ fib (n - 1) + fib (n - 2)

Type 'main' at the prompt --- to see the trace

> main = putStrLn $ "fib 4: " ++ show (fib 4)

 main = putStrLn $ "fib 4: " ++ show (fib 4)

