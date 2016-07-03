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
--import Control.Proxy
import Pipes
import Pipes.Core(respond, request)
import Pipes.Safe
import Pipes.Tutorial
--import Control.Proxy.Safe hiding (readFileS)

import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as B8
import System.Directory (readable, getPermissions, doesDirectoryExist)
import System.FilePath ((</>), takeFileName)
import System.Posix.Directory (DirStream, openDirStream, closeDirStream, readDirStream)
import System.IO (openFile, hClose, IOMode(ReadMode), hIsEOF)

import qualified Filesystem.Path.CurrentOS as F
import J2s.Scanner.Token
import Text.Show


-- --------------------------------------------------------------------------------------------------------------------
-- Pipe
--contents
--       :: MonadSafe m => FilePath ->() -> Proxy (Exception p) FilePath SafeT ()
--     :: (MonadSafe p)
--     => FilePath -> () -> Producer (Exception p) FilePath SafeT ()
contents path () = do
     canRead <- liftIO $ fmap readable $ getPermissions path
     when canRead $ bracket ( liftIO $ openDirStream path) (liftIO . closeDirStream) $ \dirp -> do
         let loop = do
                 file <- liftIO $ readDirStream dirp
                 case file of
                     [] -> return ()
                     _  -> do
                         respond (path </> file)
                         loop
         loop

--contentsRecursive
--     :: (MonadSafe p)
--     => FilePath -> () -> Producer (Exception p) FilePath SafeT ()
--contentsRecursive path () = loop path
--   where
--     loop path = do
--         contents path () </> \newPath -> do
--             respond newPath
--             isDir <- liftIO $ doesDirectoryExist newPath
--             let isChild = not $ takeFileName newPath `elem` [".", ".."]
--             when (isDir && isChild) $ loop newPath

--readFileS
--    ::  MonadSafe p
--    => Int -> FilePath -> () -> Producer (Exception p) B.ByteString SafeT ()
--readFileS chunkSize path () =
--    bracket id (openFile path ReadMode) hClose $ \handle -> do
--        let loop = do
--                eof <- liftIO $ hIsEOF handle
--                unless eof $ do
--                    bs <- liftIO $ B.hGetSome handle chunkSize
--                    respond bs
--                    loop
--        loop

-- firstLine :: (Proxy p) => () -> Consumer p B.ByteString IO ()
firstLine () = loop
  where
    loop = do
        bs <- request ()
        let (prefix, suffix) = B8.span  (/= '\n') bs
        lift $ B8.putStr prefix
        if (B.null suffix) then loop else lift $ B8.putStr (B8.pack "\n")


--allContent :: (Proxy p) => () -> Consumer p B.ByteString IO ()
--allContent :: (Proxy p, Show a) => () -> Consumer p B.ByteString IO () r
allContent () = loop
  where
    loop = do
        bs <- request ()
        lift $ B8.putStr bs


--applyScanner :: (Proxy p) => String ->  Consumer p B.ByteString IO ()
applyScanner path = loop
  where
    loop = do
        bs <- request ()
        let sc = tokenToByteString (classify (B8.unpack bs) (initPos path))
        lift $ putStrLn ("Opening file --------------------------------------------------------------- " ++ path)
        lift $ putStrLn ("LO QUE SE LEE ES *********************************************  " ++ (B8.unpack bs))
        lift $ B8.putStrLn sc
        lift $ putStrLn ("Closing file  ---------------------------------------------------------------  " ++ path)


--applyParser :: (Proxy p) => String -> Consumer p B.ByteString IO ()
--applyParser path = runEffect loop
--  where
--    loop = do
--        bs <- request ()
--        let sc = (classify (B8.unpack bs) (initPos path))
--        let res = parseIO pOrmj sc
--        lift $  B8.putStrLn (B8.pack (show res))


