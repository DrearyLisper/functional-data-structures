module Data.Set.Types (Set(..)) where

class Set s where
    empty :: Ord e => s e
    add :: Ord e => s e -> e -> s e
    remove :: Ord e => s e -> e -> s e
    contains :: Ord e => s e -> e -> Bool

