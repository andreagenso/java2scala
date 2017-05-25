module J2s.Scanner.Token where

import J2s.Scanner.Position
import UU.Scanner.Position

{- Data types -}
data Token = Token J2sSc SimCode Pos

{- Tokens -}
data J2sSc = Identifier
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
           | Error
           deriving (Eq,Ord)

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