-- ((B8.pack (show ormj)) B8.append (B8.pack " ") B8.append (B8.pack str) B8.append (B8.pack "\t") B8.append (B8.pack pos) B8.append (B8.pack "\n")))
tokenToByteString :: [Token] -> B.ByteString
tokenToByteString ls = foldl (\x (Token ormj str pos) ->
                        B8.append x ( B8.pack ((show ormj) ++ "\t" ++ str ++ "\t" ++ (show pos) ++ "\n")  )) B8.empty ls

-- ormjToByteString :: IO Ormj -> B.ByteString
-- ormjToByteString ls =  B8.pack (show ls)
-- ormjToByteStrng ls = foldl (\x (Ormj ormj str pos) ->
--                       B8.append x ( B8.pack ((show ormj) ++ "\t" ++ str ++ "\t" ++ (show pos) ++ "\n")  )) B8.empty (ls :: [])


--handler :: (MonadSafe p) => FilePath -> Session (Exception p) SafeT ()
--handler path = do
--    canRead <- liftIO $ fmap readable $ getPermissions path
--    isDir   <- liftIO $ doesDirectoryExist path
--    isValidExtension <- liftIO $ evaluate ((snd (splitExtension path) == ".java") && (snd (splitFileName path) /= "EncodeTest.java") && (snd (splitFileName path) /= "T6302184.java") && (snd (splitFileName path) /= "Unmappable.java"))
--    when (not isDir && canRead && isValidExtension) $
--        (readFileS 10240 path >-> liftIO . applyScanner) path

--handlerParser :: (MonadSafe p) => FilePath -> Session (Exception p) SafeT ()
--handlerParser path = do
--    canRead <- liftIO $ fmap readable $ getPermissions path
--    isDir   <- liftIO $ doesDirectoryExist path
--    isValidExtension <- liftIO $ evaluate ((snd (splitExtension path) == ".java" ) && (snd (splitFileName path) /= "EncodeTest.java") && (snd (splitFileName path) /= "T6302184.java") && (snd (splitFileName path) /= "Unmappable.java"))
--    when (not isDir && canRead && isValidExtension) $
--        (readFileS 10240 path >-> liftIO . applyParser) path


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
                else if ((snd (splitExtension path) == ".java") && (snd (splitFileName path) /= "EncodeTest.java") && (snd (splitFileName path) /= "T6302184.java")  && (snd (splitFileName path) /= "Unmappable.java"))
                        then return [path]
                        else return []
        return (concat paths)



-- recursiveContentsScanner :: FilePath -> IO[FilePath]
--recursiveContentsParser topdir = do
--        names <- getDirectoryContents topdir
--        let properNames = filter (`notElem` [".","..", "Scanner"]) names
--        paths <- forM properNames $ \name -> do
--          let path = topdir </> name
--          isDirectory <- doesDirectoryExist path
--          if isDirectory
--                then recursiveContentsParser  path
--                else if ((snd (splitExtension path) == ".java") && (snd (splitFileName path) /= "EncodeTest.java") && (snd (splitFileName path) /= "T6302184.java") && (snd (splitFileName path) /= "Unmappable.java"))
--                        then
--                            do
--                                reading <- readFile path
--                                let sel = classify reading (initPos path)
--                                res <- parseIO pOrmj sel
--                                return [show res]
--                        else    return []
--        return (concat paths)


recursiveContentsScanner topdir = do
        names <- getDirectoryContents topdir
        let properNames = filter (`notElem` [".",".."]) names
        paths <- forM properNames $ \name -> do
          let path = topdir </> name
          isDirectory <- doesDirectoryExist path
          if isDirectory
                then recursiveContentsScanner path
                else if ((snd (splitExtension path) == ".java") && (snd (splitFileName path) /= "EncodeTest.java") && (snd (splitFileName path) /= "T6302184.java") && (snd (splitFileName path) /= "Unmappable.java"))
                        then return [path]
                        else return []
        return (concat paths)
