--Using the command framework from the earlier section “ASimpleCommand-Line Framework” on page 71,
--write a program that prints the first word of each line of its input.
import System.Environment (getArgs)

interactWith function inputFile  = do
  input <- readFile inputFile
  function input

main = mainWith myFunction
  where mainWith function = do
          args <- getArgs
          case args of
            [input] -> interactWith myFunction input
            _ -> putStrLn "error: exactly one arguments needed"
        -- replace "id" with the name of our function below
        myFunction = id