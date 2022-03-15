import Test.QuickCheck
import Data.Char

-- Exercise 2
reverse' :: [Int] -> [Int]
reverse' [] = []
reverse' (x:xs) = reverse xs ++ [x]

reverse'_prop1 :: [Int] -> Bool
reverse'_prop1 xs = reverse (reverse xs) == xs

reverse'_prop2 :: [Int] -> Bool
reverse'_prop2 xs = reverse xs == reverse' xs

-- Exercise 3
max3 :: Int -> Int -> Int -> Int
max3 a b c 
  | a>=b && a>=c = a
  | b>=a && b>=c = b
  | otherwise    = c

max3_prop :: Int -> Int -> Int -> Bool
max3_prop a b c = max3 a b c >= max  a (max b c)
  
-- Exercise 4
add_prop :: Int -> Int -> Bool
add_prop m n = m + n == n + m

mult_prop :: Int -> Int -> Bool
mult_prop m n = m * n == n * m

int_prop1 :: Int -> Int -> Bool
int_prop1 m n = (m + n) - n == m

int_prop2 :: Int -> Int -> Bool
int_prop2 m n = div (m * n) n == m -- quickCheck fails on (0, 0)

-- Exercise 5
type Line = (Float, Float)

intersect :: Line -> Line -> (Float, Float)
intersect (a, b) (a', b') = (x, a * x + b)
  where x = (b' - b) / (a - a')

intersect_prop :: Line -> Line -> Property
intersect_prop l m =
  (fst l) /= (fst m) && (snd l) /= (snd m) ==>
    snd (intersect l m) == fst l * (fst (intersect l m)) + snd l &&
    snd (intersect l m) == fst m * (fst (intersect l m)) + snd m

-- Exercise 6
capitalize :: String -> String
capitalize ""     = ""
capitalize (c:cs) = (toUpper c) : cs

capitalize_prop :: String -> Property
capitalize_prop (c:cs) =
  isAlpha c ==>
    isUpper (head (capitalize (c:cs)))

