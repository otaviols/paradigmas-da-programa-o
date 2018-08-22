module Main where 
import Data.List 
votos :: [String]
votos = ["Vermelho", "Azul", "Verde", "Azul", "Azul", "Vermelho"] 
votosRanks :: [[String]] 
votosRanks = [["Vermelho", "Verde"], ["Azul"], ["Verde", "Vermelho", "Azul"], ["Azul", "Verde", "Vermelho"], ["Verde"]] 
main :: IO () 
main = do
  print $ vencedor votos 
  print $ vencedor votosRanks 


conta :: Eq a => a -> [a] -> Int
conta _ []=0
conta a (x:xs)
  |a==x =1+ conta a xs
  |otherwise=conta a xs

unicos :: Eq a => [a] -> [a]
unicos []=[]
unicos xs=[a| a<- xs, conta a xs ==1]

resultado :: Ord a => [a] -> [(Int,a)]
resultado []=[]
resultado (x:xs)=sort ((conta x (x:xs), x) : (resultado (filter (/= x) (x:xs))))


vencedor :: Ord a => [a] -> a
vencedor []=error "lista vazia"
vencedor xs=snd $last $resultado xs


rmvazio :: Eq a => [[a]] -> [[a]]
rmvazio [[]]=[[]]
rmvazio xss=filter (/= []) xss

elimina :: Eq a => a -> [[a]] -> [[a]]
elimina _ [[]]=[[]]
elimina e xss=[[x| x<- xs, x /=e] | xs<- xss]

rank :: Ord a => [[a]] -> [a] 
rank [[]]=[]
rank xss=[snd $head $resultado xs| xs<- xss]
