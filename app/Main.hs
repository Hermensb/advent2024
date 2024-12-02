module Main where

import Public (total)

main :: IO ()
main = do
  putStrLn "Hello, Haskell!"
  print (total [3,2,1] [6,5,4])


