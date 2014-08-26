Type Names have to start with a capital letter
components of a type are roughly equal to fields in java

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