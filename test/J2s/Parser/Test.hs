{-# LANGUAGE FlexibleContexts #-}
module J2s.Parser.Test where

import Content
import J2s.Ast.Syntax
import J2s.Parser
import Control.Monad ( forM, forM_, liftM )
import Debug.Trace ( trace )
import System.Environment ( getArgs )
import System.IO.Unsafe ( unsafeInterleaveIO )

import Control.Proxy
import Control.Proxy.Safe
import UU.Parsing

path = "/home/andrea/"

test001Parser = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/java/openjdk-6-src-b27/jdk/test/javax/xml/crypto/dsig/GenerationTests.java")

testSingleParser = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/java/CharArrayPropertyEditorTests.java")

testParser :: IO()
testParser  = runSafeIO $ runProxy $ runEitherK $
                    contentsRecursive (path ++ "workspaceclipse_haskell/java2scala/test/J2s/java/openjdk-6-src-b27/jdk/") />/ handlerParser

testParserJavaTest :: IO()
testParserJavaTest  = runSafeIO $ runProxy $ runEitherK $
                    contentsRecursive (path ++ "workspaceclipse_haskell/java2scala/test/J2s/java/openjdk-6-src-b27/jdk/test/java/lang/StrictMath/") />/ handlerParser

testParserJavaTest2 :: IO()
testParserJavaTest2  = runSafeIO $ runProxy $ runEitherK $
                    contentsRecursive (path ++ "workspaceclipse_haskell/java2scala/test/J2s/java/openjdk-6-src-b27/langtools/test/") />/ handlerParser

testParserEncodingDir :: IO()
testParserEncodingDir = runSafeIO $ runProxy $ runEitherK $
                                      contentsRecursive (path ++ "workspaceclipse_haskell/java2scala/test/J2s/java/openjdk-6-src-b27/langtools/test/com/sun/javadoc/testEncoding/") />/ handlerParser

-- Todo check syntax
tsp0 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/0compilationUnit.java")
tsp1 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/1compilationUnitSimple.java")
tsp2 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/2packageDeclarationMarkerAnnotation.java")
tsp2_1 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/2packageDeclarationNormalAnnotation1.java")
tsp2_2 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/2packageDeclarationNormalAnnotation2.java")
tsp2_3 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/2packageDeclarationNormalAnnotation3.java")
tsp2_4 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/2packageDeclarationSimple.java")
tsp2_5 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/2packageDeclarationSingleElementAnnotation1.java")
tsp7 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/7elementValuePairs.java")
tsp8 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/8elementValuePair.java")
tsp9 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/9elementValue.java")
tsp10 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/10conditionalExpression.java")
tsp11 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/11conditionalOrExpression.java")
tsp17 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/17relationalExpression.java")
tsp18 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/18shiftExpression.java")
tsp19 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/19additiveExpression.java")
tsp21 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/21unaryExpression.java")
tsp24 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/24unaryExpressionNotPlusMinus.java")
tsp25 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/25postfixExpression.java")
tsp26 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/26primary.java")
tsp27 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/27primaryNoNewArray.java")
tsp28 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/28literal.java")
tsp29 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/29type.java")
tsp30 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/30primitiveType.java")
tsp34 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/34referenceType.java")
tsp35 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/35classOrInterfaceType.java")
tsp38 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/38typeArguments.java")
tsp40 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/40actualTypeArgument.java")
tsp47 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/47expression.java")
tsp49 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/49assignment.java")
tsp56 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/56classInstanceCreationExpression.java")
tsp58 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/58methodInvocation.java")
tsp62 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/62arrayCreationExpression.java")
tsp69 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/69postIncrementExpression.java")
tsp70 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/70postDecrementExpression.java")
tsp71 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/71castExpression.java")
tsp72 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/72elementValueArrayInitializer.java")
tsp76 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/76packageName.java")
tsp77 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/77importDeclarations.java")
tsp84 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/84typeDeclarations.java")
tsp85 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/85typeDeclaration0.java")
tsp85_1 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/85typeDeclaration1.java")
tsp85_2 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/85typeDeclaration2.java")
tsp86_1 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/86classDeclaration1.java")
tsp87 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/87normalClassDeclaration.java")
tsp92 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/92typeParameter.java")
tsp96 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/96super.java")
tsp97 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/97interfaces.java")
tsp99 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/99classBody.java")
tsp102 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/102classMemberDeclaration.java")
tsp110 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/110methodDeclaration.java")
tsp127 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/127block.java")
tsp132 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/132statement.java")
tsp132_1 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/132statement1.java")
tsp133 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/133statementWithoutTrailingSubstatement.java")
tsp154 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/154switchStatement.java")
tsp162 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/162doStatement.java")
tsp166 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/166ifThenElseStatement.java")
tsp167 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/167statementNoShortIf.java")
tsp179 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/179interfaceDeclaration.java")
tsp193 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/193annotationTypeDeclaration.java")
tsp198 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/198enumDeclaration.java")
tsp203 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/203instanceInitializer.java")
tsp204 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/204staticInitializer.java")
tsp205 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/205constructorDeclaration.java")
tspClase = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/Clase.java")
tspclase1 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/clase1.java")
tspclase2 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/clase2.java")
tspClass = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/Class.java")
tspEV = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/elemenValueVsElementValuePairs.java")
tspImport = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/Import.java")
tspPI = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/PackageImportTest.java")
tspPC = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/PruebaConditionalExpression.java")
tspPP = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/PruebaParser.java")

tspj1 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/java/AbstractApplicationContextTests.java")
tspj2 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/java/AbstractAttributes.java")
tspj3 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/java/AbstractBeanFactoryTests.java")
tspj4 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/java/AbstractControlFlowTests.java")
tspj5 = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/java/AbstractListableBeanFactoryTests.java")

tspj = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/java/CharArrayPropertyEditorTests.java")

tmp = parser (path ++ "workspaceclipse_haskell/java2scala/test/J2s/Parser/TmpImport.java")