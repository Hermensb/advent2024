module Day1 where

import Data.List (sort)
import FileRead (getWordLines)

space :: [Integer] -> [Integer] -> [Integer]
space x y = [abv i | i <- zip (sort x) (sort y)]

abv :: (Integer, Integer) -> Integer
abv z = abs (uncurry (-) z)

total :: [Integer] -> [Integer] -> Integer
total x y = sum (space x y)

wordLineToIntegers :: [String] -> [Integer]
wordLineToIntegers x = [read i :: Integer | i <- x]

wordLinesToIntegers :: [[String]] -> [[Integer]]
wordLinesToIntegers x = [wordLineToIntegers i | i <- x]

toPairs :: [[Integer]] -> [(Integer, Integer)]
toPairs input = [(x!!0, x!!1) | x <- input]

dayOnePartOne :: String -> IO Integer
dayOnePartOne inpStr = do
  lns <- getWordLines inpStr
  let ints = wordLinesToIntegers lns
  let pairs =  toPairs ints
  let lsts =  unzip pairs
  return (uncurry total lsts)
