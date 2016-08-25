module Content where

import Control.Monad(forM, liftM)
import System.Directory (doesDirectoryExist, getDirectoryContents)
import System.FilePath ((</>), splitExtension, splitFileName)
import Control.Exception(evaluate)
import J2s.Scanner
import J2s.Parser
import J2s.Ast.Sintax
import J2s.Scanner.Position
import UU.Scanner.Position
import UU.Parsing

import Control.Monad (when, unless)
import Control.Proxy
import Control.Proxy.Safe hiding (readFileS)

import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as B8
import System.Directory (readable, getPermissions, doesDirectoryExist)
import System.FilePath ((</>), takeFileName)
import System.Posix (openDirStream, readDirStream, closeDirStream)
import System.IO (openFile, hClose, IOMode(ReadMode), hIsEOF)

import J2s.Scanner.Token
import Text.Show


import UU.Parsing

import J2s.Ast.Sintax
import J2s.Scanner
import J2s.Ast.Semantic
import J2s.Integration.ScannerParser

import UU.Scanner.Position


-- --------------------------------------------------------------------------------------------------------------------
-- Pipe
contents
     :: (CheckP p)
     => FilePath -> () -> Producer (ExceptionP p) FilePath SafeIO ()
contents path () = do
     canRead <- tryIO $ fmap readable $ getPermissions path
     when canRead $ bracket id (openDirStream path) closeDirStream $ \dirp -> do
         let loop = do
                 file <- tryIO $ readDirStream dirp
                 case file of
                     [] -> return ()
                     _  -> do
                         respond (path </> file)
                         loop
         loop

contentsRecursive
     :: (CheckP p)
     => FilePath -> () -> Producer (ExceptionP p) FilePath SafeIO ()
contentsRecursive path () = loop path
   where
     loop path = do
         contents path () //> \newPath -> do
             respond newPath
             isDir <- tryIO $ doesDirectoryExist newPath
             let isChild = not $ takeFileName newPath `elem` [".", ".."]
             when (isDir && isChild) $ loop newPath

readFileS
    :: (CheckP p)
    => Int -> FilePath -> () -> Producer (ExceptionP p) B.ByteString SafeIO ()
readFileS chunkSize path () =
    bracket id (openFile path ReadMode) hClose $ \handle -> do
        let loop = do
                eof <- tryIO $ hIsEOF handle
                unless eof $ do
                    bs <- tryIO $ B.hGetSome handle chunkSize
                    respond bs
                    loop
        loop


readFileSP
    :: (CheckP p)
    => Int -> FilePath -> () -> Producer (ExceptionP p) B.ByteString SafeIO ()
readFileSP chunkSize path () =
    bracket id (openFile path ReadMode) hClose $ \handle -> do
        let loop = do
                eof <- tryIO $ hIsEOF handle
                unless eof $ do
                    bs <- tryIO $ B.hGetSome handle chunkSize
                    respond bs
                    loop
        loop


firstLine :: (Proxy p) => () -> Consumer p B.ByteString IO ()
firstLine () = runIdentityP loop
  where
    loop = do
        bs <- request ()
        let (prefix, suffix) = B8.span  (/= '\n') bs
        lift $ B8.putStr prefix
        if (B.null suffix) then loop else lift $ B8.putStr (B8.pack "\n")


allContent :: (Proxy p) => () -> Consumer p B.ByteString IO ()
allContent () = runIdentityP loop
  where
    loop = do
        bs <- request ()
        lift $ B8.putStr bs


applyScanner :: (Proxy p) => String ->  Consumer p B.ByteString IO ()
applyScanner path = runIdentityP loop
  where
    loop = do
        bs <- request ()
        let sc = tokenToByteString (classify (initPos path)(B8.unpack bs))
        lift $ putStrLn ("Opening file --------------------------------------------------------------- " ++ path)
        lift $ putStrLn ("LO QUE SE LEE ES *********************************************  " ++ (B8.unpack bs))
        lift $ B8.putStrLn sc
        lift $ putStrLn ("Closing file  ---------------------------------------------------------------  " ++ path)

