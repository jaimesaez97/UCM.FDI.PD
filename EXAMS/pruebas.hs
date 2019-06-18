data ASec a b = Vacio | C a (ASec a b) | D b (ASec a b)

nelem:: (Eq c, Num c) => c -> ASec a b -> a 
nelem 0 (C a (y))       = a
nelem n y               = nelem (n-1) y

separa:: ASec a b -> ([a],[b])
separa Vacio            = ([],[])         


instance Eq ASec a b where
    C a xs == C a' xs'      = a == a' && xs == xs'