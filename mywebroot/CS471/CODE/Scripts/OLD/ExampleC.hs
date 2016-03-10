module ExampleC
where


fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n-2) + fib (n-1)

fib1 0 = 0
fib1 n = fiba n 1 0 1
   where
   fiba n c a b = if c == n then b
                  else fiba n (c+1) b (a+b)


fib2 n = fibs !! n
   where
   fibs = (0 : 1 : zipWith (+) fibs (tail fibs))


fact :: Integer -> Integer
fact1 :: Integer -> Integer
fact2 :: Int -> Integer

fact 0 = 1
fact n = n* fact(n-1)

fact1 n = facta n 0 1
   where
   facta :: Integer -> Integer -> Integer -> Integer
   facta n c p = if (c==n) then p
                 else facta n (c+1) (c+1)*p

fact2 n = facts !! n
 where
  facts :: [Integer]
  facts = 1:1:zipWith (*) [2..] (tail facts)



