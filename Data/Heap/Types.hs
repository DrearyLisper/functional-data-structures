module Data.Heap.Types (Heap(..)) where

class Heap h where
    empty :: Ord e => h e
    push :: Ord e => h e -> e -> h e
    pop :: Ord e => h e -> h e
    peek :: h e -> e
