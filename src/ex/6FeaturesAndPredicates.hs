-- Exercise 1
data Thing = R | S | T | U | V | W | X | Y | Z
  deriving (Eq, Show)
things :: [Thing]
things = [R, S, T, U, V, W, X, Y, Z]

type Predicate u = u -> Bool

isSmall :: Predicate Thing
isSmall x = x `elem` [R, S, V, X]

isBig :: Predicate Thing
isBig x = not (isSmall x)

isDisc :: Predicate Thing
isDisc x = x `elem` [R, U, Y, Z]

isTriangle :: Predicate Thing
isTriangle x = not (isDisc x)

isWhite :: Predicate Thing
isWhite x = x `elem` [U, V]

isBlack :: Predicate Thing
isBlack x = x `elem` [T, X, Z]

isGrey :: Predicate Thing
isGrey x = not (isWhite x || isBlack x)

a, b, c, d :: Bool
a = and [isWhite x | x <- things, isSmall x && isDisc x]
b = or [not (isDisc x) | x <- things, isGrey x]
c = and [isGrey x || isBlack x | x <-things, isBig x, isTriangle x]
d = or [not (isBig x) | x <- things, isGrey x, isTriangle x]
