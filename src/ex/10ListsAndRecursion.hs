oddsRec :: [Int] -> [Int]
oddsRec [] = []
oddsRec (x:xs) = [k | k <-[x], odd k] ++ oddsRec xs
