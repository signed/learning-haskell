-- file: ch04/Filter.hs
module Samples.Filter ( oddList ) where

oddList :: [Int] -> [Int]
oddList (x:xs) | odd x     = x : oddList xs
               | otherwise =     oddList xs
oddList _ = []