-- Import of lib for working with lists
import Data.Char

-- Exercise 1
angleVectors :: (Float, Float) -> (Float, Float) -> Float
angleVectors (a, b) (a', b') = acos phi
  where phi = (dotProduct (a, b) (a', b')) / (lengthVector (a, b) * lengthVector (a', b'))

dotProduct :: (Float, Float) -> (Float, Float) -> Float
dotProduct (x, y) (x', y') = x * x' + y * y'

lengthVector :: (Float, Float) -> Float
lengthVector (x, y) = sqrt (dotProduct (x, y) (x, y))

-- Exercise 2
type Line = (Float, Float)

intersect :: Line -> Line -> (Float, Float)
intersect (a, b) (a', b') = (x, a*x + b)
  where x = (b' - b) / (a - a')

-- Exercise 3
halveEvens :: [Int] -> [Int]
halveEvens xs = [div x 2 | x <- xs, mod x 2 == 0]

-- Exercise 4
inRange :: Int -> Int -> [Int] -> [Int]
inRange m n xs = [x | x <- xs, elem x [m..n]]

-- Exercise 5
countPositives :: [Int] -> Int
countPositives xs = length [x | x <- xs, x >= 0]

-- Exercise 6
multDigits :: String -> Int
multDigits xs = product [digitToInt x | x <- xs, isDigit x]

-- Exercise 7
capitalize :: String -> String
capitalize (x:xs) = toUpper x : [toLower x | x <- xs]

-- Exercise 8
complicated :: (Bool, Bool, Bool, Bool) -> Bool
complicated (a, b, c, d) =
  (a && (not b) && (c || (d && b)) || (not b && not a)) && c

-- Exercise 9
crosswordFind :: Char -> Int -> Int -> [String] -> [String]
crosswordFind letter pos len words = [x | x <- words, length x == len,  (x !! pos) == letter]

-- Exercise 10

pythagoreanTriples :: Int -> [(Int, Int, Int)]
pythagoreanTriples n =
  [(a, b, c) | a <- [1..n], b <- [1..n], c <- [1..n], c * c == a * a + b * b]




