module Main where

import Public (total)

main :: IO ()
main = do
  putStrLn "Hello, Haskell!"
  print (total [1,2,3] [4,5,6])

