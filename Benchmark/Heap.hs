{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE AllowAmbiguousTypes #-}
module Benchmark.Heap where

import Data.Heap.Utils
import Data.Heap.Types
import Data.Heap.Leftist
import Data.Heap.Naive
import Benchmark.Utils
import System.TimeIt ( timeItT )
import Control.Monad (replicateM, forM)

push_ :: Heap h => Int -> IO (h Integer, Integer)
push_ n = do
    elements <- randomInput n
    let heap = fromList elements
    return (heap, peek heap)


time' :: IO a -> IO Double
time' m = do
    times <- replicateM 3 (fst <$> timeItT m)
    return $ sum times / fromIntegral (length times)

report :: forall h. Heap h => Int -> IO [Double]
report n = forM (take n $ iterate (*2) 1024) $ time' . push_ @h
