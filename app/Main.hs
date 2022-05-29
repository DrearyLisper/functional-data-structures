module Main where

import Data.Types
import Data.Heap.Leftist
import Data.Heap.Utils

main :: IO ()
main = print $ peek (fromList [100,99..0] :: LeftistHeap Int)
