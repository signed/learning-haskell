module Chapter08Spec where

import Chapter08
import Test.Hspec

spec :: Spec
spec =
  describe "divide by" $ do
    it "two possitive numbers" $
      dividedBy 7 7 `shouldBe` Result (1, 0)
    it "division by zero" $
      dividedBy 7 0 `shouldBe` DividedByZero
    it "negative denominator" $
      dividedBy 7 (-7)  `shouldBe` Result (-1, 0)
    it "negative quotient" $
      dividedBy (-7) 7  `shouldBe` Result (-1, 0)
    it "both negative" $
      dividedBy (-7) (-7)  `shouldBe` Result (1, 0)
