module J2s.Scanner.Generic where

import J2s.Scanner.Token
import Data.Char
                                
-- Generic Functions

{- verify a token init with a firts Simbol of comment, that may be /*, //, --, %%, #, for Block Comments or Line Comments
   verify a token init with a firts Simbol of SpecialSimbol , that may be <%, , , ., ;, etc.
   verify equal for operators
-}

isToken :: SimCode -> IniSimbol -> Bool
isToken scode       is = is == (take (length is) scode )

-- takeToken token []     = error ("In the process of verify the token exist, but don't exist at the moment of separed tokens!, review the scanner, This case do not be exist (no deberia existir) ")
takeToken :: SimCode -> [Tok] -> Tok
takeToken scode (o:op) | isToken scode o = o
                                           | otherwise       = takeToken scode op

-- Return True if a Character is a part of rule of identifier                     
isIdentifier' :: Char -> Bool                     
isIdentifier' c = ('_' == c) || (isAlphaNum c) || ('$' == c)