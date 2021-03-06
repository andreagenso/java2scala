module Main where

import J2s.Scanner.Test
import J2s.Parser.Test
import J2s.Ast.Syntax

import J2s.Scanner.Position
import J2s.Scanner
import UU.Scanner.Position
import Control.Exception.Base (evaluate)
import J2s.Scanner.Token
import Control.Monad (when, unless)
import Content

import Control.Monad ( forM, forM_, liftM )
import Debug.Trace ( trace )
import System.Directory ( doesDirectoryExist, getDirectoryContents )
import System.Environment ( getArgs )
import System.FilePath ( (</>) )
import System.IO.Unsafe ( unsafeInterleaveIO )
import UU.Parsing

main :: IO()
main = do f <- getLine
          let command = test f
          command

test :: String -> IO()
test "singleparser" = testSingleParser
test "testparser" = testParser

test "tmp" = tmp

test "tsp0" = tsp0
test "tsp1" = tsp1
test "tsp2" = tsp2
test "tsp2_1" = tsp2_1
test "tsp2_2" = tsp2_2
test "tsp2_3" = tsp2_3
test "tsp2_4" = tsp2_4
test "tsp2_5" = tsp2_5
test "tsp7" = tsp7
test "tsp8" = tsp8
test "tsp9" = tsp9
test "tsp10" = tsp10
test "tsp11" = tsp11
test "tsp17" = tsp17
test "tsp18" = tsp18
test "tsp19" = tsp19
test "tsp21" = tsp21
test "tsp24" = tsp24
test "tsp25" = tsp25
test "tsp26" = tsp26
test "tsp27" = tsp27
test "tsp28" = tsp28
test "tsp29" = tsp29
test "tsp30" = tsp30
test "tsp34" = tsp34
test "tsp35" = tsp35
test "tsp38" = tsp38
test "tsp40" = tsp40
test "tsp47" = tsp47
test "tsp49" = tsp49
test "tsp56" = tsp56
test "tsp58" = tsp58
test "tsp62" = tsp62
test "tsp69" = tsp69
test "tsp70" = tsp70
test "tsp71" = tsp71
test "tsp72" = tsp72
test "tsp76" = tsp76
test "tsp77" = tsp77
test "tsp84" = tsp84
test "tsp85" = tsp85
test "tsp85_1" = tsp85_1
test "tsp85_2" = tsp85_2
test "tsp86_1" = tsp86_1
test "tsp87" = tsp87
test "tsp92" = tsp92
test "tsp96" = tsp96
test "tsp97" = tsp97
test "tsp99" = tsp99
test "tsp102" = tsp102
test "tsp110" = tsp110
test "tsp127" = tsp127
test "tsp132" = tsp132
test "tsp132_1" = tsp132_1
test "tsp133" = tsp133
test "tsp154" = tsp154
test "tsp162" = tsp162
test "tsp166" = tsp166
test "tsp167" = tsp167
test "tsp179" = tsp179
test "tsp193" = tsp193
test "tsp198" = tsp198
test "tsp203" = tsp203
test "tsp204" = tsp204
test "tsp205" = tsp205
test "tspClase" = tspClase
test "tspclase1" = tspclase1
test "tspclase2" = tspclase2
test "tspClass" = tspClass
test "tspEV" = tspEV
test "tspImport" = tspImport
test "tspPI" = tspPI
test "tspPC" = tspPC
test "tspPP" =  tspPP

test "tspj1" = tspj1
test "tspj2" = tspj2
test "tspj3" = tspj3
test "tspj4" = tspj4
test "tspj5" = tspj5
test "tspj" = tspj

-- scanner
test "t001" = test001
test "tp001" = test001Parser

test "testscanner"  = testScanner
test "testjavatest"  = testJavaTest
test "testencodingdir" = testEncodingDir
test "scannerwitherror" = testScannerWithError
test "singlescanner" = testSingleScanner

test "testencode" = testEncode
test "testfloat" = testFloat
test "testfloat2" = testFloat2
test "tssswitchboard" = tssswitchboard

test "tss0" = tss0
test "tss1" = tss1
test "tss2" = tss2
test "tss2_1" = tss2_1
test "tss2_2" = tss2_2
test "tss2_3" = tss2_3
test "tss2_4" = tss2_4
test "tss2_5" = tss2_5
test "tss7" = tss7
test "tss8" = tss8
test "tss9" = tss9
test "tss10" = tss10
test "tss11" = tss11
test "tss17" = tss17
test "tss18" = tss18
test "tss19" = tss19
test "tss21" = tss21
test "tss24" = tss24
test "tss25" = tss25
test "tss26" = tss26
test "tss27" = tss27
test "tss28" = tss28
test "tss29" = tss29
test "tss30" = tss30
test "tss34" = tss34
test "tss35" = tss35
test "tss38" = tss38
test "tss40" = tss40
test "tss47" = tss47
test "tss49" = tss49
test "tss56" = tss56
test "tss58" = tss58
test "tss62" = tss62
test "tss69" = tss69
test "tss70" = tss70
test "tss71" = tss71
test "tss72" = tss72
test "tss76" = tss76
test "tss77" = tss77
test "tss84" = tss84
test "tss85" = tss85
test "tss85_1" = tss85_1
test "tss85_2" = tss85_2
test "tss86_1" = tss86_1
test "tss87" = tss87
test "tss92" = tss92
test "tss96" = tss96
test "tss97" = tss97
test "tss99" = tss99
test "tss102" = tss102
test "tss110" = tss110
test "tss127" = tss127
test "tss132" = tss132
test "tss132_1" = tss132_1
test "tss133" = tss133
test "tss154" = tss154
test "tss162" = tss162
test "tss166" = tss166
test "tss167" = tss167
test "tss179" = tss179
test "tss193" = tss193
test "tss198" = tss198
test "tss203" = tss203
test "tss204" = tss204
test "tss205" = tss205
test "tssClase" = tssClase
test "tssclase1" = tssclase1
test "tssclase2" = tssclase2
test "tssClass" = tssClass
test "tssEV" = tssEV
test "tssImport" = tssImport
test "tssPI" = tssPI
test "tssPC" = tssPC
test "tssPP" =  tssPP

test "tssj" = tssj
test "tsiset"  = tsiset

test _ = print ("Command not found!!")