penultimo :: [a] -> a
penultimo [] = error "lista vazia"
penultimo [x] = error "Lista unitária"
penultimo xs =head (drop ((length xs)-2) xs)
