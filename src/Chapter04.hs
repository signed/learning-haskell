module Chapter04 (
 Mood(..)
 ,changeMood
 ,ownNot
 ,allAwesome
 ,awesome
 ,isPalindrome
 ,myAbs
 ,f
  ) where

data Mood = Blah | Woot deriving (Show, Eq)

ownNot :: Bool -> Bool
ownNot True = False
ownNot False = True

changeMood :: Mood -> Mood
changeMood Blah = Woot
changeMood _ = Blah

awesome = ["Papuchon", "curry", ":)"]
also = ["Quake", "The Simons"]
allAwesome = [awesome, also]


ownlength :: [a] -> Integer
ownlength b  = 42

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x = reverse x == x

myAbs :: Integer -> Integer
myAbs x = if x < 0 then negate x else x


-- https://en.wikibooks.org/wiki/Haskell/Pattern_matching
f :: (a, b) -> (c, d) -> ((b, d), (a, c))
--f (a,b) (c,d) = ((b,d), (a,c))
f one@(a,b) two@(c,d) =( (snd one, snd two), (fst one, fst two))
