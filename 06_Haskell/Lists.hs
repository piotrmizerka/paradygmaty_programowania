-- Lists.hs
-- Zadanie 1: squareList i filterEven na listach Int
-- Aby uruchomić w GHCi:
--   Prelude> :load Lists.hs
--   Prelude> main

module Lists where

import Data.List (intercalate)

-- squareList: podnosi każdy element listy do kwadratu
-- TODO

-- filterEven: wybiera tylko elementy parzyste
-- TODO

-- parseInput: zamienia ciąg znaków na listę Int
-- TODO

-- formatOutput: zamienia listę Int na ciąg znaków do wypisania
-- TODO


main :: IO ()
main = do
  putStrLn "Zadanie 1: squareList i filterEven"
  putStrLn "Podaj liczby oddzielone spacjami (np. 1 2 3 4):"
  line <- getLine
  let nums = parseInput line
  putStrLn $ "Kwadraty elementów: " ++ formatOutput (squareList nums)
  putStrLn $ "Tylko liczby parzyste: " ++ formatOutput (filterEven nums)
