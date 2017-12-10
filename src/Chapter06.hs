module Chapter06 where

import Data.List(sort)

data Trivial = Trivial | Pursuit

instance Eq Trivial where
 Trivial == Trivial = True
 Pursuit == Pursuit = True
 _ == _             = False


data DayOfWeek =
  Mon | Tue | Weds | Thu | Fri | Sat | Sun deriving Show

instance Eq DayOfWeek where
 (==) Mon Mon = True
 (==) Tue Tue = True
 (==) Weds Weds = True
 (==) Thu Thu = True
 (==) Fri Fri = True
 (==) Sat Sat = True
 (==) Sun Sun = True
 (==) _   _   = False

-- day of week and numerical day of month
data Date = Date DayOfWeek Int deriving Show

instance Eq Date where
 (==) (Date weekday dayOfMonth)
      (Date weekday' dayOfMonth')
        = weekday == weekday' && dayOfMonth == dayOfMonth'


data Identity a = Identity a

instance Eq a => Eq (Identity a) where
 (==) (Identity v) (Identity v') = v == v'


-- 272
data TisAnInteger =
       TisAn Integer

instance Eq TisAnInteger where
  (==) (TisAn lhs) (TisAn rhs) = lhs == rhs

data TwoIntegers = Two Integer Integer deriving Show
instance Eq TwoIntegers where
  Two lhs1 lhs2 == Two rhs1 rhs2 = lhs1 == rhs1 && lhs2 == rhs2

data EitherOr a b = Hello a | Goodbye b deriving Show

instance (Eq a, Eq b)=> Eq (EitherOr a b) where
  (==) (Hello lhs) (Hello rhs) = lhs == rhs
  (==) (Goodbye lhs) (Goodbye rhs) = lhs == rhs
  (==) (Hello _ ) (Goodbye _ ) = False


data Person = Person Bool deriving Show
printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)


data Mood = Blah
               | Woot deriving (Show, Eq)
settleDown x = if x == Woot then Blah
            else x


type Subject = String
type Verb = String
type Object = String

data Sentence =
 Sentence Subject Verb Object deriving (Eq, Show)

s1 = Sentence "dogs" "drool"
s2 = Sentence "Julie" "loves" "dogs"


data Rocks = Rocks String deriving (Eq, Show)
data Yeah = Yeah Bool deriving (Eq, Show)
data Papu = Papu Rocks Yeah deriving (Eq, Show)

--phew = Papu "chases" True

truth = Papu (Rocks "chomskydoz") (Yeah True)

equalityForall :: Papu -> Papu -> Bool
equalityForall p p' = p == p'

--comparePapus :: Papu -> Papu -> Bool
--comparePapus p p' = p > p'

--freud :: a -> a
--freud :: Ord a => a -> a
freud :: Int -> Int
freud a = a

myX=1::Int
--sigmund :: Num a => a -> a
--sigmund :: a -> a
sigmund x = myX


--jung :: Ord a => [a] -> a
jung :: [Int] -> Int
jung xs = head (sort xs)

--young :: [Char] -> Char
young :: Ord a => [a] -> a
young xs = head (sort xs)

mySort :: [Char] -> [Char]
mySort = sort

--signifier :: [Char] -> Char
--signifier :: Ord a => [a] -> a
signifier xs = head (mySort xs)

chk :: Eq b => (a -> b) -> a -> b -> Bool
chk aTob a b = aTob a == b
--chk aTob a b = b == b
--chk _ _ _ = True
--chk _ _ _ = False


arith :: Num b => (a -> b) -> Integer -> a -> b
arith aTob i a = aTob a
--arith aTob i a = aTob a + fromInteger i