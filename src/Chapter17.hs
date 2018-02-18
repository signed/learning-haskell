module Chapter17 where
import Data.List (elemIndex)
import qualified Data.Foldable as F
import Data.Monoid
import Control.Applicative

f :: (Num a, Eq a) => a -> Maybe String
f x = lookup x [ (3, "hello")
           , (4, "julie")
           , (5, "kbai")]

g :: (Num a, Eq a) => a -> Maybe String
g y = lookup y [ (7, "sup?")
           , (8, "chris")
           , (9, "aloha")]

h :: (Num a, Num b, Eq a) => a -> Maybe b
h z = lookup z [(2, 3), (5, 6), (7, 8)]

m :: (Num a, Num b, Eq a) => a -> Maybe b
m x = lookup x [(4, 10), (8, 13), (1, 9001)]

--1076 add pure <$> or <*> to make it compile

--1)
added :: Maybe Integer
added = (+3)<$> (lookup 3 $ zip [1, 2, 3] [4, 5, 6])

--2)
y :: Maybe Integer
y = lookup 3 $ zip [1, 2, 3] [4, 5, 6]

z :: Maybe Integer
z = lookup 2 $ zip [1, 2, 3] [4, 5, 6]

tupled :: Maybe (Integer, Integer)
tupled = (,) <$> y <*> z

--3)
x :: Maybe Int
x = elemIndex 3 [1, 2, 3, 4, 5]

y2 :: Maybe Int
y2 = elemIndex 4 [1, 2, 3, 4, 5]

max' :: Int -> Int -> Int
max' = max

maxed :: Maybe Int
maxed = max' <$> x  <*> y2

--4)
xs = [1, 2, 3]
ys = [4, 5, 6]

x4 :: Maybe Integer
x4 = lookup 3 $ zip xs ys

y4 :: Maybe Integer
y4 = lookup 2 $ zip xs ys

summed :: Maybe Integer
summed = fmap F.sum $ (,) <$> x4 <*> y4


-- p1079
newtype Identity a = Identity a deriving (Eq, Ord, Show)

instance Functor Identity where
  fmap f (Identity a) = Identity $ f a

instance Applicative Identity where
  pure = Identity
  Identity f <*> Identity a =  Identity $ f a
--  (<*>) (Identity f)  (Identity a) =  Identity $ f a


newtype Constant a b = Constant { getConstant :: a } deriving (Eq, Ord, Show)

instance Functor (Constant a) where
  fmap _ (Constant a) = Constant a

instance Monoid a => Applicative (Constant a) where
  pure _ = Constant mempty
  (<*>) _  (Constant a) = Constant a

-- p1006

-- 1)
--banana = const <$> Just "Hello" <*> pure "World"

-- 2)
--bread = (,,,) <$> Just 90 <*> Just 10 <*> Just "Tierness" <*> pure [1, 2, 3]

-- p 1125
data List a = Nil | Cons a (List a) deriving (Eq, Show)
instance Functor List where
  fmap f Nil = Nil
  fmap f (Cons x xs) = Cons (f x) (fmap f xs)

instance Applicative List where
  pure x = Cons x Nil
  (<*>) Nil _ = Nil
  (<*>) _ Nil = Nil
  (<*>) (Cons f fs) xs = append (fmap f xs) (fs <*> xs)

append :: List a -> List a -> List a
append Nil ys         = ys
append (Cons x xs) ys = Cons x (append xs ys)

fold::(a->b->b)->b->List a->b
fold _ b Nil =b
fold f b (Cons h t) = f h(fold f b t)

concat' :: List (List a) -> List a
concat' = fold append Nil

flatMap :: (a -> List b) -> List a -> List b
flatMap f as = concat' $ fmap f as

-- zip list

take'::Int->List a->List a
take' _ Nil = Nil
take' 0 (Cons x xs) = Nil
take' i (Cons x xs) = Cons x (take' (i-1) xs)


-- p 1136
-- Pair
data Pair a = Pair a a deriving Show

instance Functor Pair where
  fmap f (Pair a a') = Pair (f a) (f a')

instance Applicative Pair where
  pure a = Pair a a
  (<*>) (Pair f f') (Pair a a') = Pair (f a) (f' a')

-- Two
data Two a b = Two a b

instance Functor (Two a) where
  fmap f (Two a b) = Two a (f b)

instance Monoid a => Applicative (Two a) where
  pure = Two mempty
  Two m f <*> Two m' x = Two (m <> m') (f x)


-- Three
data Three a b c= Three a b c

instance Functor (Three a b) where
  fmap f (Three a b c) = Three a b (f c)

instance (Monoid a, Monoid b) => Applicative (Three a b) where
  pure = Three mempty mempty
  Three m n f <*> Three m' n' x = Three (m <> m') (n <> n') (f x)

-- Three'
data Three' a b = Three' a b b

instance Functor (Three' a) where
  fmap f (Three' a b b') = Three' a (f b) (f b')

instance (Monoid a) => Applicative (Three' a) where
  pure a = Three' mempty a a
  Three' m f f' <*> Three' m' x y = Three' (m <> m') (f x) (f' y)


-- Four
data Four a b c d= Four a b c d

instance Functor (Four a b c) where
 fmap f (Four a b c d) = Four a b c (f d)

instance (Monoid a, Monoid b, Monoid c) => Applicative (Four a b c) where
  pure = Four mempty mempty mempty
  Four m n o f <*> Four m' n' o' x = Four (m <> m') (n <> n') (o <> o') (f x)

-- Four'
data Four' a b = Four' a a a b

instance Functor (Four' a) where
  fmap f (Four' a b c x) = Four' a b c (f x)

instance Monoid a => Applicative (Four' a) where
  pure = Four' mempty mempty mempty
  Four' m n o f <*> Four' m' n' o' x = Four' (m<>m') (n<>n') (o<>o') (f x)

-- Combinations
stops :: String
stops = "pbtdkg"

vowels :: String
vowels = "aeiou"

combos :: [a] -> [b] -> [c] -> [(a, b, c)]
combos = liftA3 (,,)