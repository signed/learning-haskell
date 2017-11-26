module Socrates where

f x = x + x
apply func parameter = func parameter

times x y = x * y 

no_argument x = 42


remaining = 5 `mod` 3


--(thomas) :: Int -> Int -> Int
--(thomas) x y = x `mod` y

--infix_by_default = 5 thomas 3


decide  a = if a==2 then "its 2" else "its not two"

fib 0 = 0
fib 1 = 1
fib x = fib (x-1) + fib(x-2)

data Fruit =
      Appel String
    | Orange
    | Banana

color (Appel color) = "so "++ color
color Banana = "yellow"
color _ = "i don't know"


take_whole x@(_) = color x

-- hey under socre you are doing it wrong
--drop2        []  = []
--drop2 all@(x:[]) = all
drop2 (x:_:xs) = x : drop2 xs
drop2 x = x

