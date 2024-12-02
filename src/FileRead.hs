module FileRead where

import System.IO
import Data.String
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
  lines <- getLines x
  return (linesToWords lines)
