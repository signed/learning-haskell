module Chapter11 where
import Data.Char(toUpper)

data Price = Price Integer deriving (Eq, Show)

data Manufacturer =
 Mini
 | Mazda
 | Tata
 deriving (Eq, Show)

data Airline = PapuAir | CatapultsR'Us | TakeYourChancesUnited deriving (Eq, Show)


data Vehicle = Car Manufacturer Price
 | Plane Airline
 deriving (Eq, Show)


isCar :: Vehicle -> Bool
isCar (Car _ _) = True
isCar _ = False

isPlane :: Vehicle -> Bool
isPlane (Plane _) = True
isPlane _ = False

areCars :: [Vehicle] -> [Bool]
areCars = map (isCar)


myCar = Car Mini (Price 14000)
urCar = Car Mazda (Price 20000)
clownCar = Car Tata (Price 7000)
doge = Plane PapuAir



data BinaryTree a =   Leaf
                    | Node (BinaryTree a) a (BinaryTree a)
                    deriving (Eq, Ord, Show)

insert' :: Ord a => a -> BinaryTree a -> BinaryTree a
insert' b Leaf = Node Leaf b Leaf
insert' b (Node left a right)
  | b == a = Node left a right
  | b<a = Node(insert' b left) a right
  | b>a = Node left a(insert' b right)


map' :: (a -> b) -> BinaryTree a -> BinaryTree b
map' _ Leaf = Leaf
map' f (Node lhs value rhs) = Node (map' f lhs) (f value) (map' f rhs)

isSubseqOf :: (Eq a) => [a] -> [a] -> Bool
isSubseqOf [] _ = True
isSubseqOf _ [] = False
isSubseqOf xa@(x:xs) ya@(y:ys)
 | x /= y  = isSubseqOf xa ys
 | x == y = isSubseqOf xs ys


capitalizeWords :: String-> [(String, String)]
capitalizeWords input = map (\word -> (word, capitalize word)) (words input) where
  capitalize :: String -> String
  capitalize = map toUpper