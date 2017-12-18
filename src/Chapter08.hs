module Chapter08 where
import Data.List (intercalate)
import Data.Char (digitToInt)

cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y
-- fill in the types

flippy :: String -> String -> String
flippy = flip cattyConny

appedCatty :: String -> String
appedCatty = cattyConny "woops"

frappe :: String -> String
frappe = flippy "haha"


sumOneTo :: (Eq a, Num a) => a -> a
sumOneTo end = go 1
  where go counter
            | counter == end = counter
            | otherwise    = counter + go (counter + 1)

-- p 451
multiplyBySummation :: (Integral a) => a -> a -> a
multiplyBySummation x y
  | y == 0 = 0
  | y < 0  =  - multiplyBySummation x (abs y)
  | y == 1 = x
  | otherwise = x + multiplyBySummation x (y-1)

data DividedResult a = Result (a, a) | DividedByZero deriving (Eq, Show)

dividedBy :: Integral a => a -> a -> DividedResult a
dividedBy num denom = go num denom 0 False
  where go n d count negateCount
          | d == 0 = DividedByZero
          | d < 0  = go n (abs d) count (not negateCount)
          | n < 0  = go (abs n) d count (not negateCount)
          | n < d  = Result (signedCount, n)
          | otherwise = go (n - d) d (count + 1) negateCount
          where signedCount = if negateCount then - count else count


mc91 x | x > 100 = x -10 | x <=100 = mc91(mc91 (x + 11))



digitToWord :: Int -> String
digitToWord 0 = "zero"
digitToWord 1 = "one"
digitToWord 2 = "two"
digitToWord 3 = "three"
digitToWord 4 = "four"
digitToWord 5 = "five"
digitToWord 6 = "six"
digitToWord 7 = "seven"
digitToWord 8 = "eight"
digitToWord 9 = "nine"
digitToWord _ = "nope"

digits :: Int -> [Int]
digits n = map digitToInt (show n)

wordNumber :: Int -> String
wordNumber n = intercalate "-" words
 where splitUpDigits = digits n :: [Int]
       words = map digitToWord splitUpDigits :: [String]

