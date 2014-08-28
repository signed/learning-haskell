# Data.List

# lists with elements of type a
- __elem__ Checks if an element is part of a list

        3 `elem` [1,2,4,8]
- __notElem__ Checks if an element is not part of the list           
- __isPrefixOf__

        "foo" `isPrefixOf` "foobar"
- __isInfixOf__
 
        "needle" `isInfixOf` "haystack full of needle thingies"
- __isSuffixOf__
 
        "end" `isSuffixOf` "the end"
- __null__ checks if a list is empty
- __length__ returns the length of a list
- __head__ first element of a list
- __tail__ all but the head of a list
- __last__ the last element of a list
- __init__ all but the last of a list
- __++__ append on list to another
- __concat__ joins a list of lists into a single list
- __reverse__ reverses the content of a list
- __all__ evaluate predicate for each element in the list
- __any__ evaluate predicate until one matches else false
- __take__ the first n elements of the list
- __drop__ remove the first n elements of the list
- __splitAt__ return a tuple of two lists (n elemnts, n+1 end)
- __takeWhile__
- __dropWhile__
- __span__
- __break__
- __foldl__ aggregate from head to tail __DO NOT USE THIS__ use __Data.List.foldl'__  instead
- __foldr__ aggregate from tail to head

# lists with elements of type Boolean

- __and__ && all elements of the list and returns the result
- __or__ || all elements of the list and returns the result
