--Write your own “safe” definitions of the standard partial list functions,
--but make sure they never fail. As a hint, you might want to consider using the following types:
-- file: ch04/ch04.exercises.hs
safeHead :: [a] -> Maybe a

safeHead []      = Nothing
safeHead element = Just (head element)

safeTail :: [a] -> Maybe [a]

safeTail []        = Nothing
safeTail elements  = Just (tail elements)

safeLast :: [a] -> Maybe a

safeLast []       = Nothing
safeLast elements = Just(last elements)

safeInit :: [a] -> Maybe [a]

safeInit []       = Nothing
safeInit elements = Just(init elements)