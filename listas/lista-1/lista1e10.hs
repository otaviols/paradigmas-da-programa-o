co :: (b -> c) -> (a -> b) -> a ->c
co x y z=x $y z
