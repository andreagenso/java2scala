module Main where

import J2s.Scanner
import qualified AG.Sintax as AGS
import System.Environment

--import Data.Set
import Data.Maybe
import Text.Printf
import System.IO
import System.Environment
import System.Posix.Temp

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
-- main =
--     do
--     putStrLn " Import result AG is .....  "
--     print (show testJ2s)
main = do
       g <- readJavaFile
       let conv = testJ2s
       writeScalaFile [conv]

readJavaFile = do
        [s] <- getArgs
        g   <- readFile s
        return g

writeScalaFile content = do
        (t,h) <- mkstemp "MyFile.scala"
        mapM_ (hPutStrLn h) content
        hClose h
        printf "%d writing scala file  '%s'\n" (length content) t