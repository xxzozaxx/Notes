module FindShortest where


find_shortest :: String -> Integer
find_shortest str = toInteger $ foldl1 min $ map length  $ words str
