euler3 = go 2 600851475143
  where
    go cand num
      | cand == num            = [num]
      | cand `isFactorOf` num = cand : go cand (num `div` cand)
      | otherwise             = go (cand + 1) num

isFactorOf a b = b `mod` a == 0
