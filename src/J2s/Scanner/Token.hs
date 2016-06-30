module J2s.Scanner.Token where

import J2s.Scanner.Position
import UU.Scanner.Position
-- import Text.ParserCombinators.UU.Core
-- import Text.ParserCombinators.UU.BasicInstances
            
{- Data types -}
data Token = Token OrmjSc SimCode Pos

{- Tokens -}
data OrmjSc = Identifier
           | KeyWord
           | SpecialSimbol
           | BooleanLiteral
           | CharacterLiteral
           | StringLiteral
           | Operator
           | LineComment
           | BlockComment
           | DecimalIntegerLiteral
           | HexIntegerLiteral
           | OctalIntegerLiteral
           | DecimalFloatingPointLiteral
           | HexadecimalFloatingPointLiteral
           | NullLiteral
           | TokMayor
           | Error
           deriving (Eq,Ord)

{-         
data IntLiteral = DecimalIntegerLiteral
              | HexIntegerLiteral
              | OctalIntegerLiteral
              deriving (Eq,Ord)

data FloatLiteral = DecimalFloatingPointLiteral
               | HexadecimalFloatingPointLiteral
              deriving (Eq,Ord)
 -}            
{- Sinonimous Type -}
type Tokens        = [Token]
type KeyWord       = String
type SpecialSimbol = String
type Constant      = String
type Operator      = String

type File          = String
type Code          = String
type SimCode       = String
type Comment       = String 
type IniSimbol     = String 
type Tok           = String        