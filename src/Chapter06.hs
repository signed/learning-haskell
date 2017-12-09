module Chapter06 where

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