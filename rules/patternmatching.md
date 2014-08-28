
# Guard Clauses
 
     evenize :: Integer -> Integer
     evenize parameter | odd parameter  = paramter + 1
                       | otherwise      = paramter

Add 1 to odd numbers to create even numbers. leave even numbers alone