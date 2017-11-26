-- Add a type signature for your function to your sourcefile.
-- To test it, load the source file into ghci again.
theLength :: [a] -> Int
theLength (element:elements) = 1 + theLength elements
theLength []                 = 0