applyParser :: Proxy p => String -> Consumer p B.ByteString IO ()
applyParser path = runIdentityP loop
  where
    loop = do
        bs <- request ()
        lift $ putStrLn ("Opening file --------------------------------------------------------------- " ++ path)
        lift $ putStrLn ("LO QUE SE LEE ES *********************************************  " ++ (B8.unpack bs))
        let sc = classify  (initPos path) (B8.unpack bs)
        lift $ B8.putStrLn =<< tokensParserToByteString sc
        lift $ putStrLn ("Closing file  ---------------------------------------------------------------  " ++ path)

tokensParserToByteString :: [Token] -> IO B.ByteString
tokensParserToByteString tokens = fmap (B8.pack . show) $ parseIO pJ2s tokens

tokenToByteString :: [Token] -> B.ByteString
tokenToByteString ls = foldl (\x (Token ormj str pos) ->
                        B8.append x ( B8.pack ((show ormj) ++ "\t" ++ str ++ "\t" ++ (show pos) ++ "\n")  )) B8.empty ls

handler :: (CheckP p) => FilePath -> Session (ExceptionP p) SafeIO ()
handler path = do
    canRead <- tryIO $ fmap readable $ getPermissions path
    isDir   <- tryIO $ doesDirectoryExist path
    isValidExtension <- tryIO $ evaluate ((snd (splitExtension path) == ".java" || snd (splitExtension path) == ".mora") && (snd (splitFileName path) /= "EncodeTest.java") && (snd (splitFileName path) /= "T6302184.java") && (snd (splitFileName path) /= "Unmappable.java"))
    when (not isDir && canRead && isValidExtension) $
        (readFileS 10240 path >-> try . applyScanner) path

handlerParser :: (CheckP p) => FilePath -> Session (ExceptionP p) SafeIO ()
handlerParser path = do
    canRead <- tryIO $ fmap readable $ getPermissions path
    isDir   <- tryIO $ doesDirectoryExist path
    isValidExtension <- tryIO $ evaluate ((snd (splitExtension path) == ".java" || snd (splitExtension path) == ".mora") && (snd (splitFileName path) /= "EncodeTest.java") && (snd (splitFileName path) /= "T6302184.java") && (snd (splitFileName path) /= "Unmappable.java"))
    when (not isDir && canRead && isValidExtension) $
        (readFileSP 10240 path >-> try . applyParser) path

------------------------------------------------------------------------------------------------------------------------


getRecursiveContents :: FilePath -> IO[FilePath]
getRecursiveContents topdir = do
        names <- getDirectoryContents topdir
        let properNames = filter (`notElem` [".",".."]) names
        paths <- forM properNames $ \name -> do
          let path = topdir </> name
          isDirectory <- doesDirectoryExist path
          if isDirectory
                then getRecursiveContents path
                else if ((snd (splitExtension path) == ".java" || snd (splitExtension path) == ".mora") && (snd (splitFileName path) /= "EncodeTest.java") && (snd (splitFileName path) /= "T6302184.java")  && (snd (splitFileName path) /= "Unmappable.java"))
                        then return [path]
                        else return []
        return (concat paths)



-- recursiveContentsScanner :: FilePath -> IO[FilePath]
recursiveContentsParser topdir = do
        names <- getDirectoryContents topdir
        let properNames = filter (`notElem` [".","..", "Scanner"]) names
        paths <- forM properNames $ \name -> do
          let path = topdir </> name
          isDirectory <- doesDirectoryExist path
          if isDirectory
                then recursiveContentsParser  path
                else if ((snd (splitExtension path) == ".java" || snd (splitExtension path) == ".mora") && (snd (splitFileName path) /= "EncodeTest.java") && (snd (splitFileName path) /= "T6302184.java") && (snd (splitFileName path) /= "Unmappable.java"))
                        then
                            do
                                reading <- readFile path
                                let sel = classify (initPos path) reading
                                res <- parseIO pJ2s sel
                                return [show res]
                        else    return []
        return (concat paths)


recursiveContentsScanner topdir = do
        names <- getDirectoryContents topdir
        let properNames = filter (`notElem` [".",".."]) names
        paths <- forM properNames $ \name -> do
          let path = topdir </> name
          isDirectory <- doesDirectoryExist path
          if isDirectory
                then recursiveContentsScanner path
                else if ((snd (splitExtension path) == ".java" || snd (splitExtension path) == ".mora") && (snd (splitFileName path) /= "EncodeTest.java") && (snd (splitFileName path) /= "T6302184.java") && (snd (splitFileName path) /= "Unmappable.java"))
                        then return [path]
                        else return []
        return (concat paths)