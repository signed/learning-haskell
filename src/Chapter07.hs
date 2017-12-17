module Chapter07 where
--mTh x y z = x * y * z
--mTh x y z = x * y * z
--mTh x y z = x * y * z
--mTh x y z = x * y * z


k :: (a,b) -> a
k (x, y) = x
k1 = k ((4-1), 10)
k2 = k ("three", (1 + 2))
k3 = k (3, True)


f :: (a, b, c)
  -> (d, e, f)
  -> ((a, d), (c, f))
f (a, b, c) (d, e, f) = ((a,d),(c,f))

functionC x y = case x > y  of
  True -> x
  False -> y


ifEvenAdd2 n = case even n of
  True -> n+2
  False -> n

nums x = case compare x 0 of
   LT -> -1
   GT -> 1
   EQ -> 0

dodgy x y = x + y * 10
oneIsOne = dodgy 1
oneIsTwo = (flip dodgy) 2

pal :: Eq a => [a] -> Bool
pal xs
 | xs == reverse xs = True
 | otherwise = False

numbers :: (Ord a, Num a) => a -> Int
numbers x
 | x < 0 = -1
 | x==0 =0
 | x>0 =1



f2:: Char -> String
f2 = undefined
g2:: String -> [String]
g2 = undefined

c :: Char -> [String]
c = g2 . f2

f3 :: Ord a => a -> a -> Bool
f3 = undefined


tensDigit :: Integral a => a -> a
tensDigit x = d
 where xLast = x `div` 10
       d = xLast `mod` 10

tensDigitDivMod :: Integral a => a -> a
tensDigitDivMod x = d
 where ( _, d) = divMod (fst (divMod x 10)) 10


g :: (a -> b) -> (a, c) -> (b, c)
g aToB (a,c) = (aToB a, c)

roundTrip :: (Show a, Read a) => a -> a
roundTrip a = read.show $ a

roundTrip2 :: (Show a, Read b) => a -> b
roundTrip2 a = read.show $ a
