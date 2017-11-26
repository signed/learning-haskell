module Hspec where

import Test.Hspec

tests :: IO ()
tests = hspec $ do
  describe "" $ do
    it "example" $ do
        1 `shouldBe' 1
