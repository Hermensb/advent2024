module Main where

import Day1 (dayOnePartOne, dayOnePartTwo)

yeet :: (Show a) => String -> a -> String
yeet str other = str ++ " " ++ show other


main :: IO ()
main = do
  d1 <- dayOnePartOne "input/day_one_part_one.txt"
  print (yeet "Day 1, Part 1 Result:" d1)
  d1_2 <- dayOnePartTwo "input/day_one_part_two.txt"
  print (yeet "Day 1, Part 2 Result:" d1_2)



