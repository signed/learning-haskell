import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import Chapter04(changeMood, Mood(..), ownNot, isPalindrome, myAbs, f, lengthPlusOne)

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

    it "ab is not a palindrom" $
      isPalindrome "ab" `shouldBe` False
    it "aba is a palindrom" $
      isPalindrome "aba" `shouldBe` True
    it "positive number stays positive" $
      myAbs 42 `shouldBe` 42
    it "negative number becomes positive" $
      myAbs (-42) `shouldBe` 42
    it "positive number stays positive" $
      myAbs 0 `shouldBe` 0

    it "positive number stays positive" $
      f ((,) 'a' 'b') ((,) 'c' 'd') `shouldBe` (,) ((,) 'b' 'd') ((,) 'a' 'c')

    it "length plus one" $
        lengthPlusOne "12345" `shouldBe` 6