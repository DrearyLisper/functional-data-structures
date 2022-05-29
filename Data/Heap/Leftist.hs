{-# Language InstanceSigs #-}
module Data.Heap.Leftist (LeftistHeap(..)) where

import Data.Types 

data LeftistHeap e 
    = EmptyHeap
    | HeapNode Int e (LeftistHeap e) (LeftistHeap e)
    deriving (Show)

instance Heap LeftistHeap where
    empty :: LeftistHeap e
    empty = empty'

    push :: Ord e => LeftistHeap e -> e -> LeftistHeap e
    push = push'

    pop :: Ord e => LeftistHeap e -> LeftistHeap e
    pop = pop'

    peek :: LeftistHeap e -> e
    peek = peek'

merge :: Ord e => LeftistHeap e -> LeftistHeap e -> LeftistHeap e
merge h EmptyHeap = h
merge EmptyHeap h = h
merge h1@(HeapNode _ e1 l1 r1) h2@(HeapNode _ e2 l2 r2)
    | e1 <= e2  = makeHeap e1 l1 (merge r1 h2)
    | otherwise = makeHeap e2 l2 (merge r2 h1)

rank :: LeftistHeap e -> Int
rank EmptyHeap = 0
rank (HeapNode r _ _ _) = r

makeHeap :: e -> LeftistHeap e -> LeftistHeap e -> LeftistHeap e
makeHeap e l r
    | lr >= rr  = HeapNode (rr + 1) e l r
    | otherwise = HeapNode (lr + 1) e r l
    where
        lr = rank l
        rr = rank r

empty' :: LeftistHeap e
empty' = EmptyHeap

push' :: Ord e => LeftistHeap e -> e -> LeftistHeap e
push' h e = merge h (HeapNode 1 e EmptyHeap EmptyHeap) 

peek' :: LeftistHeap e -> e
peek' EmptyHeap = error "Cannot peek a top element of empty heap"
peek' (HeapNode _ e _ _) = e

pop' :: Ord e => LeftistHeap e -> LeftistHeap e
pop' EmptyHeap = error "Cannot pop from empty heap"
pop' (HeapNode _ _ l r) = merge l r