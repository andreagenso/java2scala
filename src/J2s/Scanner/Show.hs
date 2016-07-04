module J2s.Scanner.Show where

import J2s.Scanner.Token

-- Result Structure
instance Show Token where 
        show (Token j2s str pos) = show j2s ++ " " ++ show str ++ "\t" ++ show pos ++ "\n"

-- Name of Result Structure
instance Show J2sSc where
        show Identifier                          = "Identifier        : "
        show KeyWord                             = "KeyWord           : "
        show SpecialSimbol                   = "Special Simbol    : " 
        show BooleanLiteral                  = "Boolean Literal   : "
        show CharacterLiteral                = "Character Literal : " 
        show StringLiteral                           = "String Literal    : "   
        show Operator                            = "Operator          : "
        show LineComment                     = "Line Comment      : "
        show BlockComment                    = "Block Comment     : "
        show DecimalIntegerLiteral           = "Integer Literal Decimal: "
        show HexIntegerLiteral               = "Integer Literal Hex    : "
        show OctalIntegerLiteral             = "Integer Literal Octal  : "
        show DecimalFloatingPointLiteral     = "Floating Literal Decimal     : "
        show HexadecimalFloatingPointLiteral = "Floating Literal Hexadecimal: "
        show NullLiteral                     = "Null Literal      : "
        show TokMayor                                            = "TOK MAYOR         : "
        show Error                                       = "Error             : "
        
--      show (IntegerLiteral il)  = "Integer Literal " ++ show il
--      show (FloatingLiteral fl) = "Floating Literal " ++ show fl
{-
instance Show IntLiteral where
        show DecimalIntegerLiteral = "Decimal :" 
        show HexIntegerLiteral     = "Hex     :"
        show OctalIntegerLiteral   = "Octal   :"
        
instance Show FloatLiteral where
        show DecimalFloatingPointLiteral     = "Decimal  :"
        show HexadecimalFloatingPointLiteral = "Hexadecimal  :"
-}      