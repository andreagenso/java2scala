# Java to Scala
Convert Java code to Scala

## Introduction

>
####ESPAÑOL: 
El proyecto se centra en la conversión de código Java a código Scala en un contexto de migración o cambio de tecnología. Para ello los objetivos centrales son la construcción de una gramática libre de contexto que represente el lenguaje origen, elaboración de un analizador lexicográfico, elaboración de un analizador sintáctico, identificación y desarrollo de condiciones de contexto, y generación de código.
La propuesta de desarrollo de la aplicación J2S se centra en la conversión de aquellas estructuras más utilizadas en el lenguaje Java, para ello se fundamenta cuáles son y porque fueron elegidas. El código Java base a convertir corresponde con la versión especificada en la tercera edición de la especificación del lenguaje y se asume como precondición que el código Java es compilado correctamente.
Las fundamentaciones teóricas se centran en la teoría de diseño de compiladores, partiendo del diseño de gramáticas libres de contexto, aplicación de transformación de gramáticas, análisis lexicografico, análisis sintáctico condiciones del contexto y síntesis del programa objeto. Por otro lado, se aborda las características de los lenguajes de programación Java y Scala y se propone un alcance fundamentado en una combinación de identificación de patrones referidos a las convenciones de Java e investigaciones previas de autores que determinan en términos de porcentajes la utilizacion de instrucciones Java en aplicaciones reales. 
El área de aplicación abordado es el diseño de compiladores, bajo el paradigma de la programación funcional, desarrollado en el lenguaje de programacion Haskell y con soporte en las herramientas y bibliotecas: uuparsing-lib, uuagc, cabal, pipes, ghc. Bajo una metodología basada en un enfoque ágil, iterativo e incremental. 

> 
####ENGLISH: 
The project focuses on the conversion of Java code to Scala code in a context of migration or technology change. For this, the central objectives are the construction of a context-free grammar that represents the source language, development of a lexicographic analyzer, elaboration of a parser, identification and development of context conditions, and code generation.
The development proposal of the J2S application focuses on the conversion of those structures most used in the Java language, based on what they are and why they were chosen. The Java base code to convert corresponds to the version specified in the third edition of the language specification and it is assumed as precondition that the Java code is compiled correctly.
The theoretical foundations focus on compiler design theory, starting from the design of context free grammars, application of grammars transformation, lexicographic analysis, syntactic analysis context conditions and synthesis of the object program. On the other hand, the characteristics of Java and Scala programming languages ​​are discussed, and a scope based on a combination of pattern identification related to Java conventions and previous authors' investigations is proposed that determine in terms of percentages the use of instructions Java in real applications.
The application area addressed is the design of compilers, under the paradigm of functional programming, developed in Haskell programming language and with support in tools and libraries: uuparsing-lib, uuagc, cabal, pipes, ghc. Under a methodology based on an agile, iterative and incremental approach.

## Ejemplos de uso / Samples use

> 
####ESPAÑOL:  
Use java2scala nombrearchivo.java y obtendrá un archivo namefile.scala
> 
####ENGLISH: 
Use java2scala namefile.java and you will get a namefile.scala

## Instalación de ejecutables/Installation of executables

> 
####ESPAÑOL: 
Debian Linux de 64 bits. copie el archivo java2scala y ejecute desde la terminal.
Windows de 64 bits. copie el archivo java2scala.exe y ejecute desde cmdos

> 
####ENGLISH: 
Debian Linux de 64 bits. copy the file java2scala y execute in console.
Windows de 64 bits. copy the file java2scala.exe y execute in cmdos.

## Instalacón de la herramienta / Installation

> 
####ESPAÑOL: 
Instale Haskell Platform y ejecute la aplicación con las Instrucciones de la sección que lleva el mismo nombre, en base a sus necesidades, basta con la sección UUAGC.

> 
####ENGLISH: 
Install Haskell Platform and execute next instructions (based on your needs):

####Instrucciones / Instructions:

#####UUAGC
cabal clean
cabal configure --ghc-options="-DEXTERNAL_UUAGC"
cabal build --ghc-options="-DEXTERNAL_UUAGC"
cabal install --ghc-options="-DEXTERNAL_UUAGC"

#####Profile
cabal clean
cabal configure --enable-library-profiling --enable-executable-profiling --enable-tests --enable-benchmarks 
cabal build 
cabal install --enable-profiling --ghc-options="-DEXTERNAL_UUAGC -fprof-auto -rtsopts"

./test +RTS -p

#####Generacion de tokens / Tokens generation [branch token_generation]
./dist/build/java2scala/java2scala  "/path/java2scala/test/Example.java"

./dist/build/test/test
testscanner

#####Generacion ASA / ASA generation [branch ast_generation]]
./dist/build/java2scala/java2scala  "/path/java2scala/test/Example.java"

javac "/path/java2scala/test/J2s/java/summary/AbstractSequentialList.java"
./dist/build/java2scala/java2scala "/path/java2scala/test/J2s/java/summary/Example.java"
 
./dist/build/test/test
testparser

#####Generacion AG - codigo Scala / AG generation - Scala code [branch master]
./dist/build/java2scala/java2scala  "/path/java2scala/test/Example.java"