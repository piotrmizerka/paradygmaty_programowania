-- this classes is prepared based on: https://learnyouahaskell.github.io/chapters.html

foldlExample1 :: (Num a) => [a] -> a
foldlExample1 x = foldl (-) 0 x

foldlExample2 :: (Num a) => [a] -> a
foldlExample2 = foldl (-) 0

foldlExample3 :: (Num a) => [a] -> a
foldlExample3 x = foldl (-) (head x) (tail x)

foldlExample4 :: (Num a) => [a] -> a
foldlExample4 = foldl1 (-)

-- TODO: dokoncz implenetacje funkcji obliczajacej wartosc wyrazenia w notacji odwrotnej polskiej (Reverse Polish Notation)
-- Uwzglednij dzialania: +, -, *, /
solveRPN :: (Num a, Read a) => String -> a  
solveRPN = TODO
    where   TODO 
            foldingFunction xs numberString = read numberString:xs  