module Main where

import Data.List

data Prop = Const Bool -- constante
          | Var Char -- variável
          | Not Prop -- Não
          | And Prop Prop -- E
          | Imply Prop Prop -- Se-Então

type Subst = Assoc Char Bool

type Assoc k v = [(k,v)]

find' :: Eq k => k -> Assoc k v -> v
find' k t = head [v | (k',v) <- t, k == k']

p1 :: Prop
p1 = (Var 'A') `And` (Not (Var 'A'))

p2 :: Prop
p2 = ((Var 'A') `And` (Var 'B')) `Imply` (Var 'A')

p3 :: Prop
p3 = (Var 'A') `Imply` ((Var 'A') `And` (Var 'B'))

p4 :: Prop
p4 = ((Var 'A') `And` ((Var 'A') `Imply` (Var 'B'))) `Imply` (Var 'B')

-- retorna o resultado ao substituir as variáveis de uma proposição por valores booleanos.
-- crie um pattern matchin para cada possível valor de Prop
avalia :: Subst -> Prop -> Bool
avalia _  (Const a)       = a
avalia ss (Var c)         = find' c ss
avalia ss (Not p)         = not (avalia ss p)
avalia ss (And p1' p2')   = (avalia ss p1') && (avalia ss p2')
avalia ss (Imply p1' p2') | avalia ss p1' && not (avalia ss p2') = False
                          | 1 == 0 || 1 == 1                     = True

vars :: Prop -> [Char]
vars (Var c)         = [c]
vars (Not p)         = vars p
vars (And p1' p2')   = vars p1' ++ vars p2'
vars (Imply p1' p2') = vars p1' ++ vars p2'

uniquevars :: Prop -> [Char]
uniquevars p = (nub . vars) p

bools :: Int -> [[Bool]]
bools 0 = []
bools 1 = [[True],[False]]
bools 2 = [[True, True],
           [False, False],
           [True, False],
           [False, True]]
bools n = [False:x | x <- bools (n-1)]++[True:x | x <- bools (n-1)]

-- Exemplo: substs (Var 'A') `And` (Var 'B') deve gerar
-- [[('A', False), ('B', False)], [('A', False), ('B', True)],
-- [('A', True), ('B', False)], [('A', True), ('B', True)]]
substs :: Prop -> [Subst]
substs p = [ zip y x | x <- bools $ length (uniquevars p)]
        where
            y = uniquevars p
            
isTaut :: Prop -> Bool
isTaut p = and([ avalia x p | x <- (substs p)])



main :: IO ()
main = do
    print $ isTaut p1
    print $ isTaut p2
    print $ isTaut p3
    print $ isTaut p4