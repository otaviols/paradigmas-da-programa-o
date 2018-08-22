palindromo :: [Int] -> Bool
palindromo [] = True
palindromo [x] = True
palindromo ns
  |head ns == last ns = palindromo $tail $init ns
  |otherwise = False
