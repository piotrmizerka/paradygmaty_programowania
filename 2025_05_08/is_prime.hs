isPrime :: Int -> Bool
isPrime n
  | n <= 1    = False
  | otherwise = null [ x | x <- [2..(floor . sqrt $ fromIntegral n)], n `mod` x == 0 ]
