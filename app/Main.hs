module Main where

import Day1 (d1P1, d1P2)
import Day2 (d2P1)

yeet :: (Show a) => String -> a -> String
yeet str other = str ++ " " ++ show other

main :: IO ()
main = do
  d1 <- d1P1 "input/day_one.txt"
  print (yeet "Day 1, Part 1 Result:" d1)
  d1_2 <- d1P2 "input/day_one.txt"
  print (yeet "Day 1, Part 2 Result:" d1_2)
  d2_1 <- d2P1 "input/day_two.txt"
  print (yeet "Day 2, Part 1 Result:" d2_1)



