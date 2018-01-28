module Chapter15 where

import Data.Maybe
import Data.Monoid

data Optional a = Nada | Only a deriving (Eq, Show)

-- p 914
instance Monoid a => Monoid (Optional a) where
  mempty = Nada
  Nada `mappend` Nada = Nada
  Only v `mappend` Nada = Only v
  Nada `mappend` Only w = Only w
  (Only v) `mappend` (Only w) = Only (v `mappend` w)



-- Mad Lips p 924
type Verb = String
type Adjective = String
type Adverb = String
type Noun = String
type Exclamation = String
madlibbin' :: Exclamation
           -> Adverb
           -> Noun
           -> Adjective
           -> String
madlibbin' e adv noun   adj =
 e <> "! he said " <> adv <> " as he jumped into his car " <> noun <> " and drove off with his " <> adj <> " wife."


madlibbinBetter' :: Exclamation
                 -> Adverb
                 -> Noun
                 -> Adjective
                 -> String
madlibbinBetter' e adv noun adj =  mconcat [e ,"! he said ", adv, " as he jumped into his car ", noun , " and drove off with his ",adj, " wife."]

-- p 934 Maybe another monoid

newtype First' a = First' { getFirst' :: Optional a } deriving (Eq, Show)

instance Monoid (First' a) where
 mempty = First' Nada
 mappend (First' (Only l)) _ = First' (Only l)
 mappend (First' Nada) r = r

firstMappend :: First' a -> First' a -> First' a
firstMappend = mappend

type FirstMappend =
     First' String
  -> First' String
  -> First' String
  -> Bool
type FstId =
  First' String -> Bool