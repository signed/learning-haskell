--Define a tree type that has only one constructor, like our Java example.
--Instead of the Empty constructor, use the Maybe type to refer to a node’s children.

data Tree a =   Node a (Tree a) (Tree a)
              | Empty
               deriving (Show)

data MaybeTree a = MaybeNode a (Maybe (MaybeTree a)) (Maybe (MaybeTree a))
                   deriving (Show)