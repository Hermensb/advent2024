{-# LANGUAGE TupleSections #-}

module Day1 (dayOnePartOne, dayOnePartTwo) where

import Data.List (sort)
import FileRead (getWordLines)
import Data.Map (fromListWith, member, Map, (!))

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
countInts x = fromListWith (+) (map (, 1) x)

getCount :: Integer -> Map Integer Integer -> Integer
getCount i counts
  | member i counts = counts!i
  | otherwise = 0

getSimilarity :: [Integer] -> Map Integer Integer -> Integer
getSimilarity lst counts = sum [x * (getCount x counts) | x <- lst]

dayOnePartTwo :: String -> IO Integer
dayOnePartTwo inpStr = do
  lsts <- toListInts inpStr
  let counts = countInts (snd lsts)
  return (getSimilarity (fst lsts) counts)
