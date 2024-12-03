{-# LANGUAGE TupleSections #-}

module Day1 (dayOnePartOne, dayOnePartTwo) where

import Data.List (sort)
import FileRead (getWordLines)
import Data.Map (fromListWith, Map)

space :: [Integer] -> [Integer] -> [Integer]
space x y = [abv i | i <- zip (sort x) (sort y)]

abv :: (Integer, Integer) -> Integer
abv z = abs (uncurry (-) z)

totalDistance :: [Integer] -> [Integer] -> Integer
totalDistance x y = sum (space x y)

wordLineToIntegers :: [String] -> [Integer]
wordLineToIntegers x = [read i :: Integer | i <- x]

wordLinesToIntegers :: [[String]] -> [[Integer]]
wordLinesToIntegers x = [wordLineToIntegers i | i <- x]

toPairs :: [[Integer]] -> [(Integer, Integer)]
toPairs input = [(head x, x!!1) | x <- input]

toListInts :: String -> IO ([Integer], [Integer])
toListInts inpStr = do
  lns <- getWordLines inpStr
  let ints = wordLinesToIntegers lns
  let pairs =  toPairs ints
  return (unzip pairs)


dayOnePartOne :: String -> IO Integer
dayOnePartOne inpStr = do
  lsts <- toListInts inpStr
  return (uncurry totalDistance lsts)

countInts :: [Integer] -> Map Integer Integer
countInts x = fromListWith (+) ( map (, 1) x)

dayOnePartTwo :: String -> IO (Map Integer Integer)
dayOnePartTwo inpStr = do
  lsts <- toListInts inpStr
  return (countInts (snd lsts))
