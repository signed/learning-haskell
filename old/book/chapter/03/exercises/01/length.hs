-- Write a function that computes the number of elements in a list.
-- To test it, ensure that it gives the same answers as the standard length function.
theLength (element:elements) = 1 + theLength elements
theLength []                 = 0