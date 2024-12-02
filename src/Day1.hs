module Day1 (compound) where

import Data.List (sort)

compound :: [Integer] -> [Integer] -> [Integer]
compound x y = [abv i | i <- zip (sort x) (sort y)]

abv :: (Integer, Integer) -> Integer
abv z = abs (uncurry (-) z)
