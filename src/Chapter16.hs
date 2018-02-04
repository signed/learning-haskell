{-# LANGUAGE FlexibleInstances #-}
module Chapter16 where


data FixMePls a = FixMe | Pls a deriving (Eq, Show)
instance Functor FixMePls where
  fmap _ FixMe = FixMe
  fmap f (Pls x) = Pls $ f x




-- p 1000
replaceWithP :: b -> Char
replaceWithP = const 'p'

lms :: [Maybe [Char]]
lms = [Just "Ave", Nothing, Just "woohoo"]

-- Just making the argument more specific
replaceWithP' :: [Maybe [Char]] -> Char
replaceWithP' = replaceWithP

liftedReplace :: Functor f => f a -> f Char
liftedReplace = fmap replaceWithP

liftedReplace' :: [Maybe [Char]] -> [Char]
liftedReplace' = liftedReplace

twiceLifted :: (Functor f1, Functor f) => f (f1 a) -> f (f1 Char)
twiceLifted = (fmap . fmap) replaceWithP

-- Making it more specific
twiceLifted' :: [Maybe [Char]] -> [Maybe Char]
twiceLifted' = twiceLifted

thriceLifted ::(Functor f2, Functor f1, Functor f) => f (f1 (f2 a)) -> f (f1 (f2 Char))
thriceLifted = (fmap . fmap . fmap) replaceWithP
-- More specific or "concrete"
thriceLifted' :: [Maybe [Char]] -> [Maybe [Char]]
thriceLifted' = thriceLifted

pain :: IO ()
pain = do
  putStr "replaceWithP' lms: "
  print (replaceWithP' lms)
  putStr "liftedReplace lms: "
  print (liftedReplace lms)
  putStr "liftedReplace' lms:  "
  print (liftedReplace' lms)
  putStr "twiceLifted lms:     "
  print (twiceLifted lms)
  putStr "twiceLifted' lms:    "
  print (twiceLifted' lms)
  putStr "thriceLifted lms:    "
  print (thriceLifted lms)
  putStr "thriceLifted' lms:   "
  print (thriceLifted' lms)


a :: [Int]
a = fmap (+1) $ (read "[1]" :: [Int])

b :: Maybe [[Char]]
b = (fmap.fmap) (++ "lol") (Just ["Hi,", "Hello"])

c :: Integer -> Integer
c = fmap (*2) (\x -> x - 2)

cr :: Integer
cr = c 1

d :: Integer -> [Char]
d = fmap ((return '1' ++) . show) (\x -> [x, 1..3])
dr :: [Char]
dr = d 0

e :: IO Integer
e = let ioi = readIO "1" :: IO Integer
        changed = fmap (read . ("123" ++) . show) ioi
    in fmap (*3) changed

-- p 1006

data Two a b = Two a b deriving (Eq, Show)

instance Functor (Two a) where
  fmap f (Two a b) = Two a (f b)

data Or a b = First a | Second b deriving (Eq, Show)

instance Functor (Or a) where
  fmap _ (First a) = First a
  fmap f (Second b) = Second (f b)

functorIdentity :: (Functor f, Eq (f a)) => f a -> Bool
functorIdentity f = fmap id f == f

functorCompose :: (Eq (f c), Functor f) => (a -> b) -> (b -> c) -> f a-> Bool
functorCompose f g x = (fmap g (fmap f x)) == (fmap (g . f) x)

-- p 1014
newtype Identity a = Identity a deriving (Show, Eq)

instance Functor Identity where
  fmap f (Identity a) = Identity (f  a)

--
data Pair a = Pair a a

instance Functor Pair where
  fmap f (Pair a b) = Pair (f a) (f b)

--data Two a b = Two a b
data Three a b c = Three a b c

instance Functor (Three a b) where
  fmap f (Three a b c) = Three a b (f c)

---
data Three' a b = Three' a b b

instance Functor (Three' a) where
  fmap f (Three' a b b') = Three' a (f b) (f b')

---
data Four a b c d = Four a b c d

instance Functor (Four a b c) where
  fmap f  (Four a b c d) = Four a b c (f d)

data Four' a b = Four' a a a b

instance Functor (Four' a) where
  fmap f (Four' a a' a'' b) = Four' a a' a'' (f b)

-- Not possible, because there is only structure, no content
data Trivial = Trivial


-- p 1020
data Possibly a = LolNope | Yeppers a deriving (Eq, Show)
instance Functor Possibly where
  fmap _ LolNope = LolNope
  fmap f (Yeppers a) = Yeppers (f a)

data Sum a b = Fst a | Snd b deriving (Eq, Show)
instance Functor (Sum a) where
  fmap _  (Fst a) = Fst a
  fmap f  (Snd b) = Snd (f b)


-- p 1043

data Quant a b = Finance | Desk a | Bloor b

instance Functor (Quant a) where
  fmap _ Finance = Finance
  fmap _ (Desk a)  = Desk a
  fmap f (Bloor b) = Bloor (f b)

---

data K a b = K a

instance Functor (K a) where
  fmap _ (K a) = K a

---

newtype Flip f a b = Flip (f b a) deriving (Eq, Show)

instance Functor (Flip K a) where
  fmap f (Flip (K b)) = Flip (K (f b))

---
data EvilGoateeConst a b = GoatyConst b

instance Functor (EvilGoateeConst a) where
 fmap f (GoatyConst b) = GoatyConst (f b)

---
data LiftItOut f a = LiftItOut (f a)

instance Functor f => Functor (LiftItOut f) where
 fmap f (LiftItOut fa) = LiftItOut (fmap f fa)

---
data Parappa f g a = DaWrappa (f a) (g a)

instance (Functor f, Functor g) => Functor (Parappa f g) where
 fmap f (DaWrappa fa ga) = DaWrappa (fmap f fa ) (fmap f ga )

---
data IgnoreOne f g a b = IgnoringSomething (f a) (g b)
instance (Functor g) => Functor (IgnoreOne f g a) where
  fmap f (IgnoringSomething fa gb) = IgnoringSomething fa (fmap f gb)

---

data Notorious g o a t = Notorious (g o) (g a) (g t)
instance Functor g => Functor (Notorious g o a) where
  fmap f (Notorious go ga gt) = Notorious go ga (fmap f gt)

---
data List a = Nil | Cons a (List a)
instance Functor List where
 fmap _ Nil  = Nil
 fmap f (Cons a as ) = Cons (f a) (fmap f as)

---
data GoatLord a = NoGoat | OneGoat a | MoreGoats (GoatLord a) (GoatLord a) (GoatLord a)
instance Functor GoatLord where
 fmap _ NoGoat = NoGoat
 fmap f (OneGoat a) = OneGoat (f a)
 fmap f (MoreGoats a b c) = MoreGoats (fmap f a) (fmap f b) (fmap f c)

---
data TalkToMe a = Halt | Print String a | Read (String -> a)
instance Functor TalkToMe where
 fmap _ Halt = Halt
 fmap f (Print s a) = Print s (f a)
 fmap f (Read g) = Read (f . g)

instance Show a => Show (TalkToMe a) where
  show Halt = "Halt"
  show (Print s a) = "Print " ++ s ++ " " ++ show a
  show (Read _) = "Read sry"

appendOk :: String -> String
appendOk = (++ " Ok")

appendWorld :: String -> String
appendWorld = (++ " World")

blub :: TalkToMe String
blub = fmap appendWorld (Read appendOk)

accesss :: TalkToMe t -> String -> t
accesss (Read x) = x

result :: String
result = accesss blub "here we go"