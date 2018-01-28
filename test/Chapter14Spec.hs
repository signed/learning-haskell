module Chapter14Spec where

import Test.Hspec
import Test.QuickCheck
import Chapter14

spec :: Spec
spec = do
  describe "Two Integers" $ do
    it "is equal if both integers match" $
      1 `shouldBe` 1
    it "is not equal if the first integers do not match" $
      2 `shouldBe` 2
  describe "Addition" $ do
    it "1 + 1 is greater than 1" $ do
      (1 + 1) > 1 `shouldBe` True
    it "2 + 2 is equal to 4" $ do
      2 + 2 `shouldBe` 4
    it "x + 1 is always\
      \ greater than x" $ do
      property $ \x -> x + 1 > (x :: Int)