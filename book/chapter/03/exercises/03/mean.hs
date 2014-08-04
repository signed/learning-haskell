-- Write a function that computes the mean of a list, i.e., the sum of all elements in the list divided by its length.
-- (You may need to use the fromIntegral function to convert the length of the list from an integer into a floating-point number.)

theSum :: [Double] -> Double
theSum []                 =  0.0
theSum (element:elements) = element + theSum elements

theMean :: [Double] -> Double
theMean elements = (theSum elements) / fromIntegral( length(elements))