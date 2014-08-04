-- Define a function that joins a list of lists together using a separator value:
intersperse :: a -> [[a]] -> [a]
intersperse _ []  = []
intersperse _ [a] = a
intersperse separator (element:elements) = element ++ [separator] ++ intersperse separator elements