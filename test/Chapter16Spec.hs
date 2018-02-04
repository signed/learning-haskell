module Chapter16Spec where

import Test.Hspec -- Hspec
import Test.QuickCheck
import Test.Hspec.Checkers -- Checkers
import Test.QuickCheck.Classes -- Classes
import Test.QuickCheck.Function

import Chapter16

functorCompose' :: (Eq (f c), Functor f) => f a -> Fun a b -> Fun b c -> Bool
functorCompose' x (Fun _ f) (Fun _ g) = (fmap (g . f) x) == (fmap g . fmap f $ x)

type IntToInt = Fun Int Int
type IntFC = [Int] -> IntToInt -> IntToInt -> Bool

--type IdentityToIdentity = Fun Identity Identity
--type IdentityFC = [Identity] -> IdentityToIdentity -> IdentityToIdentity -> Bool

fc' = functorCompose'


main :: IO ()
main = quickCheck (fc' :: IntFC)
--  quickCheck (fc' :: Identity Int)


spec :: Spec
spec =
  describe "Two Integers" $ do
    it "is equal if both integers match" $
      1 `shouldBe` 1
    it "is not equal if the first integers do not match" $
      2 `shouldBe` 2
