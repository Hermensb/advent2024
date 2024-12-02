module Public (someFunc, total) where

import Day1 (compound)


someFunc :: IO ()
someFunc = putStrLn "someFunc"

total :: [Integer] -> [Integer] -> Integer
total x y = sum (compound x y)
