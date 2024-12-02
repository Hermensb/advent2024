module Public (total) where

import Day1
import FileRead

dayOnePartOne :: String -> IO Integer
dayOnePartOne inpStr = do
  lines <- getWordLines inpStr
  data <- wordLinesToIntegers lines

wordLineToIntegers :: [String] -> [Integer]
wordLineToIntegers x = [read i :: Integer | i <- x]

wordLinesToIntegers :: [[String]] -> [[Integer]]
wordLinesToIntegers x = [wordLineToIntegers i | i <- x]



