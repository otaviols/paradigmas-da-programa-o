maximoLocal :: [Int] -> [Int]
maximoLocal x:y:z:xs
  |y>x && y>z =y : maximoLocal (z:xs)
  |otherwise=maximolocal (y:z:xs)
maximoLocal _=[]
