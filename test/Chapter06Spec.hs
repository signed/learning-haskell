module Chapter06Spec where

import Test.Hspec
import Chapter06(TwoIntegers(..), EitherOr(..))

type EitherOrTest = EitherOr String String

spec :: Spec
spec = do
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

  describe "EitherOr" $ do
    context "Hello" $ do
      it "is equal if both arguments are equal" $
        (Hello "one" :: EitherOrTest) `shouldBe` (Hello "one" :: EitherOrTest)
      it "is not equal if both arguments are not equal" $
        (Hello "one" :: EitherOrTest) `shouldNotBe` (Hello "two" :: EitherOrTest)

    context "Goodbye" $ do
      it "is equal if both arguments are equal" $
        (Goodbye "one" :: EitherOrTest) `shouldBe` (Goodbye "one" :: EitherOrTest)
      it "is not equal if both arguments are not equal" $
        (Goodbye "one" :: EitherOrTest) `shouldNotBe` (Goodbye "two" :: EitherOrTest)

    it "Hello and Goodbye are never equal" $ do
      let recipient = "same"
      (Hello recipient :: EitherOrTest) `shouldNotBe` (Goodbye recipient :: EitherOrTest)
