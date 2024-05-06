module Benchmark.Utils where

import System.Random
import Control.Monad

randomInput :: Int -> IO [Integer] 
randomInput n = replicateM n randomIO