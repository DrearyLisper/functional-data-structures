module Data.Types where

class Heap h where
    empty :: Ord e => h e
    push :: Ord e => e -> h e -> h e
    pop :: Ord e => h e -> h e
    peek :: h e -> e

