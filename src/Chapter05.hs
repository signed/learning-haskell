module Chapter05  where

f_205_1 :: a -> a -> a -> a
f_205_1 = undefined

g_205_2 :: a -> b -> c -> b
g_205_2 = undefined

h_205_3 :: (Num a, Num b) => a -> b -> b
h_205_3 = undefined

h_206_4 :: (Num a, Num b) => a -> b -> b
h_206_4 = undefined

jackal_206 :: (Ord a, Eq b) => a -> b -> a
jackal_206 = undefined

kessel_206 :: (Ord a, Num b) => a -> b -> a
kessel_206 = undefined


_213_2_1 :: a -> a -> a
_213_2_1 x y = x

_213_2_2 :: a -> a -> a
_213_2_2 x y = y

-- there can be only one implementation that returns b
_213_3 :: a -> b -> b
_213_3 x y = y

-- 219 type inference
_219_f :: Num a => a -> a -> a
_219_f x y = x+y+3


myConcat x = x ++ " yo"

myMult x = (x / 3) * 5

myTake x = take x "hey you"

myCom x = x > (length [1..10])

myAlph x = x < 'z'



functionH :: [a] -> a
functionH (x:_) = x

functionC :: Ord a => a -> a -> Bool
functionC x y =
   if (x > y) then True else False

functionS :: (a,b) -> b
functionS (x, y) = y

myFunc :: (x -> y) -> (y -> z) -> c-> (a, x) -> (a, z)
myFunc xToY yToZ _ (a, x) = (a, yToZ $ xToY x)

i :: a -> a
i x = x

c :: a -> b -> a
c a b = a

c' :: a -> b -> b
c' a b = b

r :: [a] -> [a]
-- r x = reverse x
-- r x = x
r x = tail x

co :: (b -> c) -> (a -> b) -> a -> c
co bToC aToB a = bToC $ aToB a

a :: (a -> c) -> a -> a
a _ a = a

a' :: (a -> b) -> a -> b
a' aToB a = aToB a


data Woot
data Blah
f :: Woot -> Blah
f = undefined
g :: (Blah, Woot) -> (Blah, Blah)
g (x,y)= (x, x)


f1 :: Int -> String
f1 = undefined
g1 :: String -> Char
g1 = undefined
h :: Int -> Char
h i = g1 $ f1 i


data A
data B
data C

q :: A -> B
q = undefined

w :: B -> C
w = undefined

e :: A -> C
e a = w $ q a


data X
data Y
data Z
xz :: X -> Z
xz = undefined

yz :: Y -> Z
yz = undefined

xform :: (X, Y) -> (Z, Z)
xform (x,y) = (xz x, yz y)

munge :: (x -> y) -> (y -> (w, z))-> x -> w
munge xToY yToWZ x = fst $ yToWZ $ xToY x
