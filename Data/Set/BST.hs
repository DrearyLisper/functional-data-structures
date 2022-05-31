{-# Language InstanceSigs #-}
module Data.Set.BST where

import Data.Set.Types

data BST e 
    = Null
    | Node e (BST e) (BST e)

instance Set BST where
    empty :: Ord e => BST e
    empty = empty'

    add = undefined
    remove = undefined
    contains = undefined

empty' :: Ord e => BST e
empty' = Null