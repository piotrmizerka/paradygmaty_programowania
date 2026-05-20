f :: Int -> Int
f n
    | n == 0 = 0
    | n == 1 = 1
    | otherwise = f (n-2) + f (n-1)