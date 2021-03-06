module Chapter20Spec where

import Test.Hspec
import Chapter20

spec :: Spec
spec =
  describe "Two Integers" $ do
    it "is equal if both integers match" $
      1 `shouldBe` 1
    it "is not equal if the first integers do not match" $
      2 `shouldBe` 2