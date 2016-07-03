module J2s.Scanner.Test where

import J2s.Scanner
import Content

import J2s.Scanner.Position
import UU.Scanner.Position
import Control.Exception(evaluate)
import Control.Monad(forM, liftM)



--import Control.Proxy
--import Control.Proxy.Safe hiding (readFileS)
import Pipes
import System.FilePath ((</>), takeFileName)
import Content



testSingleScanner = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/java/openjdk-6-src-b27/jdk/src/share/classes/com/sun/demo/jvmti/hprof/Tracker.java"

{-
testScanner  = runSafeIO $ runProxy $ runEitherK $
                    contentsRecursive "/home/andrea/workspaceclipse_haskell/java2scala/test" />/ handler

testJavaTest  = runSafeIO $ runProxy $ runEitherK $
                    contentsRecursive "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/java/openjdk-6-src-b27/jdk/test/java/lang/StrictMath/" />/ handler

testJavaTest2  = runSafeIO $ runProxy $ runEitherK $
                    contentsRecursive "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/java/openjdk-6-src-b27/langtools/test/" />/ handler

testEncodingDir = runSafeIO $ runProxy $ runEitherK $
                                      contentsRecursive "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/java/openjdk-6-src-b27/langtools/test/com/sun/javadoc/testEncoding/" />/ handler
-}

-- OK resolved testFloat = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/java/openjdk-6-src-b27/jdk/test/java/lang/StrictMath/Expm1Tests.java"
-- testear codificacion
testEncode = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/java/openjdk-6-src-b27/langtools/test/com/sun/javadoc/testEncoding/EncodeTest.java"
testFloat = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/java/openjdk-6-src-b27/jdk/test/java/lang/StrictMath/Log1pTests.java"
testFloat2 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/tmp/testfloat.java"
tssswitchboard = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/java/SwitchBoardController.java"

testScannerWithError1 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/java/openjdk-6-src-b27/jdk/test/sun/security/rsa/TestKeyFactory.java"
testScannerWithError2  = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/java/openjdk-6-src-b27/jdk/test/com/sun/crypto/provider/Cipher/DES/PerformanceTest.java"
testScannerWithError  = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/java/openjdk-6-src-b27/jdk/test/java/lang/StrictMath/Log1pTests.java"

-- todo check sintax
tss0 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/0compilationUnit.java"
tss1 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/1compilationUnitSimple.java"
tss2 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/2packageDeclarationMarkerAnnotation.java"
tss2_1 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/2packageDeclarationNormalAnnotation1.java"
tss2_2 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/2packageDeclarationNormalAnnotation2.java"
tss2_3 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/2packageDeclarationNormalAnnotation3.java"
tss2_4 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/2packageDeclarationSimple.java"
tss2_5 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/2packageDeclarationSingleElementAnnotation1.java"
tss7 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/7elementValuePairs.java"
tss8 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/8elementValuePair.java"
tss9 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/9elementValue.java"
tss10 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/10conditionalExpression.java"
tss11 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/11conditionalOrExpression.java"
tss17 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/17relationalExpression.java"
tss18 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/18shiftExpression.java"
tss19 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/19additiveExpression.java"
tss21 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/21unaryExpression.java"
tss24 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/24unaryExpressionNotPlusMinus.java"
tss25 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/25postfixExpression.java"
tss26 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/26primary.java"
tss27 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/27primaryNoNewArray.java"
tss28 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/28literal.java"
tss29 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/29type.java"
tss30 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/30primitiveType.java"
tss34 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/34referenceType.java"
tss35 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/35classOrInterfaceType.java"
tss38 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/38typeArguments.java"
tss40 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/40actualTypeArgument.java"
tss47 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/47expression.java"
tss49 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/49assignment.java"
tss56 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/56classInstanceCreationExpression.java"
tss58 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/58methodInvocation.java"
tss62 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/62arrayCreationExpression.java"
tss69 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/69postIncrementExpression.java"
tss70 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/70postDecrementExpression.java"
tss71 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/71castExpression.java"
tss72 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/72elementValueArrayInitializer.java"
tss76 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/76packageName.java"
tss77 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/77importDeclarations.java"
tss84 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/84typeDeclarations.java"
tss85 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/85typeDeclaration0.java"
tss85_1 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/85typeDeclaration1.java"
tss85_2 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/85typeDeclaration2.java"
tss86_1 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/86classDeclaration1.java"
tss87 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/87normalClassDeclaration.java"
tss92 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/92typeParameter.java"
tss96 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/96super.java"
tss97 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/97interfaces.java"
tss99 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/99classBody.java"
tss102 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/102classMemberDeclaration.java"
tss110 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/110methodDeclaration.java"
tss127 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/127block.java"
tss132 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/132statement.java"
tss132_1 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/132statement1.java"
tss133 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/133statementWithoutTrailingSubstatement.java"
tss154 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/154switchStatement.java"
tss162 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/162doStatement.java"
tss166 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/166ifThenElseStatement.java"
tss167 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/167statementNoShortIf.java"
tss179 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/179interfaceDeclaration.java"
tss193 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/193annotationTypeDeclaration.java"
tss198 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/198enumDeclaration.java"
tss203 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/203instanceInitializer.java"
tss204 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/204staticInitializer.java"
tss205 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/205constructorDeclaration.java"
tssClase = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/Clase.java"
tssclase1 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/clase1.java"
tssclase2 = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/clase2.java"
tssClass = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/Class.java"
tssEV = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/elemenValueVsElementValuePairs.java"
tssImport = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/Import.java"
tssPI = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/PackageImportTest.java"
tssPC = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/PruebaConditionalExpression.java"
tssPP = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/PruebaParser.java"

tssj = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/java/CharArrayPropertyEditorTests.java"
tsiset = scanner "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/java/InputStreamEditorTests.java"

