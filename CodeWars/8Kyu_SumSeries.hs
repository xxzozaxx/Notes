{- NOT MY CODE
   1/1 + 1/4 + 1/7 + 1/10
   1/(1+3n) strart with n=0-}

module Codewars.Kata.NthSeries where

import Text.Printf

series :: [Double]
series = map (1/) [1, 4 ..] -- generate series

seriesSum :: Integer -> String
seriesSum n = printf "%.2f" $ sum $ take (fromInteger n) series
