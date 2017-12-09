module Chapter06Spec where

import Test.Hspec
import Chapter06(TwoIntegers(..))

spec :: Spec
spec =
  describe "Two Integers" $ do
    it "is equal if both integers match" $ do
      let fst = 1
      let snd = 2
      Two fst snd `shouldBe` Two fst snd
    it "is not equal if the first integers do not match" $ do
      let snd = 1;
      Two 2 snd `shouldNotBe` Two 1 snd
    it "is not equal if the second integers do not match" $ do
      let fst = 1
      Two fst 1 `shouldNotBe` Two fst 2
