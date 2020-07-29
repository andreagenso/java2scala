# java2scala

Java2Scala is a project which convert Java files to Scala. It receives Java 7 Specification languages and transform them to Scala 10.
Structures involved:
* primitives
* variables
* modifiers
* static values
* static methods
* static classes
* collections
* iterations transformed to high order functions and `for-yield`
* classes
* interfaces
* imports
* packages

# How to use:
core code is developed in Haskell and AG:

AG Basic commands:

-- PROF
cabal clean
cabal configure --enable-library-profiling --enable-executable-profiling --enable-tests --enable-benchmarks
cabal build
cabal install --enable-profiling --ghc-options="-DEXTERNAL_UUAGC -fprof-auto -rtsopts"

./test +RTS -p

-- UUAGC
cabal clean
cabal configure --ghc-options="-DEXTERNAL_UUAGC"
cabal build --ghc-options="-DEXTERNAL_UUAGC"
cabal install --ghc-options="-DEXTERNAL_UUAGC"

./dist/build/java2scala/java2scala  "/home/andrea/workspaceclipse_haskell/java2scala/test/Example.java"
-- "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/TmpImport.java"

./dist/build/java2scala/java2scala "/home/andrea/workspaceclipse_haskell/java2scala/test/J2s/Parser/1compilationUnitSimple.java"



