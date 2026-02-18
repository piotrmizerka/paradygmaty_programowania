module Tree where

import qualified Data.Tree as DT  -- kwalifikowany import

-- Definicja drzewa binarnego
data Tree a = Empty
            | Node a (Tree a) (Tree a)
            deriving (Show, Eq)

-- treeDepth: oblicza głębokość drzewa
treeDepth :: Tree a -> Int
treeDepth Empty               = 0
treeDepth (Node _ left right) = 1 + max (treeDepth left) (treeDepth right)

-- insertBST: wstawia element do drzewa BST
insertBST :: Ord a => a -> Tree a -> Tree a
insertBST x Empty = Node x Empty Empty
insertBST x (Node y left right)
  | x <= y    = Node y (insertBST x left) right
  | otherwise = Node y left (insertBST x right)

-- buildTree: pomocnicza funkcja, buduje drzewo z listy
buildTree :: Ord a => [a] -> Tree a
buildTree = foldl (flip insertBST) Empty

-- preorder: zwraca listę elementów w porządku preorder
preorder :: Tree a -> [a]
preorder Empty               = []
preorder (Node x left right) = x : preorder left ++ preorder right

-- toDataTree: konwersja z naszego Tree a do DT.Tree String
toDataTree :: Show a => Tree a -> DT.Tree String
toDataTree Empty = DT.Node "<empty>" []
toDataTree (Node x l r) =
  DT.Node (show x) (child r ++ child l)
  where
    child Empty = []
    child t     = [ toDataTree t ]

-- parseInput: zamienia wejście na listę Int
parseInput :: String -> [Int]
parseInput = map read . words

-- main: interakcja z użytkownikiem
main :: IO ()
main = do
  putStrLn "Zadanie 2: Drzewo BST, głębokość, preorder i wizualizacja"
  putStrLn "Podaj liczby oddzielone spacjami (np. 5 3 7 2 4 6):"
  line <- getLine
  let nums = parseInput line
      tree = buildTree nums
  putStrLn $ "\nGłębokość drzewa: " ++ show (treeDepth tree)
  putStrLn $ "Preorder: " ++ unwords (map show (preorder tree))
  putStrLn "\nWizualizacja drzewa:"
  putStrLn $ DT.drawTree (toDataTree tree)
