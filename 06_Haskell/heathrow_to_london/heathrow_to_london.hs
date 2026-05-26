-- Heathrow to London from here: https://learnyouahaskell.github.io/functionally-solving-problems.html

import System.IO

-- TODO: napisz obliczajacy optymalna sciezke (ograniczenia wg opisu na stronie wyzej), uwzjgledniajac ponizsze:

-- "Optimization tip: when we do priceA = sum $ map snd pathA, we’re calculating the price from the path on every step. 
--  We wouldn’t have to do that if we implemented roadStep as a (Path, Path, Int, Int) -> Section -> (Path, Path, Int, Int) 
--  function where the integers represent the best price on A and B.""

main :: IO ()
main = do
    hSetBuffering stdin LineBuffering

    putStrLn "Podawaj liczby, pusta linia konczy:"

    input <- loop []

    let threes = groupsOf 3 (map read input)
        roadSystem = map (\[a,b,c] -> Section a b c) threes
        path = optimalPath roadSystem
        pathString = concat $ map (show . fst) path
        pathPrice = sum $ map snd path

    putStrLn $ "The best path to take is: " ++ pathString
    putStrLn $ "The price is: " ++ show pathPrice


loop :: [String] -> IO [String]
loop acc = do
    line <- getLine
    if null line
        then return (reverse acc)
        else loop (line : acc)