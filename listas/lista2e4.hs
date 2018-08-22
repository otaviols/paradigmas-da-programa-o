produtoEscalar :: Num a => [a] -> [a] -> a
produtoEscalar x y=sum [(fst a)*(snd a)| a<- zip x y]

