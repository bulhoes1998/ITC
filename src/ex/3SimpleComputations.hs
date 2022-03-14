-- Exercise 1
root :: Float -> Float -> Float -> Float
root a b c
  | b**2 - 4*a*c>=0 = (-b + sqrt (b**2 - 4*a*c)) / (2 * a)
  | otherwise       = 0 / 0

-- Exercise 2
hour :: Int -> Int
hour n = mod (1 + div n 60) 12

-- Exercise 3
between :: Int -> Int -> Int -> Int
between a b c
  | (a >= minBetween b c) && (a <= maxBetween b c) = a
  | (b >= minBetween a c) && (b <= maxBetween a c) = b
  | (c >= minBetween a b) && (b <= minBetween a b) = c
    where minBetween :: Int -> Int -> Int
          minBetween a b
            | a>=b = b
            | b>=a = a

          maxBetween :: Int -> Int -> Int
          maxBetween a b = - minBetween (-a) (-b)

-- Exercise 4
xor :: Bool -> Bool -> Bool
xor True False = True
xor False True = True
xor _ _        = False

-- Exercise 5
(||) :: Bool -> Bool -> Bool
(||) a b = if a then True else b

(|||) :: Bool -> Bool -> Bool
(|||) a b
  | a == True = a
  | otherwise = b

-- Exercise 6
