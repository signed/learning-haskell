-- file: ch04/Map.hs
import Data.Char (toUpper)

square :: [Double] -> [Double]
square (x:xs) = x*x : square xs
square [] = []

upperCase :: String -> String
upperCase (x:xs) = toUpper x : upperCase xs
upperCase [] = []

square2 :: [Double] -> [Double]
square2 xs = map squareOne xs
             where squareOne x = x * x

upperCase2 :: String -> String
upperCase2 xs = map toUpper xs