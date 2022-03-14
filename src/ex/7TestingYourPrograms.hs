import Test.QuickCheck

reverse' :: [Int] -> [Int]
reverse' [] = []
reverse' (x:xs) = reverse xs ++ [x]

reverse'_prop1 :: [Int] -> Bool
reverse'_prop1 xs = reverse (reverse xs) == xs

reverse'_prop2 :: [Int] -> Bool
reverse'_prop2 xs = reverse xs == reverse' xs
