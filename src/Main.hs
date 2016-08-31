module Main where

import J2s.Scanner
import qualified AG.Sintax as AGS

testTree :: AGS.Tree
testTree = AGS.Node (AGS.Tip 1) (AGS.Node (AGS.Tip 2)(AGS.Tip 3))

test :: Int
test = AGS.sem_Tree testTree

-- Para  imports
testJ2sImport :: AGS.J2s
testJ2sImport = AGS.J2s AGS.NilPackageDeclaration
    (AGS.ImportDeclarations (AGS.TypeImportOnDemandDeclaration
        (AGS.PackageOrTypeName "java" (AGS.PackageOrTypeName "lang" (AGS.PackageOrTypeName "reflect"
        (AGS.PackageOrTypeName "Field" AGS.NilPackageOrTypeName))))) AGS.NilImportDeclarations) []


testJ2s :: String
testJ2s = AGS.sem_J2s testJ2sImport

main  :: IO()
main =
     do
     putStrLn " Import result AG is .....  "
     print (show testJ2s)
