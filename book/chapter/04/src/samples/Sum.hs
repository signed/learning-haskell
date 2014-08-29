-- file: ch04/Sum.hs
mySum :: [Integer] -> Integer
mySum xs = helper 0 xs
           where helper acc (y:ys) = helper (acc + y) ys
                 helper acc _ = acc

foldlSum :: [Integer] -> Integer
foldlSum xs = foldl step 0 xs
              where step acc x = acc + x

niceSum :: [Integer] -> Integer
niceSum xs = foldl (+) 0 xs