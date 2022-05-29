{-# Language InstanceSigs #-}
module Data.Heap.Leftist where

import Data.Types 

data LeftistHeap e 
    = EmptyHeap
    | HeapNode Int e (LeftistHeap e) (LeftistHeap e)
    deriving (Show)

instance Heap LeftistHeap where
    empty :: LeftistHeap e
    empty = empty'

    push :: Ord e => e -> LeftistHeap e -> LeftistHeap e
    push = push'

empty' :: LeftistHeap e
empty' = EmptyHeap

push' :: Ord e => e -> LeftistHeap e -> LeftistHeap e
push' e EmptyHeap = HeapNode 1 e EmptyHeap EmptyHeap