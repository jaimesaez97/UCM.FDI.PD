reversee:: Eq a => [a] -> [a]
reversee xs = foldr (\b c -> c ++ [b]) [] xs

reverse2:: Eq a => [a] -> [a]
reverse2 = foldl (flip (:)) []


