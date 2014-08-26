# Data.List

# lists with elements of type a
- __elem__ Checks if an element is part of a list

        3 `elem` [1,2,4,8]    
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

# lists with elements of type Boolean

- __and__ && all elements of the list and returns the result
- __or__ || all elements of the list and returns the result
