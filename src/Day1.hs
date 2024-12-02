module Day1 where

import Data.List (sort)
import FileRead

space :: [Integer] -> [Integer] -> [Integer]
space x y = [abv i | i <- zip (sort x) (sort y)]

abv :: (Integer, Integer) -> Integer
abv z = abs (uncurry (-) z)

total :: [Integer] -> [Integer] -> Integer
total x y = sum (space x y)
