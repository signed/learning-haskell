-- file: ch04/Adler32.hs
module Samples.Adler32 where

import Data.Char (ord)
import Data.Bits (shiftL, (.&.), (.|.))

base :: Int
base = 65521

adler32 :: String -> Int
adler32 xs = helper 1 0 xs
             where helper a b (x:xs) = let a' = (a + (ord x .&. 0xff)) `mod` base
                                           b' = (a' + b) `mod` base
                                       in helper a' b' xs
                   helper a b _      = (b `shiftL` 16) .|. a

-- file: ch04/Adler32.hs
adler32_try2 :: String -> Int
adler32_try2 xs = helper (1,0) xs
                  where helper (a,b) (x:xs) = let a' = (a + (ord x .&. 0xff)) `mod` base
                                                  b' = (a' + b) `mod` base
                                              in helper (a',b') xs
                        helper (a,b) _      = (b `shiftL` 16) .|. a

adler32_foldl :: String -> Int
adler32_foldl xs =  let (a, b) = foldl step (1, 0) xs
                    in (b `shiftL` 16) .|. a
                    where step (a, b) x = let a' = a + (ord x .&. 0xff)
                                          in (a' `mod` base, (a' + b) `mod` base)