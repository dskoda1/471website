module ExampleA where
import List
-- If you get an error loading this file then
-- Use the "set" command with a "+i"
--     :set +1
-- and reload.


py :: Float
py = 3.14159
next5numbers n = [n+1,n+2,n+3,n+4,n+5]
sq n = n^2
cube x = x * (sq x)
sq1 :: Int -> Int
sq1 n = n^2

factorial :: Int -> Int 
factorial x
 | x < 0     = error "neg x"
 | x == 0    = 1
 | otherwise = x *
 factorial(x - 1)

factorial1::Integer -> Integer
factorial1 n
 |n < 0    = error "neg n"
 |n==0||n==1 = 1
 |otherwise= n*factorial1(n-1)
fact1 x
 | x < 0     = error "neg x"
 | x == 0    = 1
 | otherwise = x *  fact1(x - 1)


-- Try this...
-- Just enter 
-- primes
primes :: [Int]
primes = sieve [2..]
sieve (a:x) = a:sieve[y | y<-x, y `mod` a >0]

x :: Integer
x = (factorial1 13) - 1932053504
y = x `div` 2

testFilter list
 | list == [] = []
 | otherwise = if (head list > 6) 
  then head list : testFilter (tail list)
  else testFilter (tail list)

type Person = (String, Int)
z :: Person
z = ("John", 012345678)

data Color = Red | Blue | Pink

type Name = String
type Age = Int
data People = Person Name Age
x1 = Person "John" 25

showPerson :: People -> String
showPerson (Person n a) = n ++ "   " ++ show a

-- Use Point data structure for HW assignment 9
-- 
data Point a = Pt a a

firstCoord :: Point a -> a
firstCoord (Pt m n) = m

secondCoord :: Point a -> a
secondCoord (Pt m n) = n

inc = \x -> x+1
inc2 = inc . inc

extract :: Int -> Int -> [Int] -> [Int]
extract min max list
  | list == [] = []
  | otherwise = extractNonEmpty min max list
extractNonEmpty min max (a:x)
  | (a >= min) && (a <= max) = extract min max x
  | otherwise = a:extract min max x
  
extractOver8 = extract 8
extractBetween8and16 = extractOver8  16

maxOf3Ints::Int->Int->Int->Int
maxOf3Ints x y z
	| x >= y && x >= z = x
	| y >= z           = y
	| otherwise        = z
maxOf7andTwoInts = maxOf3Ints 7
maxOf7and9andOneInt = maxOf7andTwoInts 9
numberNine = maxOf7and9andOneInt 5

addLists list1 [] = []
addLists list1 (a:x) = addListElem list1 a ++ addLists list1 x

addListElem [] a = []
addListElem (b:x) a = (b+a) : addListElem x a

extract1 :: Int -> Int -> [Int] -> [Int]
extract1 min max [] = []
extract1 min max (a:x)
  | (a >= min) && (a <= max) = extract min max x
  | otherwise = a:extract min max x

fib 1 = 1
fib 2 = 1
fib n
	| n > 2  = fib(n-1)+fib(n-2)
	|otherwise = error "n>0 pls."

perms :: Eq t => [t] -> [[t]]
perms [] = [[]]
perms x=[a:p|a<-x,p<-perms(x\\[a])]


-- This is in List library
-- (\\) :: Eq a => [a] -> [a] -> [a]
-- (\\) [] _ = []
-- (\\) (a:x) [] = a:x
-- (\\) (a:x) (b:y) = if a == b then x \\ y
--		   else a:x \\ (b:y)




