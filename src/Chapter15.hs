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

newtype Mem s a = Mem {
 runMem :: s -> (a,s) }

instance Monoid a => Monoid (Mem s a) where
 mempty = Mem $ \s -> (mempty, s)
 mappend (Mem f) (Mem g) = Mem $ \s -> let (a1, s1) = f s
                                           (a2, s2) = g s1
                                       in (a1 <> a2, s2)


f' = Mem $ \s -> ("hi", s + 1)
g' = Mem $ \s -> (" world", s * 5)
h' = Mem $ \s -> (" !", s + 2)

main = do
  print $ runMem (f' `mappend` (g' `mappend`h')) 5
  print $ runMem ((f' `mappend` g') `mappend`h') 5
  print $ runMem (mempty `mappend` h') 5
  print $ runMem (h' `mappend` mempty) 5
  print $ runMem h' 5
