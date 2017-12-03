module Chapter04 (
 Mood(..)
 ,changeMood
 ,ownNot
  ) where

data Mood = Blah | Woot deriving (Show, Eq)

ownNot :: Bool -> Bool
ownNot True = False
ownNot False = True

changeMood :: Mood -> Mood
changeMood Blah = Woot
changeMood _ = Blah