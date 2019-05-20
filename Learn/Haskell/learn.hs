dobMe x = x + x
-- dobUs x y = x*2 + y*2
dobUs x y = dobMe x + dobMe y

dobSmallNum x =
    ( if x > 100
    then x
    else x*2) + 1
