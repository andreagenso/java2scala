module Main where

import J2s.Scanner
import qualified AG.Sintax as AGS

testTree :: AGS.Tree
testTree = AGS.Node (AGS.Tip 1) (AGS.Node (AGS.Tip 2)(AGS.Tip 3))

test :: Int
test = AGS.sem_Tree testTree

main  :: IO()
main =
     do
     putStrLn " integrated with AG ..... !!!! "
     print (show test)
