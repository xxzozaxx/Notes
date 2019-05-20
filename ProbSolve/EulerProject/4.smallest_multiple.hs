-- first we need to generate all prime number
{- I think that, the smallest positive number that is evenly divisible by all of the numbers from 1 to 20
   is just the multiples of all prime number till 20-}

primes :: [Integer]
primes = sieve (2 : [3, 5..])
  where
    sieve (p:xs) = p : sieve [x | x <- xs, x `mod` p > 0]

-- ourprime = [2,3,5,7,11,13,17,19]
ourprime = [2,3,5,7]
