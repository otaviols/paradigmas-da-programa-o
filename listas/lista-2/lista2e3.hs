divisores :: Int -> [Int]
divisores x=[a| a<- [1..(quot x 2)], mod x a ==0]

perfeito :: Int -> Bool
perfeito x=sum (divisores x)==x


perfeitos :: Int -> [Int]
perfeitos x=[a| a<- [1..x], perfeito a]
