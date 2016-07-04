{-# LANGUAGE UndecidableInstances #-}
module J2s.Integration.ScannerParser where

import J2s.Scanner.Token
import UU.Scanner.Position
import UU.Parsing

-- import Text.ParserCombinators.UU.Core
-- import Text.ParserCombinators.UU.BasicInstances
-- import Text.ParserCombinators.UU.Derived
-- import UU.Parsing.Interface

--  INTEGRACION DEL SCANNER CON EL PARSER

-- file debe llevar el path del archivo actual
-- file = ""

instance Eq J2sSc => Eq Token where
  (Token j2s1 cad1 pos1) == (Token j2s2 cad2 pos2) = j2s1 == j2s2 && (  j2s1 == Identifier ||
                                                                j2s1 == BooleanLiteral || j2s1 == CharacterLiteral ||
                                                                j2s1 == StringLiteral  || j2s1 == (DecimalIntegerLiteral )
                                                                || j2s1 == (HexIntegerLiteral )
                                                                || j2s1 == (OctalIntegerLiteral )
                                                                || j2s1 == (DecimalFloatingPointLiteral)
                                                                || j2s1 == (HexadecimalFloatingPointLiteral)
--                                                              || j2s1 == NullLiteral
                                || cad1 == cad2 )

instance Ord Token where
  (Token j2s1 cad1 pos1) <= (Token j2s2 cad2 pos2) = j2s1 < j2s2 || (j2s1 == j2s2 && cad1 <= cad2)
 
instance Symbol Token

-- Los parsers atomicos
obtenerVal (Token _ cad pos) = cad

tSym ::  J2sSc -> SimCode -> Parser Token SimCode
tSym j2s str   = obtenerVal <$> pSym (Token j2s str (initPos ""))

pIdentifier                      = tSym Identifier ""
pKeyWord       kw                = tSym KeyWord kw
pSpecialSimbol ss                = tSym SpecialSimbol ss
-- pConstant      co             = pASym Constant  co
pOperator      op                = tSym Operator op
pLineComment                     = tSym LineComment "" 
pBlockComment                    = tSym BlockComment ""
pError                           = tSym Error        ""  
pBooleanLiteral cb               =  (sem_Bool ) <$> tSym BooleanLiteral cb  
pCharacterLiteral                = tSym CharacterLiteral ""
pStringLiteral                   = tSym StringLiteral ""
pTokMayor      op                = tSym TokMayor op



pDecimalIntegerLiteral           =  tSym DecimalIntegerLiteral ""
pHexIntegerLiteral               =  tSym HexIntegerLiteral ""
pOctalIntegerLiteral             =  tSym OctalIntegerLiteral ""
pDecimalFloatingPointLiteral     =  tSym DecimalFloatingPointLiteral "" 
pHexadecimalFloatingPointLiteral =  tSym HexadecimalFloatingPointLiteral ""

{-
pDecimalIntegerLiteral           =  sem_Integer <$> tSym DecimalIntegerLiteral ""
pHexIntegerLiteral               =  sem_Integer <$> tSym HexIntegerLiteral ""
pOctalIntegerLiteral             =  sem_Integer <$> tSym OctalIntegerLiteral ""
pDecimalFloatingPointLiteral     = sem_Floating <$> tSym DecimalFloatingPointLiteral "" 
pHexadecimalFloatingPointLiteral = sem_Floating <$> tSym HexadecimalFloatingPointLiteral ""

-- sem_Integer x = read x :: Integer
-- sem_Floating x = read x :: Double 

-}

pNullLiteral      "null"   = tSym NullLiteral "null"

-- pIntegerLiteral              = tSym (IntegerLiteral pIntLiteral) ""
-- pIntLiteral                  = sem_IntLiteral_DecimalIntegerLiteral
--                            <|> sem_IntLiteral_HexIntegerLiteral
--                            <|> sem_IntLiteral_OctalIntegerLiteral

-- pDecimalIntegerLiteral =  
-- pHexIntegerLiteral     =
-- pOctalIntegerLiteral   =

-- sem_IntLiteral_DecimalIntegerLiteral = DecimalIntegerLiteral
-- sem_IntLiteral_HexIntegerLiteral     = HexIntegerLiteral
-- sem_IntLiteral_OctalIntegerLiteral   = OctalIntegerLiteral
-- pFloatingLiteral             = tSym (FloatingLiteral) ""

-- pOperator'' ">" ">" ">" = tSym Operator "HS@J2SShift>>>ShiftJ2S@"
-- pOperator'  ">" ">"     = tSym Operator "HS@J2SShift>>ShiftJ2s@"

sem_Bool x | x == "true" = True
                   | x == "false" = False
                   | otherwise    = error "Boolean Literal error"