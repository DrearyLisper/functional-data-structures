module Main where

import Data.Types
import Data.Heap.Leftist

main :: IO ()
main = print $ push 1 (empty :: (LeftistHeap Int))
