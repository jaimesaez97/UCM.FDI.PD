foldr11:: (a -> a -> a) -> [a] -> a
foldr11 f [x]    = x
foldr11 f (x:xs) = f x (foldr11 f xs)