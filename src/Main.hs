module Main where

import qualified AG.J2SAttrSem as AGS
import System.Environment
import UU.Parsing
import J2s.Parser
import J2s.Scanner
import UU.Scanner.Position
import Data.String.Utils

-- AST generation
{-
main  :: IO()
main = do
       g <- readJavaFile
       putStrLn (show g)

readJavaFile = do
    [path] <- getArgs
    entrada <- readFile path
    let tokens = classify (initPos path) entrada
        nameScalaFile =  replace ".java" ".scala" path
    scalaCode <- parseIO pJ2s tokens
    return scalaCode

-}
-- AG Generation
main  :: IO()
main = do
       g <- readJavaFile
       writeScalaFile (snd g) (fst g)

readJavaFile = do
    [path] <- getArgs
    entrada <- readFile path
    let tokens = classify (initPos path) entrada
        nameScalaFile =  replace ".java" ".scala" path
    scalaCode <- parseIO pJ2s tokens
    return (scalaCode, nameScalaFile)

writeScalaFile nameFile content = do
    writeFile nameFile content
    putStrLn (" Writing scala file " ++ nameFile ++ "..... ")
