Type Names have to start with a capital letter
components of a type are roughly equal to fields in java

# Well known type
- __Int__ machine integers, with guaranteed range at least -2^29 to 2^29 - 1
- __Integer__ arbitrary range integers
- __Double__
- __Char__  a single character
- __String__ as alias for  [Char]

# Int vs. Integer
Int is the type of machine integers, with guaranteed range at least
-2^29 to 2^29 - 1, while Integer is arbitrary precision integers, with
range as large as you have memory for.


# Declaring a new Algebraic Data Type

* similar to enums


      data TypeConstructor = ValueConstructor Int String
multiple value constructors are separated by |

    data Boolean = True | False
# pattern matching

* _ is the wildcard character

# Type aliases

    type Title = String
# Maybe Type

    data Maybe a = Nothing | Just a