module FileRead where

import Paths_advent2024 (getDataFileName)

getLines :: String -> IO [String]
getLines x = do
  fileHandle <- getDataFileName x
  contents <- readFile fileHandle
  return (lines contents)

linesToWords :: [String] -> [[String]]
linesToWords x = [words y | y <- x]

getWordLines :: String -> IO [[String]]
getWordLines x = do
  lns <- getLines x
  return (linesToWords lns)

wordLineToIntegers :: [String] -> [Integer]
wordLineToIntegers x = [read i :: Integer | i <- x]

wordLinesToIntegers :: [[String]] -> [[Integer]]
wordLinesToIntegers x = [wordLineToIntegers i | i <- x]
