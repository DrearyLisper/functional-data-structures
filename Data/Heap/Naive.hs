{-# Language InstanceSigs #-}

module Data.Heap.Naive where

import Data.Heap.Types 

newtype NaiveHeap e
    = NaiveHeapT [e] 

instance Heap NaiveHeap where
    empty :: Ord e => NaiveHeap e
    empty = NaiveHeapT []

    push :: Ord e => NaiveHeap e -> e -> NaiveHeap e
    push (NaiveHeapT es) e = NaiveHeapT $ push' es e

    pop :: Ord e => NaiveHeap e -> NaiveHeap e
    pop (NaiveHeapT es) = NaiveHeapT $ tail es

    peek :: NaiveHeap e -> e
    peek (NaiveHeapT es) = head es

push' :: Ord e => [e] -> e -> [e]
push' [] e = [e]
push' (x:xs) e 
    | x > e     = e:x:xs
    | otherwise = x : push' xs e