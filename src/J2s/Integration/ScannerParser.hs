{-# LANGUAGE UndecidableInstances #-}
module J2s.Integration.ScannerParser where

import J2s.Scanner.Token
import UU.Scanner.Position
import UU.Parsing

instance Eq J2sSc => Eq Token where
  (Token Identifier _ _) == (Token Identifier _ _) = True
  (Token BooleanLiteral _ _) == (Token BooleanLiteral _ _) = True
  (Token CharacterLiteral _ _) == (Token CharacterLiteral _ _) = True
  (Token StringLiteral _ _) == (Token StringLiteral _ _) = True
  (Token DecimalIntegerLiteral _ _) == (Token DecimalIntegerLiteral _ _) = True
  (Token HexIntegerLiteral _ _) == (Token HexIntegerLiteral _ _) = True
  (Token OctalIntegerLiteral _ _) == (Token OctalIntegerLiteral _ _) = True
  (Token DecimalFloatingPointLiteral _ _) == (Token DecimalFloatingPointLiteral _ _) = True
  (Token HexadecimalFloatingPointLiteral _ _) == (Token HexadecimalFloatingPointLiteral _ _) = True
  (Token KeyWord cad1 _) == (Token KeyWord cad2 _) = cad1 == cad2
  (Token SpecialSimbol cad1 _) == (Token SpecialSimbol cad2 _) = cad1 == cad2
  (Token Operator cad1 _) == (Token Operator cad2 _) = cad1 == cad2
  (Token LineComment _ _) == (Token LineComment _ _) = True
  (Token BlockComment _ _) == (Token BlockComment _ _) = True
  (Token NullLiteral _ _) == (Token NullLiteral _ _) = True
  (Token TokMayor _ _) == (Token TokMayor _ _) = True
  (Token Error _ _) == (Token Error _ _) = True
  (Token j2s1 cad1 pos1) == (Token j2s2 cad2 pos2) = (j2s1 == j2s2 && (j2s1 == Identifier ||
                                                     j2s1 == BooleanLiteral ||
                                                     j2s1 == CharacterLiteral ||
                                                     j2s1 == StringLiteral ||
                                                     j2s1 == DecimalIntegerLiteral ||
                                                     j2s1 == HexIntegerLiteral ||
                                                     j2s1 == OctalIntegerLiteral ||
                                                     j2s1 == DecimalFloatingPointLiteral ||
                                                     j2s1 == HexadecimalFloatingPointLiteral ||
                                                     j2s1 == LineComment ||
                                                     j2s1 == BlockComment ||
                                                     j2s1 == NullLiteral ||
                                                     j2s1 == TokMayor ||
                                                     j2s1 == Error
                                                     )) ||
                                                     (j2s1 == j2s2 && cad1 == cad2 && (j2s1 == KeyWord ||
                                                        j2s1 == SpecialSimbol ||
                                                        j2s1 == Operator
                                                     ))

instance Ord Token where
  (Token j2s1 cad1 pos1) <= (Token j2s2 cad2 pos2) = j2s1 < j2s2 || (j2s1 == j2s2 && cad1 <= cad2)
 
instance Symbol Token

-- Los parsers atomicos
obtenerVal (Token _ cad pos) = cad

tSym ::  J2sSc -> SimCode -> Parser Token SimCode
tSym j2s str   = obtenerVal <$> pSym (Token j2s str (initPos ""))

pIdentifier                      = tSym Identifier   ""
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

pNullLiteral      "null"   = tSym NullLiteral "null"

-- ToDo check when operators will be tested
-- pOperator'' ">" ">" ">" = tSym Operator "HS@J2SShift>>>ShiftJ2S@"
-- pOperator'  ">" ">"     = tSym Operator "HS@J2SShift>>ShiftJ2s@"

sem_Bool x | x == "true" = True
                   | x == "false" = False
                   | otherwise    = error "Boolean Literal error"