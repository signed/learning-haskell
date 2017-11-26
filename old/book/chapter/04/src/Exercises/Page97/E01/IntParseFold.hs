import Data.Char(digitToInt) -- we'll need ord shortly
import Data.List(foldl')

asInt :: String -> Int


loop :: Int -> String -> Int
asInt [] = 0
asInt xs = loop 0 xs

loop acc []       = acc
loop acc (x : xs) = let acc' = acc * 10 + (digitToInt x)
                    in loop acc' xs

asIntFoldl :: String -> Int
asIntFoldl xs = foldl' step 0 xs
                where step acc x = acc * 10 + (digitToInt x)

asIntFoldr :: String -> Int
asIntFoldr xs = let (_, result) = foldr step (1,0) xs
                in result
                where step x (multi, acc) = (multi*10, digitToInt x * multi + acc)