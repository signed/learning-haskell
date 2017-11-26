module Exercises.Page97.E02.IntParse (asInt_fold) where

import Data.Char(digitToInt) -- we'll need ord shortly

asInt_fold :: String -> Int
asInt_fold xs = let (_, result) = foldr step (1,0) xs
                in result
                where step '-' (multi, acc)| multi == 1 = error "no valid input"
                      step '-' (multi, acc)             = (multi, negate acc)
                      step x   (multi, acc)             = (multi*10, digitToInt x * multi + acc)
