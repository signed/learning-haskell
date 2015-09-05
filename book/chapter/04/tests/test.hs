import Test.Tasty
import Test.Tasty.SmallCheck as SC
import Test.Tasty.QuickCheck as QC
import Test.Tasty.HUnit
import Test.HUnit.Tools (assertRaises)

import Data.List
import Data.Ord
import Exercises.Page97.E02.IntParse (asInt_fold)

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "Tests" [unitTests]

properties :: TestTree
properties = testGroup "Properties" []

unitTests = testGroup "Unit tests"
  [ testCase "parse positive numbers (Acceptance Criteria 1)" $
      asInt_fold "101" @?= 101
  , testCase "parse positive numbers (Acceptance Criteria 2)" $
      asInt_fold "1798" @?= 1798
  , testCase "parse negative numbers" $
        asInt_fold "-31337" @?= negate(31337)
  , testCase "empty string should raise error" $
        asInt_fold "" @?= 0
  , testCase "empty string should raise error 2nd atempt" $
          "exception" @!= (asInt_fold "")
  , testCase "single - should be zero" $
        asInt_fold "-" @?= 0
  , testCase "double values should be rejected" $
        asInt_fold "3.1" @?= 0
  ]

  -- assertError "Negative argument raises an error" "Invalid Input" (pos (-1))