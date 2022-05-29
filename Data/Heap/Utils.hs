module Data.Heap.Utils where

import Data.Types

fromList :: (Foldable t, Ord e, Heap h) => t e -> h e
fromList = foldl push empty