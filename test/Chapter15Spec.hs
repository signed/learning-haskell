module Chapter15Spec where

import Test.Hspec
import Test.Hspec.Checkers
import Test.QuickCheck
import Test.QuickCheck.Classes
import Test.QuickCheck.Checkers
import Chapter15
import Data.Monoid(Sum)

--
--main :: IO ()
--main = 'hspec' spec
--
--spec :: Spec
--spec = do
--  'testBatch' ('monoid' (undefined :: [Int]))

optionalGenerator :: Arbitrary a => Gen (Optional a)
optionalGenerator = do
  v <- arbitrary
  elements [Nada, Only v]

instance Arbitrary a => Arbitrary (Optional a) where
  arbitrary = optionalGenerator

instance Eq a => EqProp (Optional a) where
  (=-=) = eq

firstGenerator :: Arbitrary a =>  Gen(First' a)
firstGenerator = do
   variant <- arbitrary
   frequency [(99,return (First' variant)), (1,return (First' Nada))]

instance Arbitrary a => Arbitrary (First' a) where
  arbitrary = firstGenerator

instance Eq a => EqProp (First' a) where
  (=-=) = eq

spec :: Spec
spec = do
  describe "Two Integers" $ do
    it "is equal if both integers match" $
      1 `shouldBe` 1
    it "is not equal if the first integers do not match" $
      2 `shouldBe` 2

  testBatch (monoid (undefined :: [Int]))
  testBatch (monoid (undefined :: (Optional (Sum Int))))
  testBatch (monoid (undefined :: (First' String)))

