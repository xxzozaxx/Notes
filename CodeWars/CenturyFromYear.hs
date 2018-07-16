module Century where

century::Int -> Int
century year =
  let
    mayCentury = div year  100 -- it just abstract
  in
    if year `mod` 100 == 0 then mayCentury -- if it start of century like 1900 then return 19
    else  mayCentury + 1
