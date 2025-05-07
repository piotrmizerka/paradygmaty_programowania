-- Lists.hs
-- Moduł zawierający instrukcje i ścieżki rozwiązania zadania 1
-- Zadanie 1: squareList i filterEven na listach Int
-- Aby uruchomić w GHCi:
--   Prelude> :load Lists.hs
--   Prelude> main

module Lists where

import Data.List (intercalate)

-- squareList: podnosi każdy element listy do kwadratu
squareList :: [Int] -> [Int]
squareList xs = map (^2) xs

-- filterEven: wybiera tylko elementy parzyste
filterEven :: [Int] -> [Int]
filterEven xs = filter even xs

-- parseInput: zamienia ciąg znaków na listę Int
parseInput :: String -> [Int]
parseInput = map read . words

-- formatOutput: zamienia listę Int na ciąg znaków do wypisania
formatOutput :: [Int] -> String
formatOutput xs = intercalate " " (map show xs)

main :: IO ()
main = do
  putStrLn "Zadanie 1: squareList i filterEven"
  putStrLn "Podaj liczby oddzielone spacjami (np. 1 2 3 4):"
  line <- getLine
  let nums = parseInput line
  putStrLn $ "Kwadraty elementów: " ++ formatOutput (squareList nums)
  putStrLn $ "Tylko liczby parzyste: " ++ formatOutput (filterEven nums)
