--Write a function splitWith that acts similarly to words but takes a predicate and a list of any type,
--and then splits its input list on every element for which the predicate returns False:

splitWith :: (a -> Bool) -> [a] -> [[a]]

splitWith _ []          = []
splitWith predicate elements = let (notmatched, rest) = break predicate elements
                                   internal = case rest of
                                                  ([])     -> []
                                                  (_ : []) -> []
                                                  (_ : xs) -> splitWith predicate xs
                               in
                                   if null notmatched
                                   then internal
                                   else notmatched:internal

