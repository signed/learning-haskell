module Chapter08Spec where

import Test.Hspec
import Chapter08

spec :: Spec
spec =
  describe "Two Integers" $ do
    it "placeholder 1" $
      1 `shouldBe` 1
    it "placeholder 2" $
      2 `shouldBe` 2