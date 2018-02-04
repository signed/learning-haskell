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


a = fmap (+1) $ (read "[1]" :: [Int])
b = (fmap.fmap) (++ "lol") (Just ["Hi,", "Hello"])
c = fmap (*2) (\x -> x - 2)
cr = c 1

d = fmap ((return '1' ++) . show) (\x -> [x, 1..3])
dr = d 0

e :: IO Integer
e = let ioi = readIO "1" :: IO Integer
        changed = fmap (read . ("123" ++) . show) ioi
    in fmap (*3) changed