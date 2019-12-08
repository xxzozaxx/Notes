import Data.Char

--------------------------------------------- # Data
type Name = String

data Date = Date Int Int Int
data Anniversary = Birthday Name Date       -- name, year, month, day
                 | Wedding Name Name Date   -- Names, year, month, day

-- Simple functions
dobMe x = x + x
-- dobUs x y = x*2 + y*2
dobUs x y = dobMe x + dobMe y

dobSmallNum x =
    ( if x > 100
    then x
    else x*2) + 1

---  local var
-- Heron's formula
heron a b c = sqrt ( s * ( s - a ) * ( s - b ) * ( s - c ))
  where
    s = ( a + b + c ) / 2

triangleArea a b c = res
  where
    res = heron a b c

--------------------------------------------- # simple string func
capitalize :: String -> String
capitalize st =
  unwords (map capword (words st))
  where capword [] = []
        capword (x:xs) = toUpper x : xs

---------------------------------------------- # Guards
mySig x
  | x < 0     = -1
  | x > 0     = 1
  | otherwise = 0

describeLetter :: Char -> String
describeLetter c
  | c >= 'a' && c <= 'z' = "Lower Case"
  | c >= 'A' && c <= 'Z' = "Upper Case"
  | otherwise = "Not an Ascii"

--------------------------------------------- # simple guess
sGuess num =
  do
    putStrLn "Guess a number"
    inp <- getLine
    case compare (read inp) num of
      LT -> putStrLn "Too low!" >> sGuess num
      GT -> putStrLn "Too high" >> sGuess num
      EQ -> putStrLn "You win"

------------------------------------------------- # Eclid's
euc :: Int -> Int -> Int
euc x 0 = x
euc x y = euc y (rem x y)

------------------------------------------------- # test
