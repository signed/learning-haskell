import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import Chapter04(changeMood, Mood(..), ownNot)

main :: IO ()
main = hspec $
  describe "Prelude.head" $ do

    it "returns the first element of a list" $
      head [23 ..] `shouldBe` (23 :: Int)

    it "returns the first element of an *arbitrary* list" $
      property $ \x xs -> head (x:xs) == (x :: Int)

    it "throws an exception if used with an empty list" $
      evaluate (head []) `shouldThrow` anyException

    it "come one" $
       ownNot False `shouldBe`  True

    it "mood changes from " $
      changeMood Woot `shouldBe` Blah

    it "mood changes from " $
      changeMood Blah `shouldBe` Woot
