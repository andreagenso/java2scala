module J2s.Scanner.Lexical where

import J2s.Scanner.Token

-- Reserved Simbols of language        
keyWord :: [KeyWord]

keyWord = ["abstract","continue","for","new","switch",
           "assert","default","if","package","synchronized",
           "boolean","do","goto","private","this",
           "break","double","implements","protected","throw",
           "byte","else","import","public","throws",
           "case","enum","instanceof","return","transient",
           "catch","extends","int","short","try",
           "char","final","interface","static","void",
           "class","finally","long","strictfp","volatile",
           "const","float","native","super","while", "int","long", "short"
           ]

specialSimbol :: [SpecialSimbol]
specialSimbol = [",",";","{","}","<%","%>",".","(",")","=","[","]","@"]

constantBool ::[Constant]
constantBool = ["true","false"]

operatorList :: [Operator]
operatorList = [">>>=","<<=",">>=",">>>=",">>>","==","<=",">=","!=","+=","-=","*=","/=","&=","|=","^=","%=","&&","||","++","--","<<",">>",">","<","!","~","?",":","+","-","*","/","&","|","^","%"]
--operatorList = [">>>=","<<=",">>=",">>>=","==","<=",">=","!=","+=","-=","*=","/=","&=","|=","^=","%=","&&","||","++","--","<<","<","!","~","?",":","+","-","*","/","&","|","^","%"]

majorList :: [String]
majorList = [">>>",">>",">"]

digits :: [String]
digits = ["0","1","2","3","4","5","6","7","8","9"]